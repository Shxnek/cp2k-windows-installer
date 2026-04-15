; CP2K Windows 安装包脚本
; 由 GitHub Actions 自动编译

#define AppName "CP2K"
#define AppVersion "2024"
#define AppURL "https://www.cp2k.org"

[Setup]
AppId={{A1B2C3D4-E5F6-7890-ABCD-EF1234567890}
AppName={#AppName}
AppVersion={#AppVersion}
AppPublisher=CP2K Community
AppPublisherURL={#AppURL}
AppComments=量子化学与固体物理计算软件
DefaultDirName=C:\CP2K
DefaultGroupName=CP2K
OutputDir=..\output
OutputBaseFilename=CP2K_{#AppVersion}_Windows安装包
Compression=lzma2/ultra64
SolidCompression=yes
WizardStyle=modern
PrivilegesRequired=admin
MinVersion=10.0.19041
UninstallDisplayName=CP2K 量子化学计算软件
; 安装至少需要 6GB 可用空间
ExtraDiskSpaceRequired=6442450944

[Languages]
Name: "chinesesimplified"; MessagesFile: "compiler:Languages\ChineseSimplified.isl"

[Messages]
WelcomeLabel1=欢迎安装 CP2K {#AppVersion}
WelcomeLabel2=CP2K 是一款专业的量子化学与固体物理计算软件，广泛用于学术研究。%n%n安装程序将自动完成所有配置，安装后即可直接使用。%n%n%n安装前请确认：%n%n  ✓  电脑已接通电源%n  ✓  C 盘有至少 6GB 可用空间%n  ✓  已关闭杀毒软件的实时防护（可能误拦截）%n%n安装过程约需 3-5 分钟，期间请勿关机或断电。

[Tasks]
Name: "desktopicon"; Description: "在桌面创建 CP2K 快捷方式"; GroupDescription: "附加选项:"; Flags: checkedonce

[Files]
Source: "..\cp2k_distro.tar";          DestDir: "{app}"; Flags: ignoreversion
Source: "..\scripts\run_cp2k.bat";     DestDir: "{app}"; Flags: ignoreversion
Source: "..\scripts\cp2k_shell.bat";   DestDir: "{app}"; Flags: ignoreversion
Source: "..\scripts\uninstall_wsl.ps1"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\README.txt";               DestDir: "{app}"; Flags: ignoreversion isreadme

[Icons]
Name: "{group}\CP2K 命令行";   Filename: "{app}\cp2k_shell.bat"; WorkingDir: "{app}"
Name: "{group}\CP2K 使用说明"; Filename: "{app}\README.txt"
Name: "{group}\卸载 CP2K";     Filename: "{uninstallexe}"
Name: "{userdesktop}\CP2K";    Filename: "{app}\cp2k_shell.bat"; WorkingDir: "{app}"; Tasks: desktopicon

[UninstallRun]
Filename: "wsl.exe"; Parameters: "--unregister CP2K"; Flags: runhidden

[Code]

var
  ProgressPage: TOutputProgressWizardPage;

// ────────────────────────────────────────────────
// 安装前检查：系统版本 / 磁盘空间 / WSL2
// ────────────────────────────────────────────────
function InitializeSetup(): Boolean;
var
  ResultCode: Integer;
  FreeSpace, TotalSpace: Int64;
begin
  Result := True;

  // 1. Windows 版本（最低 Win10 2004）
  if GetWindowsVersion < $0A003905 then begin
    MsgBox(
      '系统版本不符合要求' + #13#10 + #13#10 +
      '需要 Windows 10 2004（Build 19041）或更高版本。' + #13#10 +
      '当前系统版本过低，请先更新 Windows 再安装。',
      mbError, MB_OK);
    Result := False;
    Exit;
  end;

  // 2. 磁盘空间（至少 6GB）
  GetSpaceOnDisk('C:\', True, FreeSpace, TotalSpace);
  if FreeSpace < 6442450944 then begin
    if MsgBox(
      'C 盘可用空间不足' + #13#10 + #13#10 +
      '安装 CP2K 至少需要 6GB 可用空间。' + #13#10 +
      '当前 C 盘剩余空间：' + IntToStr(FreeSpace div 1073741824) + ' GB' + #13#10 + #13#10 +
      '建议清理磁盘后重试。是否仍要继续安装？',
      mbConfirmation, MB_YESNO) = IDNO then begin
      Result := False;
      Exit;
    end;
  end;

  // 3. WSL2 可用性检测
  if not Exec('wsl.exe', '--status', '', SW_HIDE, ewWaitUntilTerminated, ResultCode)
     or (ResultCode <> 0) then begin
    if MsgBox(
      '未检测到 WSL2' + #13#10 + #13#10 +
      'CP2K 需要 Windows 子系统（WSL2）才能运行。' + #13#10 +
      '点击"是"将自动启用 WSL2，完成后需重启电脑，' + #13#10 +
      '重启后请再次运行安装程序。',
      mbConfirmation, MB_YESNO) = IDYES then begin
      Exec('dism.exe',
        '/online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart',
        '', SW_HIDE, ewWaitUntilTerminated, ResultCode);
      Exec('dism.exe',
        '/online /enable-feature /featurename:VirtualMachinePlatform /all /norestart',
        '', SW_HIDE, ewWaitUntilTerminated, ResultCode);
      MsgBox(
        'WSL2 已启用' + #13#10 + #13#10 +
        '请现在重启电脑，重启完成后再次运行本安装程序。',
        mbInformation, MB_OK);
    end;
    Result := False;
  end;
end;

// ────────────────────────────────────────────────
// 初始化：创建进度页面
// ────────────────────────────────────────────────
procedure InitializeWizard();
begin
  ProgressPage := CreateOutputProgressPage(
    '正在安装 CP2K',
    '请耐心等待，安装程序正在自动完成所有配置...'
  );
end;

// ────────────────────────────────────────────────
// 核心安装逻辑（含详细进度反馈）
// ────────────────────────────────────────────────
procedure CurStepChanged(CurStep: TSetupStep);
var
  ResultCode: Integer;
  AppDir, WslDistroDir, TarFile: String;
begin
  if CurStep <> ssPostInstall then Exit;

  AppDir       := ExpandConstant('{app}');
  WslDistroDir := AppDir + '\wsl_distro';
  TarFile      := AppDir + '\cp2k_distro.tar';

  ProgressPage.Show;
  try

    // ── 步骤 1/3：导入运行环境（最耗时）──
    ProgressPage.SetText(
      '步骤 1 / 3：导入 CP2K 运行环境',
      '正在解压并导入运行环境，通常需要 2-4 分钟，请勿关闭窗口...'
    );
    ProgressPage.SetProgress(0, 100);

    if not DirExists(WslDistroDir) then
      CreateDir(WslDistroDir);

    if not Exec('wsl.exe',
      '--import CP2K "' + WslDistroDir + '" "' + TarFile + '"',
      '', SW_HIDE, ewWaitUntilTerminated, ResultCode)
      or (ResultCode <> 0) then begin
      MsgBox(
        '运行环境导入失败（错误码：' + IntToStr(ResultCode) + '）' + #13#10 + #13#10 +
        '请尝试以下解决方法：' + #13#10 +
        '  1. 重启电脑后重新运行安装程序' + #13#10 +
        '  2. 在"开启或关闭 Windows 功能"中手动启用 WSL' + #13#10 +
        '  3. 确认 BIOS 中已开启虚拟化（Virtualization）' + #13#10 + #13#10 +
        '如问题持续，请访问 https://www.cp2k.org 获取帮助。',
        mbError, MB_OK);
      Exit;
    end;
    ProgressPage.SetProgress(65, 100);

    // ── 步骤 2/3：配置系统环境变量 ──
    ProgressPage.SetText(
      '步骤 2 / 3：配置系统环境变量',
      '将 CP2K 添加到 PATH，以便在任意命令行窗口中直接使用...'
    );
    ProgressPage.SetProgress(70, 100);

    Exec('powershell.exe',
      '-NoProfile -ExecutionPolicy Bypass -Command ' +
      '"$p=[Environment]::GetEnvironmentVariable(''Path'',''Machine'');' +
      'if($p -notlike ''*CP2K*''){' +
      '[Environment]::SetEnvironmentVariable(''Path'',$p+'';' + AppDir + ''',''Machine'')}"',
      '', SW_HIDE, ewWaitUntilTerminated, ResultCode);

    if ResultCode <> 0 then
      MsgBox(
        '环境变量配置失败，不影响正常使用。' + #13#10 +
        '你仍可通过双击桌面快捷方式来启动 CP2K。',
        mbInformation, MB_OK);
    ProgressPage.SetProgress(85, 100);

    // ── 步骤 3/3：清理临时文件 ──
    ProgressPage.SetText(
      '步骤 3 / 3：清理临时文件',
      '正在删除安装过程产生的临时文件，释放磁盘空间...'
    );
    ProgressPage.SetProgress(92, 100);

    if FileExists(TarFile) then
      DeleteFile(TarFile);

    ProgressPage.SetProgress(100, 100);
    ProgressPage.SetText('安装完成！', 'CP2K 已成功安装到你的电脑。');

  finally
    ProgressPage.Hide;
  end;
end;

// ────────────────────────────────────────────────
// 完成页：显示使用说明
// ────────────────────────────────────────────────
procedure CurPageChanged(CurPageID: Integer);
begin
  if CurPageID = wpFinished then
    WizardForm.FinishedLabel.Caption :=
      'CP2K 安装完成！' + #13#10 + #13#10 +
      '快速上手：' + #13#10 +
      '  · 双击桌面的 CP2K 图标，打开命令行环境' + #13#10 +
      '  · 将 .inp 输入文件拖拽到 CP2K 图标上直接运行' + #13#10 +
      '  · 示例文件位置：C:\CP2K\examples\' + #13#10 + #13#10 +
      '遇到问题？访问 https://www.cp2k.org 查阅文档。';
end;
