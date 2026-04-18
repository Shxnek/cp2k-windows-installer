; CP2K Windows Installer Script
; Automatically compiled by GitHub Actions

#define AppName "CP2K"
#define AppVersion "2023.1"
#define AppURL "https://www.cp2k.org"

[Setup]
AppId={{A1B2C3D4-E5F6-7890-ABCD-EF1234567890}
AppName={#AppName}
AppVersion={#AppVersion}
AppPublisher=CP2K Community
AppPublisherURL={#AppURL}
AppComments=Quantum Chemistry and Solid-State Physics Software
DefaultDirName=C:\CP2K
DefaultGroupName=CP2K
OutputDir=..\output
OutputBaseFilename=CP2K_{#AppVersion}_Windows_Setup
Compression=lzma2/ultra64
SolidCompression=yes
WizardStyle=modern
PrivilegesRequired=admin
MinVersion=10.0.19041
UninstallDisplayName=CP2K
ExtraDiskSpaceRequired=6442450944
SetupIconFile=cp2k.ico

; ── Languages: English (default) + Simplified Chinese ──
[Languages]
Name: "english";           MessagesFile: "compiler:Default.isl"
Name: "chinesesimplified"; MessagesFile: "compiler:Languages\ChineseSimplified.isl"

; ── Bilingual welcome messages ──
[Messages]
english.WelcomeLabel1=Welcome to CP2K {#AppVersion} Setup
english.WelcomeLabel2=CP2K is a professional quantum chemistry and solid-state physics software widely used in academic research.%n%nThe installer will complete all configuration automatically — ready to use immediately after installation.%n%n%nBefore proceeding, please confirm:%n%n  ✓  Your computer is plugged in to power%n  ✓  At least 6 GB of free space on drive C%n  ✓  Real-time antivirus protection is disabled (it may block the install)%n%nInstallation takes about 3–5 minutes. Do not shut down or unplug your computer during this time.

chinesesimplified.WelcomeLabel1=欢迎安装 CP2K {#AppVersion}
chinesesimplified.WelcomeLabel2=CP2K 是一款专业的量子化学与固体物理计算软件，广泛用于学术研究。%n%n安装程序将自动完成所有配置，安装后即可直接使用。%n%n%n安装前请确认：%n%n  ✓  电脑已接通电源%n  ✓  C 盘有至少 6GB 可用空间%n  ✓  已关闭杀毒软件的实时防护（可能误拦截）%n%n安装过程约需 3-5 分钟，期间请勿关机或断电。

; ── Bilingual custom strings ──
[CustomMessages]

; ----- Desktop shortcut task -----
english.DesktopIconDesc=Create a CP2K shortcut on the desktop
chinesesimplified.DesktopIconDesc=在桌面创建 CP2K 快捷方式

; ----- Start-menu / shortcut names -----
english.StartMenuShell=CP2K Shell
english.StartMenuReadme=CP2K README
english.StartMenuUninstall=Uninstall CP2K
english.DesktopLink=CP2K

chinesesimplified.StartMenuShell=CP2K 命令行
chinesesimplified.StartMenuReadme=CP2K 使用说明
chinesesimplified.StartMenuUninstall=卸载 CP2K
chinesesimplified.DesktopLink=CP2K

; ----- Progress page -----
english.ProgressTitle=Installing CP2K
english.ProgressDesc=Please wait while the installer completes all configuration…
english.Step1Title=Step 1 / 3: Importing CP2K Runtime
english.Step1Desc=Decompressing and importing the runtime environment. This usually takes 2–4 minutes — please do not close the window…
english.Step2Title=Step 2 / 3: Configuring Environment Variables
english.Step2Desc=Adding CP2K to PATH so it can be used from any command-line window…
english.Step3Title=Step 3 / 3: Cleaning Up Temporary Files
english.Step3Desc=Removing temporary files created during installation to free up disk space…
english.DoneTitle=Installation Complete!
english.DoneDesc=CP2K has been successfully installed on your computer.

chinesesimplified.ProgressTitle=正在安装 CP2K
chinesesimplified.ProgressDesc=请耐心等待，安装程序正在自动完成所有配置…
chinesesimplified.Step1Title=步骤 1 / 3：导入 CP2K 运行环境
chinesesimplified.Step1Desc=正在解压并导入运行环境，通常需要 2-4 分钟，请勿关闭窗口…
chinesesimplified.Step2Title=步骤 2 / 3：配置系统环境变量
chinesesimplified.Step2Desc=将 CP2K 添加到 PATH，以便在任意命令行窗口中直接使用…
chinesesimplified.Step3Title=步骤 3 / 3：清理临时文件
chinesesimplified.Step3Desc=正在删除安装过程产生的临时文件，释放磁盘空间…
chinesesimplified.DoneTitle=安装完成！
chinesesimplified.DoneDesc=CP2K 已成功安装到你的电脑。

; ----- Error / warning messages  (%1 = runtime parameter) -----
english.ErrOSVersion=Your operating system is not supported.%n%nWindows 10 2004 (Build 19041) or later is required.%nPlease update Windows and run the installer again.
english.ErrDiskSpace=Insufficient disk space.%n%nAt least 6 GB of free space on drive C is required.%nCurrent free space: %1 GB%n%nPlease free up space and retry. Continue anyway?
english.ErrWSL2Prompt=WSL2 not detected.%n%nCP2K requires the Windows Subsystem for Linux (WSL2).%nClick Yes to enable WSL2 automatically.%nYour computer will need to restart; run the installer again afterwards.
english.ErrWSL2Enabled=WSL2 has been enabled.%n%nPlease restart your computer now, then run this installer again.
english.ErrWSL2EnvFail=Failed to import runtime environment (error code: %1).%n%nSuggested fixes:%n  1. Restart your computer and run the installer again%n  2. Enable WSL manually via "Turn Windows features on or off"%n  3. Ensure virtualisation (VT-x / AMD-V) is enabled in BIOS%n%nFor further help visit https://www.cp2k.org
english.WarnEnvVar=Environment variable configuration failed — this will not affect normal use.%nYou can still launch CP2K by double-clicking the desktop shortcut.

chinesesimplified.ErrOSVersion=系统版本不符合要求。%n%n需要 Windows 10 2004（Build 19041）或更高版本。%n当前系统版本过低，请先更新 Windows 再安装。
chinesesimplified.ErrDiskSpace=C 盘可用空间不足。%n%n安装 CP2K 至少需要 6GB 可用空间。%n当前 C 盘剩余空间：%1 GB%n%n建议清理磁盘后重试。是否仍要继续安装？
chinesesimplified.ErrWSL2Prompt=未检测到 WSL2。%n%nCP2K 需要 Windows 子系统（WSL2）才能运行。%n点击"是"将自动启用 WSL2，完成后需重启电脑，%n重启后请再次运行安装程序。
chinesesimplified.ErrWSL2Enabled=WSL2 已启用。%n%n请现在重启电脑，重启完成后再次运行本安装程序。
chinesesimplified.ErrWSL2EnvFail=运行环境导入失败（错误码：%1）。%n%n请尝试以下解决方法：%n  1. 重启电脑后重新运行安装程序%n  2. 在"开启或关闭 Windows 功能"中手动启用 WSL%n  3. 确认 BIOS 中已开启虚拟化（Virtualization）%n%n如问题持续，请访问 https://www.cp2k.org 获取帮助。
chinesesimplified.WarnEnvVar=环境变量配置失败，不影响正常使用。%n你仍可通过双击桌面快捷方式来启动 CP2K。

; ----- Finish page -----
english.FinishedMsg=CP2K installation complete!%n%nQuick start:%n  · Double-click the CP2K icon on your desktop to open the shell%n  · Drag a .inp file onto the CP2K icon to run it directly%n  · Example files: C:\CP2K\examples\%n%nNeed help? Visit https://www.cp2k.org
chinesesimplified.FinishedMsg=CP2K 安装完成！%n%n快速上手：%n  · 双击桌面的 CP2K 图标，打开命令行环境%n  · 将 .inp 输入文件拖拽到 CP2K 图标上直接运行%n  · 示例文件位置：C:\CP2K\examples\%n%n遇到问题？访问 https://www.cp2k.org 查阅文档。

[Tasks]
Name: "desktopicon"; Description: "{cm:DesktopIconDesc}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: checkedonce

[Files]
; Application files
Source: "..\cp2k_distro.tar";           DestDir: "{app}"; Flags: ignoreversion
Source: "..\scripts\run_cp2k.bat";      DestDir: "{app}"; Flags: ignoreversion
Source: "..\scripts\cp2k_shell.bat";    DestDir: "{app}"; Flags: ignoreversion
Source: "..\scripts\uninstall_wsl.ps1"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\README.txt";                DestDir: "{app}"; Flags: ignoreversion isreadme
; Application icon (used by shortcuts)
Source: "cp2k.ico";                     DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{group}\{cm:StartMenuShell}";   Filename: "{app}\cp2k_shell.bat"; WorkingDir: "{app}"; IconFilename: "{app}\cp2k.ico"
Name: "{group}\{cm:StartMenuReadme}";  Filename: "{app}\README.txt"
Name: "{group}\{cm:StartMenuUninstall}"; Filename: "{uninstallexe}"
Name: "{userdesktop}\{cm:DesktopLink}"; Filename: "{app}\cp2k_shell.bat"; WorkingDir: "{app}"; IconFilename: "{app}\cp2k.ico"; Tasks: desktopicon

[UninstallRun]
Filename: "wsl.exe"; Parameters: "--unregister CP2K"; Flags: runhidden

[Code]

// Refresh Windows icon/shell cache so shortcuts show the correct icon immediately
procedure SHChangeNotify(wEventId: Integer; uFlags: Cardinal; dwItem1, dwItem2: Longint);
  external 'SHChangeNotify@shell32.dll stdcall';

procedure RefreshShellIcons;
var
  ResultCode: Integer;
begin
  // Notify shell that file associations changed → redraws all icons
  SHChangeNotify($08000000, $0000, 0, 0);
  // Also run ie4uinit to flush the on-disk icon cache (Windows 10/11)
  Exec('ie4uinit.exe', '-show', '', SW_HIDE, ewWaitUntilTerminated, ResultCode);
end;

var
  ProgressPage: TOutputProgressWizardPage;

// ────────────────────────────────────────────────
// Pre-install checks: OS version / disk space / WSL2
// ────────────────────────────────────────────────
function InitializeSetup(): Boolean;
var
  ResultCode: Integer;
  FreeSpace, TotalSpace: Cardinal;
begin
  Result := True;

  // 1. Windows version (minimum Win10 2004)
  if GetWindowsVersion < $0A003905 then begin
    MsgBox(CustomMessage('ErrOSVersion'), mbError, MB_OK);
    Result := False;
    Exit;
  end;

  // 2. Disk space (at least 6 GB on C:\)
  GetSpaceOnDisk('C:\', True, FreeSpace, TotalSpace);
  if FreeSpace < 6144 then begin
    if MsgBox(
      FmtMessage(CustomMessage('ErrDiskSpace'), [IntToStr(FreeSpace div 1024)]),
      mbConfirmation, MB_YESNO) = IDNO then begin
      Result := False;
      Exit;
    end;
  end;

  // 3. WSL2 availability
  if not Exec('wsl.exe', '--status', '', SW_HIDE, ewWaitUntilTerminated, ResultCode)
     or (ResultCode <> 0) then begin
    if MsgBox(CustomMessage('ErrWSL2Prompt'), mbConfirmation, MB_YESNO) = IDYES then begin
      Exec('dism.exe',
        '/online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart',
        '', SW_HIDE, ewWaitUntilTerminated, ResultCode);
      Exec('dism.exe',
        '/online /enable-feature /featurename:VirtualMachinePlatform /all /norestart',
        '', SW_HIDE, ewWaitUntilTerminated, ResultCode);
      MsgBox(CustomMessage('ErrWSL2Enabled'), mbInformation, MB_OK);
    end;
    Result := False;
  end;
end;

// ────────────────────────────────────────────────
// Initialise: create the progress page
// ────────────────────────────────────────────────
procedure InitializeWizard();
begin
  ProgressPage := CreateOutputProgressPage(
    CustomMessage('ProgressTitle'),
    CustomMessage('ProgressDesc')
  );
end;

// ────────────────────────────────────────────────
// Core install logic (with detailed progress feedback)
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

    // ── Step 1/3: Import runtime environment (most time-consuming) ──
    ProgressPage.SetText(
      CustomMessage('Step1Title'),
      CustomMessage('Step1Desc')
    );
    ProgressPage.SetProgress(0, 100);

    if not DirExists(WslDistroDir) then
      CreateDir(WslDistroDir);

    if not Exec('wsl.exe',
      '--import CP2K "' + WslDistroDir + '" "' + TarFile + '"',
      '', SW_HIDE, ewWaitUntilTerminated, ResultCode)
      or (ResultCode <> 0) then begin
      MsgBox(
        FmtMessage(CustomMessage('ErrWSL2EnvFail'), [IntToStr(ResultCode)]),
        mbError, MB_OK);
      Exit;
    end;
    ProgressPage.SetProgress(65, 100);

    // ── Step 2/3: Configure environment variables ──
    ProgressPage.SetText(
      CustomMessage('Step2Title'),
      CustomMessage('Step2Desc')
    );
    ProgressPage.SetProgress(70, 100);

    Exec('powershell.exe',
      '-NoProfile -ExecutionPolicy Bypass -Command ' +
      '"$p=[Environment]::GetEnvironmentVariable(''Path'',''Machine'');' +
      'if($p -notlike ''*CP2K*''){' +
      '[Environment]::SetEnvironmentVariable(''Path'',$p+'';' + AppDir + ''',''Machine'')}"',
      '', SW_HIDE, ewWaitUntilTerminated, ResultCode);

    if ResultCode <> 0 then
      MsgBox(CustomMessage('WarnEnvVar'), mbInformation, MB_OK);
    ProgressPage.SetProgress(85, 100);

    // ── Step 3/3: Clean up temporary files ──
    ProgressPage.SetText(
      CustomMessage('Step3Title'),
      CustomMessage('Step3Desc')
    );
    ProgressPage.SetProgress(92, 100);

    if FileExists(TarFile) then
      DeleteFile(TarFile);

    ProgressPage.SetProgress(100, 100);
    ProgressPage.SetText(
      CustomMessage('DoneTitle'),
      CustomMessage('DoneDesc')
    );

  finally
    ProgressPage.Hide;
  end;

  // Refresh Windows icon cache so the desktop shortcut icon renders crisply
  RefreshShellIcons;
end;

// ────────────────────────────────────────────────
// Finish page: show usage instructions
// ────────────────────────────────────────────────
procedure CurPageChanged(CurPageID: Integer);
begin
  if CurPageID = wpFinished then
    WizardForm.FinishedLabel.Caption := CustomMessage('FinishedMsg');
end;
