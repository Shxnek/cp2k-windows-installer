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
DefaultDirName=C:\CP2K
DefaultGroupName=CP2K
OutputDir=..\output
OutputBaseFilename=CP2K_{#AppVersion}_Windows安装包
Compression=lzma2/ultra64
SolidCompression=yes
WizardStyle=modern
PrivilegesRequired=admin
MinVersion=10.0.19041
SetupIconFile=
WizardImageFile=
UninstallDisplayName=CP2K 量子化学计算软件

[Languages]
Name: "chinesesimplified"; MessagesFile: "compiler:Languages\ChineseSimplified.isl"

[Tasks]
Name: "desktopicon"; Description: "在桌面创建快捷方式"; GroupDescription: "附加任务:"; Flags: checkedonce

[Files]
; CP2K 的 Linux 环境包（由 GitHub Actions 生成）
Source: "..\cp2k_distro.tar"; DestDir: "{app}"; Flags: ignoreversion

; 运行脚本
Source: "..\scripts\run_cp2k.bat";      DestDir: "{app}"; Flags: ignoreversion
Source: "..\scripts\cp2k_shell.bat";    DestDir: "{app}"; Flags: ignoreversion
Source: "..\scripts\uninstall_wsl.ps1"; DestDir: "{app}"; Flags: ignoreversion

; 说明文件
Source: "..\README.txt"; DestDir: "{app}"; Flags: ignoreversion isreadme

[Icons]
Name: "{group}\CP2K 命令行";   Filename: "{app}\cp2k_shell.bat"; WorkingDir: "{app}"
Name: "{group}\CP2K 使用说明"; Filename: "{app}\README.txt"
Name: "{group}\卸载 CP2K";     Filename: "{uninstallexe}"
Name: "{userdesktop}\CP2K";    Filename: "{app}\cp2k_shell.bat"; WorkingDir: "{app}"; Tasks: desktopicon

[Run]
; 第1步：导入 WSL 镜像（最耗时）
Filename: "wsl.exe"; \
    Parameters: "--import CP2K ""{app}\wsl_distro"" ""{app}\cp2k_distro.tar"""; \
    StatusMsg: "正在导入 CP2K 运行环境，请稍候（约需 2-3 分钟）..."; \
    Flags: waituntilterminated runhidden

; 第2步：添加到系统 PATH
Filename: "powershell.exe"; \
    Parameters: "-NoProfile -ExecutionPolicy Bypass -Command ""$p=[Environment]::GetEnvironmentVariable('Path','Machine'); if($p -notlike '*CP2K*'){{[Environment]::SetEnvironmentVariable('Path',$p+';{app}','Machine')}}"""; \
    StatusMsg: "正在配置系统环境变量..."; \
    Flags: runhidden waituntilterminated

[UninstallRun]
Filename: "wsl.exe"; Parameters: "--unregister CP2K"; Flags: runhidden

[Code]

// ── 全局变量 ──
var
  ProgressPage: TOutputProgressWizardPage;

// ── 安装前检查 ──
function InitializeSetup(): Boolean;
var
  ResultCode: Integer;
begin
  Result := True;

  if GetWindowsVersion < $0A003905 then begin
    MsgBox('需要 Windows 10 2004 (Build 19041) 或更高版本。' + #13#10 +
           '请先更新 Windows 后再安装。', mbError, MB_OK);
    Result := False;
    Exit;
  end;

  if not Exec('wsl.exe', '--status', '', SW_HIDE, ewWaitUntilTerminated, ResultCode) or
     (ResultCode <> 0) then begin
    if MsgBox('未检测到 WSL2。安装程序将自动启用，完成后需重启电脑。' + #13#10 +
              '是否继续？', mbConfirmation, MB_YESNO) = IDYES then begin
      Exec('dism.exe', '/online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart',
           '', SW_HIDE, ewWaitUntilTerminated, ResultCode);
      Exec('dism.exe', '/online /enable-feature /featurename:VirtualMachinePlatform /all /norestart',
           '', SW_HIDE, ewWaitUntilTerminated, ResultCode);
      MsgBox('WSL2 已启用，请重启电脑后重新运行安装程序。', mbInformation, MB_OK);
    end;
    Result := False;
  end;
end;

// ── 创建自定义进度页面 ──
procedure InitializeWizard();
begin
  ProgressPage := CreateOutputProgressPage(
    '正在安装 CP2K',
    '请耐心等待，安装程序正在配置运行环境...'
  );
end;

// ── 安装完成前：显示详细进度 ──
procedure CurStepChanged(CurStep: TSetupStep);
var
  ResultCode: Integer;
begin
  if CurStep = ssPostInstall then
  begin
    // 显示进度页面
    ProgressPage.Show;
    try
      // ── 步骤 1/3：导入运行环境 ──
      ProgressPage.SetText('步骤 1 / 3：正在导入 CP2K 运行环境', '这是最耗时的步骤，通常需要 2-4 分钟，请不要关闭窗口...');
      ProgressPage.SetProgress(0, 100);

      Exec('wsl.exe',
           '--import CP2K "' + ExpandConstant('{app}') + '\wsl_distro" "' +
           ExpandConstant('{app}') + '\cp2k_distro.tar"',
           '', SW_HIDE, ewWaitUntilTerminated, ResultCode);

      if ResultCode <> 0 then begin
        MsgBox('运行环境导入失败（错误码：' + IntToStr(ResultCode) + '）。' + #13#10 +
               '请确认 WSL2 已正确安装后重试。', mbError, MB_OK);
        Exit;
      end;
      ProgressPage.SetProgress(60, 100);

      // ── 步骤 2/3：配置环境变量 ──
      ProgressPage.SetText('步骤 2 / 3：正在配置系统环境变量', '将 CP2K 添加到系统 PATH，以便在任意位置使用...');
      ProgressPage.SetProgress(65, 100);

      Exec('powershell.exe',
           '-NoProfile -ExecutionPolicy Bypass -Command ' +
           '"$p=[Environment]::GetEnvironmentVariable(''Path'',''Machine'');' +
           'if($p -notlike ''*CP2K*''){' +
           '[Environment]::SetEnvironmentVariable(''Path'',$p+'';' +
           ExpandConstant('{app}') + ''',''Machine'')}"',
           '', SW_HIDE, ewWaitUntilTerminated, ResultCode);
      ProgressPage.SetProgress(80, 100);

      // ── 步骤 3/3：清理临时文件 ──
      ProgressPage.SetText('步骤 3 / 3：正在清理临时文件', '删除安装过程中产生的临时文件...');
      ProgressPage.SetProgress(85, 100);

      DelTree(ExpandConstant('{app}') + '\cp2k_distro.tar', False, True, False);
      ProgressPage.SetProgress(100, 100);

      ProgressPage.SetText('安装完成！', 'CP2K 已成功安装到您的电脑。');

    finally
      ProgressPage.Hide;
    end;
  end;
end;
