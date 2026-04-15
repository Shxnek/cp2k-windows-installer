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
; 导入 WSL 镜像
Filename: "wsl.exe"; \
    Parameters: "--import CP2K ""{app}\wsl_distro"" ""{app}\cp2k_distro.tar"""; \
    StatusMsg: "正在配置 CP2K 环境（约需 2-3 分钟）..."; \
    Flags: waituntilterminated runhidden

; 添加到系统 PATH
Filename: "powershell.exe"; \
    Parameters: "-NoProfile -ExecutionPolicy Bypass -Command ""$p=[Environment]::GetEnvironmentVariable('Path','Machine'); if($p -notlike '*CP2K*'){[Environment]::SetEnvironmentVariable('Path',$p+';{app}','Machine')}"""; \
    Flags: runhidden waituntilterminated

[UninstallRun]
Filename: "wsl.exe"; Parameters: "--unregister CP2K"; Flags: runhidden

[Code]
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
