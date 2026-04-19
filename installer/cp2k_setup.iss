; CP2K Windows Installer Script
; Automatically compiled by GitHub Actions

#define AppName "CP2K"
#define AppVersion "2026.1"
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
Compression=lzma2/max
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

; ----- WSL check status (shown while checking, after welcome page) -----
english.CheckingWSL=Checking system environment, please wait…
chinesesimplified.CheckingWSL=正在检测系统环境，请稍候…

; ----- WSL2 enabling progress (shown when user clicks Yes to enable WSL2) -----
english.EnablingWSLTitle=Enabling WSL2
english.EnablingWSLDesc=Please wait. This may take 1–2 minutes — do not close the window.
english.EnablingWSLStep1=Step 1 / 3: Installing WSL2 and Linux kernel via Windows…
english.EnablingWSLStep2=Step 1a / 3: Enabling Windows Subsystem for Linux feature…
english.EnablingWSLStep3=Step 2 / 3: Enabling Virtual Machine Platform feature…
english.EnablingWSLStep4=Step 3 / 3: Setting WSL2 as default version…

chinesesimplified.EnablingWSLTitle=正在启用 WSL2
chinesesimplified.EnablingWSLDesc=请耐心等待，可能需要 1-2 分钟，请勿关闭窗口。
chinesesimplified.EnablingWSLStep1=步骤 1 / 3：正在通过 Windows 安装 WSL2 和 Linux 内核…
chinesesimplified.EnablingWSLStep2=步骤 1a / 3：正在启用 Windows 子系统（Linux）功能…
chinesesimplified.EnablingWSLStep3=步骤 2 / 3：正在启用虚拟机平台功能…
chinesesimplified.EnablingWSLStep4=步骤 3 / 3：正在将 WSL2 设为默认版本…

; ----- Restart prompt (shown after WSL2 enabling) -----
english.RestartPrompt=WSL2 has been enabled successfully.%n%nA restart is required to complete the setup.%n%nWould you like to restart now?
english.RestartCancelledMsg=Restart skipped.%n%nPlease restart your computer manually to complete WSL2 setup,%nthen run this installer again.

chinesesimplified.RestartPrompt=WSL2 已成功启用。%n%n需要重启电脑才能完成配置。%n%n是否立即重启？
chinesesimplified.RestartCancelledMsg=已跳过重启。%n%n请手动重启电脑以完成 WSL2 配置，%n重启后再次运行本安装程序。

; ----- Error / warning messages  (%1 = runtime parameter) -----
english.ErrOSVersion=Your operating system is not supported.%n%nWindows 10 2004 (Build 19041) or later is required.%nPlease update Windows and run the installer again.
english.ErrDiskSpace=Insufficient disk space.%n%nAt least 6 GB of free space on drive C is required.%nCurrent free space: %1 GB%n%nPlease free up space and retry. Continue anyway?
english.ErrWSL2Prompt=WSL2 not detected.%n%nCP2K requires the Windows Subsystem for Linux (WSL2).%nClick Yes to enable WSL2 automatically.%nYour computer will need to restart; run the installer again afterwards.
english.ErrWSL2PendingRestart=WSL2 has already been enabled in this session.%n%nPlease restart your computer first, then run this installer again.
english.ErrWSL2KernelNote=Additional step required for Windows 10:%n%nAfter restarting, download and install the WSL2 Linux kernel update package:%n    https://aka.ms/wsl2kernel%n%nThen run this installer again.
english.ErrWSL2EnvFail=Failed to import runtime environment (error code: %1).%n%nSuggested fixes:%n  1. Restart your computer and run the installer again%n  2. Enable WSL manually via "Turn Windows features on or off"%n  3. Ensure virtualisation (VT-x / AMD-V) is enabled in BIOS%n%nFor further help visit https://www.cp2k.org
english.WarnEnvVar=Environment variable configuration failed — this will not affect normal use.%nYou can still launch CP2K by double-clicking the desktop shortcut.

chinesesimplified.ErrOSVersion=系统版本不符合要求。%n%n需要 Windows 10 2004（Build 19041）或更高版本。%n当前系统版本过低，请先更新 Windows 再安装。
chinesesimplified.ErrDiskSpace=C 盘可用空间不足。%n%n安装 CP2K 至少需要 6GB 可用空间。%n当前 C 盘剩余空间：%1 GB%n%n建议清理磁盘后重试。是否仍要继续安装？
chinesesimplified.ErrWSL2Prompt=未检测到 WSL2。%n%nCP2K 需要 Windows 子系统（WSL2）才能运行。%n点击"是"将自动启用 WSL2，完成后需重启电脑，%n重启后请再次运行安装程序。
chinesesimplified.ErrWSL2PendingRestart=本次会话中已启用过 WSL2。%n%n请先重启电脑，重启完成后再次运行本安装程序。
chinesesimplified.ErrWSL2KernelNote=Windows 10 用户需额外操作：%n%n重启完成后，请下载并安装 WSL2 Linux 内核更新包：%n    https://aka.ms/wsl2kernel%n%n安装完成后再次运行本安装程序。
chinesesimplified.ErrWSL2EnvFail=运行环境导入失败（错误码：%1）。%n%n请尝试以下解决方法：%n  1. 重启电脑后重新运行安装程序%n  2. 在"开启或关闭 Windows 功能"中手动启用 WSL%n  3. 确认 BIOS 中已开启虚拟化（Virtualization）%n%n如问题持续，请访问 https://www.cp2k.org 获取帮助。
chinesesimplified.WarnEnvVar=环境变量配置失败，不影响正常使用。%n你仍可通过双击桌面快捷方式来启动 CP2K。

; ----- Finish page -----
english.FinishedMsg=CP2K installation complete!%n%nQuick start:%n  · Double-click the CP2K icon on your desktop to open the shell%n  · The shell opens in your Windows user home folder automatically%n  · Type: cp2k -i yourfile.inp  to run a calculation%n%nNeed help? Visit https://www.cp2k.org
chinesesimplified.FinishedMsg=CP2K 安装完成！%n%n快速上手：%n  · 双击桌面的 CP2K 图标，打开命令行环境%n  · Shell 自动定位到你的 Windows 用户主目录%n  · 输入：cp2k -i 你的文件.inp  开始计算%n%n遇到问题？访问 https://www.cp2k.org 查阅文档。

[Tasks]
Name: "desktopicon"; Description: "{cm:DesktopIconDesc}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: checkedonce

[Files]
; Application files
Source: "..\cp2k_distro.tar";           DestDir: "{app}"; Flags: ignoreversion
Source: "..\scripts\run_cp2k.bat";      DestDir: "{app}"; Flags: ignoreversion
Source: "..\scripts\cp2k_shell.bat";    DestDir: "{app}"; Flags: ignoreversion
Source: "..\README.txt";                DestDir: "{app}"; Flags: ignoreversion isreadme
; Application icon (used by shortcuts)
Source: "cp2k.ico";                     DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{group}\{cm:StartMenuShell}";   Filename: "{app}\cp2k_shell.bat"; WorkingDir: "{app}"; IconFilename: "{app}\cp2k.ico"
Name: "{group}\{cm:StartMenuReadme}";  Filename: "{app}\README.txt"
Name: "{group}\{cm:StartMenuUninstall}"; Filename: "{uninstallexe}"
Name: "{userdesktop}\{cm:DesktopLink}"; Filename: "{app}\cp2k_shell.bat"; WorkingDir: "{app}"; IconFilename: "{app}\cp2k.ico"; Tasks: desktopicon


[UninstallRun]
; 注销 WSL 发行版
Filename: "wsl.exe"; Parameters: "--unregister CP2K"; Flags: runhidden
; 从系统 PATH 中移除本次安装目录（精确匹配 {app}，不会误删其他 CP2K 相关路径）
Filename: "powershell.exe"; \
  Parameters: "-NoProfile -ExecutionPolicy Bypass -Command ""$t='{app}'; $p=[Environment]::GetEnvironmentVariable('Path','Machine'); $p=($p -split ';' | Where-Object {{ $_ -and ($_.TrimEnd('\') -ne $t.TrimEnd('\')) }}) -join ';'; [Environment]::SetEnvironmentVariable('Path',$p,'Machine')"""; \
  Flags: runhidden waituntilterminated

[Code]

// Immediately exit the installer process — used when user declines WSL2 enablement
procedure ExitProcess(uExitCode: Integer);
  external 'ExitProcess@kernel32.dll stdcall';

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
  ProgressPage : TOutputProgressWizardPage;
  // Marks that WSL2 enablement has been attempted in this session;
  // used to prevent re-running the enable flow if the user declines
  // the restart and then clicks Next again.
  WSL2Triggered : Boolean;

// Ask user to restart; one confirmation before executing
procedure ShowRestartPrompt;
var
  RC: Integer;
begin
  if MsgBox(CustomMessage('RestartPrompt'), mbConfirmation, MB_YESNO) = IDYES then
    Exec('shutdown.exe', '/r /t 0 /c "WSL2 enabled — restarting for CP2K setup."',
      '', SW_HIDE, ewWaitUntilTerminated, RC)
  else
    MsgBox(CustomMessage('RestartCancelledMsg'), mbInformation, MB_OK);
end;

// ────────────────────────────────────────────────
// WSL2 readiness check: accept either --version (Store/2.x) or
// --status (in-box Windows 11 WSL2).  Either returning 0 means WSL2
// is installed and functional enough to run wsl --import.
// ────────────────────────────────────────────────
function IsWSL2Ready: Boolean;
var
  RC: Integer;
begin
  Result := False;
  if Exec('wsl.exe', '--version', '', SW_HIDE, ewWaitUntilTerminated, RC)
     and (RC = 0) then begin
    Result := True; Exit;
  end;
  if Exec('wsl.exe', '--status', '', SW_HIDE, ewWaitUntilTerminated, RC)
     and (RC = 0) then
    Result := True;
end;

// ────────────────────────────────────────────────
// Pre-install checks: OS version + disk space only
// (WSL2 check moved to NextButtonClick to avoid blocking UI startup)
// ────────────────────────────────────────────────
function InitializeSetup(): Boolean;
var
  FreeSpace, TotalSpace: Cardinal;
begin
  Result := True;

  // 1. Windows version (minimum Win10 2004 = Build 19041 = $4A61) — instant, safe to run before UI
  if GetWindowsVersion < $0A004A61 then begin
    MsgBox(CustomMessage('ErrOSVersion'), mbError, MB_OK);
    Result := False;
    Exit;
  end;

  // 2. Disk space (at least 6 GB on C:\) — instant, safe to run before UI
  GetSpaceOnDisk('C:\', True, FreeSpace, TotalSpace);
  if FreeSpace < 6144 then begin
    if MsgBox(
      FmtMessage(CustomMessage('ErrDiskSpace'), [IntToStr(FreeSpace div 1024)]),
      mbConfirmation, MB_YESNO) = IDNO then begin
      Result := False;
      Exit;
    end;
  end;

  // WSL2 check is deferred to NextButtonClick (welcome page → next)
  // so the installer window appears immediately without blocking.
end;

// ────────────────────────────────────────────────
// WSL2 check: runs when user clicks Next on welcome page
// UI is already visible at this point — no "black screen" freeze
// ────────────────────────────────────────────────
function NextButtonClick(CurPageID: Integer): Boolean;
var
  ResultCode: Integer;
begin
  Result := True;

  if CurPageID = wpWelcome then begin
    // Show a status hint so the user knows something is happening
    WizardForm.StatusLabel.Caption := CustomMessage('CheckingWSL');
    WizardForm.Update;

    // IsWSL2Ready tries wsl --version (Store/2.x) then wsl --status (in-box).
    // Either returning exit 0 means WSL2 is functional.
    if not IsWSL2Ready then begin
      WizardForm.StatusLabel.Caption := '';

      // If we already ran the enablement flow this session and user declined
      // to restart, don't loop back through it — just remind them to restart.
      if WSL2Triggered then begin
        MsgBox(CustomMessage('ErrWSL2PendingRestart'), mbInformation, MB_OK);
        Result := False;
        Exit;
      end;

      if MsgBox(CustomMessage('ErrWSL2Prompt'), mbConfirmation, MB_YESNO) = IDYES then begin
        WSL2Triggered := True;

        // ── Show progress while enabling WSL2 ──
        ProgressPage.SetText(
          CustomMessage('EnablingWSLTitle'),
          CustomMessage('EnablingWSLDesc')
        );
        ProgressPage.SetProgress(5, 100);
        ProgressPage.Show;

        // ── Method 1: wsl --install --no-distribution ──
        // Available on Windows 10 21H2+ and all Windows 11 builds.
        // Handles BOTH enabling the features AND installing the kernel in one step.
        ProgressPage.SetText(
          CustomMessage('EnablingWSLTitle'),
          CustomMessage('EnablingWSLStep1')
        );
        ProgressPage.SetProgress(10, 100);
        Exec('wsl.exe', '--install --no-distribution',
          '', SW_HIDE, ewWaitUntilTerminated, ResultCode);

        if ResultCode <> 0 then begin
          // ── Method 2: DISM fallback (Windows 10 pre-21H2 or Store-disabled) ──
          // DISM enables the WSL feature and VM Platform, but on Windows 10 it
          // does NOT install the WSL2 Linux kernel.  After reboot the user must
          // manually install the kernel MSI from https://aka.ms/wsl2kernel
          // (Windows 11 gets the kernel automatically via Windows Update).
          ProgressPage.SetText(
            CustomMessage('EnablingWSLTitle'),
            CustomMessage('EnablingWSLStep2')
          );
          ProgressPage.SetProgress(25, 100);
          Exec('dism.exe',
            '/online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart',
            '', SW_HIDE, ewWaitUntilTerminated, ResultCode);

          ProgressPage.SetText(
            CustomMessage('EnablingWSLTitle'),
            CustomMessage('EnablingWSLStep3')
          );
          ProgressPage.SetProgress(55, 100);
          Exec('dism.exe',
            '/online /enable-feature /featurename:VirtualMachinePlatform /all /norestart',
            '', SW_HIDE, ewWaitUntilTerminated, ResultCode);

        end;

        // ── Always: set WSL2 as the default version ──
        ProgressPage.SetText(
          CustomMessage('EnablingWSLTitle'),
          CustomMessage('EnablingWSLStep4')
        );
        ProgressPage.SetProgress(90, 100);
        Exec('wsl.exe', '--set-default-version 2',
          '', SW_HIDE, ewWaitUntilTerminated, ResultCode);

        ProgressPage.SetProgress(100, 100);
        ProgressPage.Hide;

        // Windows 11 starts at Build 22000 ($55F0).
        // On Windows 10 (Build < 22000), DISM alone is not enough —
        // warn the user they need the kernel update package after rebooting.
        // Shown AFTER the progress page is hidden so dialogs don't overlap.
        if GetWindowsVersion < $0A0055F0 then
          MsgBox(CustomMessage('ErrWSL2KernelNote'), mbInformation, MB_OK);

        // Ask user to restart (one confirmation required)
        ShowRestartPrompt;
      end else begin
        // User clicked No — they declined to enable WSL2.
        // Exit the installer immediately without any further confirmation.
        ExitProcess(0);
      end;

      Result := False;
      Exit;
    end;

    WizardForm.StatusLabel.Caption := '';
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

    // Defensive: if a previous CP2K distro already exists (e.g. leftover
    // from a failed prior install), remove it first.  Ignore failures —
    // the call also "fails" harmlessly when no such distro is registered.
    Exec('wsl.exe', '--unregister CP2K',
      '', SW_HIDE, ewWaitUntilTerminated, ResultCode);

    if not Exec('wsl.exe',
      '--import CP2K "' + WslDistroDir + '" "' + TarFile + '"',
      '', SW_HIDE, ewWaitUntilTerminated, ResultCode)
      or (ResultCode <> 0) then begin
      // Hide the progress page before showing the error so dialogs don't overlap.
      ProgressPage.Hide;
      MsgBox(
        FmtMessage(CustomMessage('ErrWSL2EnvFail'), [IntToStr(ResultCode)]),
        mbError, MB_OK);
      // RaiseException aborts the install and triggers Inno Setup's rollback,
      // so the user doesn't see a false "Installation Complete!" message.
      RaiseException('WSL import failed with exit code ' + IntToStr(ResultCode));
    end;
    ProgressPage.SetProgress(68, 100);

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
