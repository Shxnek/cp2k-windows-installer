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

; ----- Console window "was closed prematurely" error -----
english.ErrConsoleClosed=The console window was closed before the command finished.%nWSL2 may be in a half-configured state.%n%nPlease run the installer again and let the console window close on its own.
chinesesimplified.ErrConsoleClosed=命令行窗口在命令完成前被关闭。%nWSL2 可能处于未完成配置的状态。%n%n请重新运行安装程序，并等待命令行窗口自动关闭。

; ----- Restart prompt (shown after WSL2 enabling) -----
english.RestartPrompt=WSL2 setup is complete — a restart is required to activate it.%n%nIf you click Yes, the computer will restart and the installer will resume automatically after you log back in.%n%nRestart now?
english.RestartCancelledMsg=Restart skipped.%n%nWSL2 is not yet active. Please restart your computer manually,%nthen run this installer again.

chinesesimplified.RestartPrompt=WSL2 功能已配置，重启后才会正式生效。%n%n点击"是"将立即重启电脑，登录后安装程序会自动继续。%n%n是否立即重启？
chinesesimplified.RestartCancelledMsg=已跳过重启。%n%nWSL2 尚未激活，请手动重启电脑，%n重启完成后再次运行本安装程序。

; ----- Error / warning messages  (%1 = runtime parameter) -----
english.ErrOSVersion=Your operating system is not supported.%n%nWindows 10 2004 (Build 19041) or later is required.%nPlease update Windows and run the installer again.
english.ErrDiskSpace=Insufficient disk space.%n%nAt least 6 GB of free space on drive C is required.%nCurrent free space: %1 GB%n%nPlease free up space and retry. Continue anyway?
english.ErrWSL2Prompt=WSL2 not detected.%n%nCP2K requires the Windows Subsystem for Linux (WSL2).%nClick Yes to enable WSL2 automatically.%n%nA console window will open and run the following commands:%n  dism  - Enable Windows Subsystem for Linux%n  dism  - Enable Virtual Machine Platform%n  wsl   - Set default version to 2%nThis takes about 1–2 minutes. Press any key to close it when done.%n%nYour computer will restart afterwards, and the installer will resume on its own.
english.ErrWSL2PendingRestart=WSL2 has already been enabled in this session.%n%nPlease restart your computer first, then run this installer again.
english.ErrWSL2KernelNote=Additional step required for Windows 10:%n%nAfter restarting, download and install the WSL2 Linux kernel update package:%n    https://aka.ms/wsl2kernel%n%nThen run this installer again.
english.ErrWSL2EnableFeatureFail=Failed to enable a required Windows feature (error code: %1).%n%nPlease make sure this PC allows Windows optional features to be changed, then run the installer again.
english.ErrWSL2SetDefaultFail=WSL was enabled, but setting the default version to WSL2 failed (error code: %1).%n%nSuggested fixes:%n  1. Restart your computer and run the installer again%n  2. On Windows 10, install the WSL2 Linux kernel update package%n  3. Ensure virtualisation (VT-x / AMD-V) is enabled in BIOS
english.ErrWSL2NotReadyAfterRestart=WSL2 is still not ready after the restart.%n%nPlease confirm that Windows finished applying the optional-feature changes, then run the installer again.%n%nOn Windows 10, you may also need the WSL2 Linux kernel update package.
english.ErrWSL2EnvFail=Failed to import runtime environment (error code: %1).%n%nSuggested fixes:%n  1. Restart your computer and run the installer again%n  2. Enable WSL manually via "Turn Windows features on or off"%n  3. Ensure virtualisation (VT-x / AMD-V) is enabled in BIOS%n%nFor further help visit https://www.cp2k.org
english.WarnEnvVar=Environment variable configuration failed — this will not affect normal use.%nYou can still launch CP2K by double-clicking the desktop shortcut.

chinesesimplified.ErrOSVersion=系统版本不符合要求。%n%n需要 Windows 10 2004（Build 19041）或更高版本。%n当前系统版本过低，请先更新 Windows 再安装。
chinesesimplified.ErrDiskSpace=C 盘可用空间不足。%n%n安装 CP2K 至少需要 6GB 可用空间。%n当前 C 盘剩余空间：%1 GB%n%n建议清理磁盘后重试。是否仍要继续安装？
chinesesimplified.ErrWSL2Prompt=未检测到 WSL2。%n%nCP2K 需要 Windows 子系统（WSL2）才能运行。%n点击"是"将自动启用 WSL2。%n%n即将弹出命令行窗口，依次执行以下命令：%n  dism  - 启用 Windows Subsystem for Linux 功能%n  dism  - 启用 Virtual Machine Platform 功能%n  wsl   - 设置默认版本为 2%n整个过程约 1-2 分钟，完成后按任意键关闭窗口。%n%n随后电脑会自动重启，重启后安装程序会自动继续。
chinesesimplified.ErrWSL2PendingRestart=本次会话中已启用过 WSL2。%n%n请先重启电脑，重启完成后再次运行本安装程序。
chinesesimplified.ErrWSL2KernelNote=Windows 10 用户需额外操作：%n%n重启完成后，请下载并安装 WSL2 Linux 内核更新包：%n    https://aka.ms/wsl2kernel%n%n安装完成后再次运行本安装程序。
chinesesimplified.ErrWSL2EnableFeatureFail=启用必需的 Windows 功能失败（错误码：%1）。%n%n请确认这台电脑允许修改 Windows 可选功能，然后重新运行安装程序。
chinesesimplified.ErrWSL2SetDefaultFail=WSL 功能已启用，但将默认版本设为 WSL2 失败（错误码：%1）。%n%n请尝试以下方法：%n  1. 重启电脑后重新运行安装程序%n  2. Windows 10 请安装 WSL2 Linux 内核更新包%n  3. 确认 BIOS 中已开启虚拟化（VT-x / AMD-V）
chinesesimplified.ErrWSL2NotReadyAfterRestart=电脑重启后，WSL2 仍未就绪。%n%n请确认 Windows 已完成可选功能变更，再重新运行安装程序。%n%n如果是 Windows 10，可能还需要安装 WSL2 Linux 内核更新包。
chinesesimplified.ErrWSL2EnvFail=运行环境导入失败（错误码：%1）。%n%n请尝试以下解决方法：%n  1. 重启电脑后重新运行安装程序%n  2. 在"开启或关闭 Windows 功能"中手动启用 WSL%n  3. 确认 BIOS 中已开启虚拟化（Virtualization）%n%n如问题持续，请访问 https://www.cp2k.org 获取帮助。
chinesesimplified.WarnEnvVar=环境变量配置失败，不影响正常使用。%n你仍可通过双击桌面快捷方式来启动 CP2K。

; ----- Finish page -----
english.FinishedMsg=CP2K installation complete!%n%nQuick start:%n  · Double-click the CP2K icon on your desktop to open the shell%n  · The shell tries your Windows user home folder first, then falls back to the Linux home folder if needed%n  · Type: cp2k -i yourfile.inp  to run a calculation%n%nNeed help? Visit https://www.cp2k.org
chinesesimplified.FinishedMsg=CP2K 安装完成！%n%n快速上手：%n  · 双击桌面的 CP2K 图标，打开命令行环境%n  · Shell 会优先进入你的 Windows 用户主目录，必要时回退到 Linux 用户主目录%n  · 输入：cp2k -i 你的文件.inp  开始计算%n%n遇到问题？访问 https://www.cp2k.org 查阅文档。

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
; 注销 WSL 发行版（使用 {sysnative} 避开 WOW64 重定向，否则 32 位卸载程序找不到 wsl.exe）
; waituntilterminated：等 WSL 彻底释放 ext4.vhdx 文件锁再继续删文件，避免孤儿文件
Filename: "{sysnative}\wsl.exe"; Parameters: "--unregister CP2K"; Flags: runhidden waituntilterminated
; 从系统 PATH 中移除本次安装目录（精确匹配 {app}，不会误删其他 CP2K 相关路径）
Filename: "{sysnative}\WindowsPowerShell\v1.0\powershell.exe"; \
  Parameters: "-NoProfile -ExecutionPolicy Bypass -Command ""$t='{app}'; $p=[Environment]::GetEnvironmentVariable('Path','Machine'); $p=($p -split ';' | Where-Object {{ $_ -and ($_.TrimEnd('\') -ne $t.TrimEnd('\')) }}) -join ';'; [Environment]::SetEnvironmentVariable('Path',$p,'Machine')"""; \
  Flags: runhidden waituntilterminated

[Code]

// Immediately exit the installer process — used when user declines WSL2 enablement
procedure ExitProcess(uExitCode: Integer);
  external 'ExitProcess@kernel32.dll stdcall';

// Bring our installer window back to the foreground after a long-running
// background command (e.g. wsl --install) may have pushed it behind.
function SetForegroundWindow(hWnd: HWND): BOOL;
  external 'SetForegroundWindow@user32.dll stdcall';

// Refresh Windows icon/shell cache so shortcuts show the correct icon immediately
procedure SHChangeNotify(wEventId: Integer; uFlags: Cardinal; dwItem1, dwItem2: Longint);
  external 'SHChangeNotify@shell32.dll stdcall';

// ────────────────────────────────────────────────
// Return the native 64-bit System32 path for a given executable, bypassing
// WOW64 file-system redirection.  This installer is a 32-bit process, so a
// bare 'wsl.exe' / 'dism.exe' / etc. would be looked up in SysWOW64 — where
// wsl.exe does not exist at all, making Exec silently fail.  Using the
// {sysnative} pseudo-path (C:\Windows\Sysnative on 32-bit processes)
// forces Windows to resolve to the real 64-bit System32.
// ────────────────────────────────────────────────
function SysPath(const FileName: String): String;
begin
  Result := ExpandConstant('{sysnative}') + '\' + FileName;
end;

procedure RefreshShellIcons;
var
  ResultCode: Integer;
begin
  // Notify shell that file associations changed → redraws all icons
  SHChangeNotify($08000000, $0000, 0, 0);
  // Also run ie4uinit to flush the on-disk icon cache (Windows 10/11)
  Exec(SysPath('ie4uinit.exe'), '-show', '', SW_HIDE, ewWaitUntilTerminated, ResultCode);
end;

function ReadExitCodeFile(const FilePath: String; const DefaultValue: Integer): Integer;
var
  S: AnsiString;
begin
  Result := DefaultValue;
  if LoadStringFromFile(FilePath, S) then
    Result := StrToIntDef(Trim(String(S)), DefaultValue);
end;

var
  // Marks that WSL2 enablement has been attempted in this session;
  // prevents re-running the enable flow if the user declines the restart
  // and then clicks Next again.
  WSL2Triggered : Boolean;

// ────────────────────────────────────────────────
// Core helper: write a batch script to {tmp}, then run it in a VISIBLE cmd
// window via Sysnative cmd.exe.  Returns the batch's exit code.
//
// Why Sysnative?  Our 32-bit installer would otherwise spawn 32-bit cmd.exe
// from SysWOW64, inheriting WOW64 file-system redirection — which turns any
// reference to wsl.exe / dism.exe inside the script into a lookup in SysWOW64,
// where neither exists.  Invoking via {sysnative}\cmd.exe forces a native
// 64-bit cmd with no redirection, so wsl / dism resolve normally.
//
// The batch file itself is written in UTF-8 without BOM so `chcp 65001` at the
// top switches the console to UTF-8 and @echo off stays intact (a BOM would
// print as visible garbage on the first line).
// ────────────────────────────────────────────────
function RunVisibleBatch(const Lines: TArrayOfString; const BatName: String;
  var ExitCode: Integer): Boolean;
var
  BatPath: String;
begin
  BatPath := ExpandConstant('{tmp}\') + BatName;
  SaveStringsToUTF8FileWithoutBOM(BatPath, Lines, False);
  // /C ""path"" — the outer/inner quote pair is the safest way to pass a
  // path containing spaces through cmd's /C argument parsing.
  Result := Exec(SysPath('cmd.exe'), '/C ""' + BatPath + '""',
    '', SW_SHOWNORMAL, ewWaitUntilTerminated, ExitCode);
  SetForegroundWindow(WizardForm.Handle);
end;

// ────────────────────────────────────────────────
// Generate + run the WSL2 enabling batch in a visible cmd window.
// Uses DISM directly (not wsl --install) — DISM is reliable and
// idempotent on all supported Windows 10/11 builds.
// Returns True only when the batch ran to completion.
// ────────────────────────────────────────────────
function RunWSLEnableVisible: Boolean;
var
  Lines: TArrayOfString;
  DonePath: String;
  FeatureWSLRCPath, FeatureVMPRCPath, SetDefaultRCPath, UpdateRCPath: String;
  FeatureWSLRC, FeatureVMPRC, SetDefaultRC: Integer;
  RC: Integer;
begin
  Result := False;

  DonePath := ExpandConstant('{tmp}\cp2k_enable_done.flag');
  FeatureWSLRCPath := ExpandConstant('{tmp}\cp2k_enable_feature_wsl.rc');
  FeatureVMPRCPath := ExpandConstant('{tmp}\cp2k_enable_feature_vmp.rc');
  SetDefaultRCPath := ExpandConstant('{tmp}\cp2k_enable_setdefault.rc');
  UpdateRCPath := ExpandConstant('{tmp}\cp2k_enable_update.rc');
  if FileExists(DonePath) then DeleteFile(DonePath);
  if FileExists(FeatureWSLRCPath) then DeleteFile(FeatureWSLRCPath);
  if FileExists(FeatureVMPRCPath) then DeleteFile(FeatureVMPRCPath);
  if FileExists(SetDefaultRCPath) then DeleteFile(SetDefaultRCPath);
  if FileExists(UpdateRCPath) then DeleteFile(UpdateRCPath);

  SetArrayLength(Lines, 42);
  Lines[ 0] := '@echo off';
  Lines[ 1] := 'chcp 65001 >nul 2>&1';
  Lines[ 2] := 'title CP2K Installer - Enabling WSL2';
  Lines[ 3] := 'color 0B';
  Lines[ 4] := 'cls';
  Lines[ 5] := 'echo.';
  Lines[ 6] := 'echo ==================================================';
  Lines[ 7] := 'echo   CP2K Installer - Enabling WSL2';
  Lines[ 8] := 'echo   Each command output is shown below.';
  Lines[ 9] := 'echo   Press any key to close when done reading.';
  Lines[10] := 'echo ==================================================';
  Lines[11] := 'echo.';
  Lines[12] := 'echo --------------------------------------------------';
  Lines[13] := 'echo [Step 1/4]  Enable: Windows Subsystem for Linux';
  Lines[14] := 'echo --------------------------------------------------';
  Lines[15] := 'dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart';
  Lines[16] := '> "' + FeatureWSLRCPath + '" echo %ERRORLEVEL%';
  Lines[17] := 'echo.';
  Lines[18] := 'echo --------------------------------------------------';
  Lines[19] := 'echo [Step 2/4]  Enable: Virtual Machine Platform';
  Lines[20] := 'echo --------------------------------------------------';
  Lines[21] := 'dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart';
  Lines[22] := '> "' + FeatureVMPRCPath + '" echo %ERRORLEVEL%';
  Lines[23] := 'echo.';
  Lines[24] := 'echo --------------------------------------------------';
  Lines[25] := 'echo [Step 3/4]  Set WSL default version to 2';
  Lines[26] := 'echo --------------------------------------------------';
  Lines[27] := 'wsl.exe --set-default-version 2';
  Lines[28] := '> "' + SetDefaultRCPath + '" echo %ERRORLEVEL%';
  Lines[29] := 'echo.';
  Lines[30] := 'echo --------------------------------------------------';
  Lines[31] := 'echo [Step 4/4]  Optional: Update WSL kernel from Windows Store';
  Lines[32] := 'echo --------------------------------------------------';
  Lines[33] := 'wsl.exe --update';
  Lines[34] := '> "' + UpdateRCPath + '" echo %ERRORLEVEL%';
  Lines[35] := 'if not "%ERRORLEVEL%"=="0" echo   (WSL kernel update skipped - non-critical)';
  Lines[36] := 'echo.';
  // Done-sentinel: if missing after Exec returns, the user closed the window early.
  Lines[37] := '> "' + DonePath + '" echo done';
  Lines[38] := 'echo ==================================================';
  Lines[39] := 'echo   All steps finished. Press any key to continue.';
  Lines[40] := 'echo ==================================================';
  // pause (without >nul) shows "Press any key to continue..." so the user
  // knows to interact. This also prevents the "window flashes and vanishes"
  // problem on systems where all commands complete in under a second.
  Lines[41] := 'pause';

  if not RunVisibleBatch(Lines, 'cp2k_enable_wsl.bat', RC) then begin
    MsgBox('Failed to launch the WSL2 enabling console window.' + #13#10 +
           'Please check your antivirus / execution policy and retry.',
           mbError, MB_OK);
    Exit;
  end;

  if not FileExists(DonePath) then begin
    MsgBox(CustomMessage('ErrConsoleClosed'), mbError, MB_OK);
    Exit;
  end;

  FeatureWSLRC := ReadExitCodeFile(FeatureWSLRCPath, -1);
  FeatureVMPRC := ReadExitCodeFile(FeatureVMPRCPath, -1);
  SetDefaultRC := ReadExitCodeFile(SetDefaultRCPath, -1);

  if FeatureWSLRC <> 0 then begin
    MsgBox(FmtMessage(CustomMessage('ErrWSL2EnableFeatureFail'), [IntToStr(FeatureWSLRC)]),
      mbError, MB_OK);
    Exit;
  end;

  if FeatureVMPRC <> 0 then begin
    MsgBox(FmtMessage(CustomMessage('ErrWSL2EnableFeatureFail'), [IntToStr(FeatureVMPRC)]),
      mbError, MB_OK);
    Exit;
  end;

  if SetDefaultRC <> 0 then begin
    MsgBox(FmtMessage(CustomMessage('ErrWSL2SetDefaultFail'), [IntToStr(SetDefaultRC)]),
      mbError, MB_OK);
    Exit;
  end;

  Result := True;
end;

// ────────────────────────────────────────────────
// Generate + run the CP2K runtime import batch in a visible cmd window.
// Sets ImportRC to the actual wsl --import exit code.
// ────────────────────────────────────────────────
procedure RunWSLImportVisible(const WslDistroDir, TarFile: String; var ImportRC: Integer);
var
  Lines: TArrayOfString;
  RCPath: String;
  S: AnsiString;
  Launched: Boolean;
begin
  // Initialise to a non-zero value so that a caller who sees a non-zero RC
  // after an Exec-level launch failure reports error rather than silently
  // treating 0 as success.
  ImportRC := -1;

  RCPath := ExpandConstant('{tmp}\cp2k_import_rc.txt');
  if FileExists(RCPath) then DeleteFile(RCPath);

  SetArrayLength(Lines, 30);
  Lines[ 0] := '@echo off';
  Lines[ 1] := 'chcp 65001 >nul 2>&1';
  Lines[ 2] := 'title CP2K Installer - Importing Runtime';
  Lines[ 3] := 'color 0A';
  Lines[ 4] := 'cls';
  Lines[ 5] := 'echo.';
  Lines[ 6] := 'echo ==================================================';
  Lines[ 7] := 'echo   CP2K Installer - Importing CP2K Runtime';
  Lines[ 8] := 'echo   This takes 2-4 minutes.';
  Lines[ 9] := 'echo   The command itself does not print progress,';
  Lines[10] := 'echo   so the screen will appear idle - this is normal.';
  Lines[11] := 'echo   DO NOT close this window manually.';
  Lines[12] := 'echo ==================================================';
  Lines[13] := 'echo.';
  Lines[14] := 'echo [1/2] Removing any previous CP2K distro (if present)...';
  Lines[15] := 'wsl.exe --unregister CP2K 2>nul';
  Lines[16] := 'echo.';
  Lines[17] := 'echo [2/2] Importing CP2K distro as WSL2...';
  Lines[18] := 'echo    target:  "' + WslDistroDir + '"';
  Lines[19] := 'echo    source:  "' + TarFile + '"';
  Lines[20] := 'wsl.exe --import CP2K "' + WslDistroDir + '" "' + TarFile + '" --version 2';
  Lines[21] := 'set IMPORT_RC=%ERRORLEVEL%';
  Lines[22] := '> "' + RCPath + '" echo %IMPORT_RC%';
  Lines[23] := 'echo.';
  Lines[24] := 'echo ==================================================';
  Lines[25] := 'echo   Import finished with exit code %IMPORT_RC%';
  Lines[26] := 'echo   Closing in 5 seconds...';
  Lines[27] := 'echo ==================================================';
  Lines[28] := 'timeout /t 5 /nobreak >nul';
  Lines[29] := 'exit /b %IMPORT_RC%';

  Launched := RunVisibleBatch(Lines, 'cp2k_import_wsl.bat', ImportRC);

  if not Launched then begin
    MsgBox('Failed to launch the import console window.' + #13#10 +
           'Please check your antivirus / execution policy and retry.',
           mbError, MB_OK);
    ImportRC := -1;
    Exit;
  end;

  // Prefer the exit code written by the batch — it is the true wsl --import
  // RC, not the cmd.exe RC returned by Exec.  If the file is missing, the
  // user closed the window before the import finished writing the RC.
  if LoadStringFromFile(RCPath, S) then
    ImportRC := StrToIntDef(Trim(String(S)), ImportRC)
  else begin
    MsgBox(CustomMessage('ErrConsoleClosed'), mbError, MB_OK);
    ImportRC := -1;
  end;
end;

// Ask user to restart; one confirmation before executing.
// On "Yes" we register a RunOnce entry so the installer auto-relaunches after
// the first login post-reboot — otherwise the user has to remember to run
// setup.exe again, which is easy to forget and the single biggest UX snag.
// On "No" we show the manual-restart message and exit cleanly.
procedure ShowRestartPrompt;
var
  RC: Integer;
begin
  if MsgBox(CustomMessage('RestartPrompt'), mbConfirmation, MB_YESNO) = IDYES then begin
    // RunOnce under HKLM runs once at next login as the logging-in user.
    // Values starting with '!' make RunOnce keep the entry if the program
    // returns non-zero — but we WANT one-shot behavior, so no leading '!'.
    // {srcexe} is the path of the currently-running setup.exe.  Quoting it
    // handles install paths that contain spaces.
    RegWriteStringValue(HKEY_LOCAL_MACHINE,
      'Software\Microsoft\Windows\CurrentVersion\RunOnce',
      'CP2KInstallerResume',
      '"' + ExpandConstant('{srcexe}') + '"');

    Exec(SysPath('shutdown.exe'), '/r /t 0 /c "WSL2 enabled — restarting for CP2K setup."',
      '', SW_HIDE, ewWaitUntilTerminated, RC);
  end else begin
    MsgBox(CustomMessage('RestartCancelledMsg'), mbInformation, MB_OK);
    ExitProcess(0);
  end;
end;

// ────────────────────────────────────────────────
// WSL2 readiness check — silent.  Accepts either --version (Store/2.x) or
// --status (in-box Windows 11 WSL2).  Either returning 0 means WSL2 is
// functional enough to run wsl --import.  Both calls are hidden since they
// normally complete in <1 second and produce no interesting output.
// ────────────────────────────────────────────────
function IsWSL2Ready: Boolean;
var
  RC: Integer;
begin
  Result := False;
  if Exec(SysPath('wsl.exe'), '--version', '', SW_HIDE, ewWaitUntilTerminated, RC)
     and (RC = 0) then begin
    Result := True; Exit;
  end;
  if Exec(SysPath('wsl.exe'), '--status', '', SW_HIDE, ewWaitUntilTerminated, RC)
     and (RC = 0) then
    Result := True;
end;

// ────────────────────────────────────────────────
// Pre-install checks: OS version + disk space only.
// WSL2 check is deferred to NextButtonClick so the wizard appears first.
// ────────────────────────────────────────────────
function InitializeSetup(): Boolean;
var
  FreeSpace, TotalSpace: Cardinal;
begin
  Result := True;

  // 1. Windows version (minimum Win10 2004 = Build 19041 = $4A61)
  if GetWindowsVersion < $0A004A61 then begin
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
end;

// ────────────────────────────────────────────────
// WSL2 gating logic on the welcome page.
// Note: we do NOT use TOutputProgressWizardPage here — it is designed for
// the ssInstall phase and does not reliably paint when shown from within a
// NextButtonClick handler.  Instead, we show a visible cmd window (from
// RunWSLEnableVisible) so the user sees real live output from wsl/dism.
// ────────────────────────────────────────────────
function NextButtonClick(CurPageID: Integer): Boolean;
begin
  Result := True;

  if CurPageID <> wpWelcome then Exit;

  if IsWSL2Ready then Exit;  // all good — let the wizard advance

  // WSL2 not ready.  If the user already went through the enable flow this
  // session and declined the restart, don't loop — just remind them.
  if WSL2Triggered then begin
    MsgBox(CustomMessage('ErrWSL2PendingRestart'), mbInformation, MB_OK);
    ExitProcess(0);
  end;

  if MsgBox(CustomMessage('ErrWSL2Prompt'), mbConfirmation, MB_YESNO) <> IDYES then begin
    // User declined to enable WSL2 — exit immediately, no further prompts.
    ExitProcess(0);
  end;

  // ErrWSL2Prompt has already described what the console will do, so jump
  // straight to it rather than forcing a second OK click.
  if not RunWSLEnableVisible then begin
    // Console failed to launch or was closed prematurely — the specific error
    // was already shown inside RunWSLEnableVisible.  Leave WSL2Triggered=False
    // so the user can click Next again to retry the full flow.
    Result := False;
    Exit;
  end;

  // Only mark "triggered" after a real, completed attempt — otherwise a
  // premature close would trap the user in the "restart pending" dead-end.
  WSL2Triggered := True;

  // Windows 11 starts at Build 22000 ($55F0).  On Windows 10 we always use
  // DISM, which does NOT install the WSL2 kernel — point the user at the
  // manual kernel MSI if wsl --update didn't handle it automatically.
  if GetWindowsVersion < $0A0055F0 then
    MsgBox(CustomMessage('ErrWSL2KernelNote'), mbInformation, MB_OK);

  ShowRestartPrompt;

  Result := False;  // stay on welcome page (we're about to restart or exit)
end;

// ────────────────────────────────────────────────
// CP2K install phase (ssPostInstall).
// The slow part (wsl --import, 2-4 min) runs in a visible cmd window so the
// user has something tangible to watch.  The fast steps (PATH config, temp
// cleanup) run hidden since they complete in well under a second.
// ────────────────────────────────────────────────
procedure CurStepChanged(CurStep: TSetupStep);
var
  ResultCode, ImportRC: Integer;
  AppDir, WslDistroDir, TarFile: String;
begin
  if CurStep <> ssPostInstall then Exit;

  AppDir       := ExpandConstant('{app}');
  WslDistroDir := AppDir + '\wsl_distro';
  TarFile      := AppDir + '\cp2k_distro.tar';

  if not DirExists(WslDistroDir) then
    CreateDir(WslDistroDir);

  // Guard against a missing tar (e.g. on-the-fly AV quarantine between
  // extraction and this step) before handing it to wsl --import, which
  // would otherwise report a cryptic "file not found" code.
  if not FileExists(TarFile) then begin
    MsgBox(FmtMessage(CustomMessage('ErrWSL2EnvFail'), ['tar missing']),
      mbError, MB_OK);
    RaiseException('CP2K distro tar not found: ' + TarFile);
  end;

  if not IsWSL2Ready then begin
    MsgBox(CustomMessage('ErrWSL2NotReadyAfterRestart'), mbError, MB_OK);
    if GetWindowsVersion < $0A0055F0 then
      MsgBox(CustomMessage('ErrWSL2KernelNote'), mbInformation, MB_OK);
    RaiseException('WSL2 is not ready for import');
  end;

  // ── Step 1/3: Import runtime environment (visible cmd window) ──
  // The cmd window's own banner explains what's happening; no pre-MsgBox.
  RunWSLImportVisible(WslDistroDir, TarFile, ImportRC);

  if ImportRC <> 0 then begin
    MsgBox(
      FmtMessage(CustomMessage('ErrWSL2EnvFail'), [IntToStr(ImportRC)]),
      mbError, MB_OK);
    // RaiseException aborts the install and triggers Inno Setup's rollback
    // so the user doesn't see a false "Installation Complete!" message.
    RaiseException('WSL import failed with exit code ' + IntToStr(ImportRC));
  end;

  // ── Step 2/3: Configure environment variables (hidden, sub-second) ──
  Exec(SysPath('WindowsPowerShell\v1.0\powershell.exe'),
    '-NoProfile -ExecutionPolicy Bypass -Command ' +
    '"$p=[Environment]::GetEnvironmentVariable(''Path'',''Machine'');' +
    'if($p -notlike ''*CP2K*''){' +
    '[Environment]::SetEnvironmentVariable(''Path'',$p+'';' + AppDir + ''',''Machine'')}"',
    '', SW_HIDE, ewWaitUntilTerminated, ResultCode);

  if ResultCode <> 0 then
    MsgBox(CustomMessage('WarnEnvVar'), mbInformation, MB_OK);

  // ── Step 3/3: Clean up temporary files ──
  if FileExists(TarFile) then
    DeleteFile(TarFile);

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
