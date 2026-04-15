# CP2K 自动安装脚本
# 请以"管理员身份"运行 PowerShell，然后执行此脚本

$ErrorActionPreference = "Stop"
$InstallDir = "C:\CP2K"

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  CP2K Windows 安装程序" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# ── 第1步：检查 Windows 版本 ──
Write-Host "[1/5] 检查系统环境..." -ForegroundColor Yellow
$OSVersion = (Get-WmiObject Win32_OperatingSystem).Version
$BuildNumber = [System.Environment]::OSVersion.Version.Build
if ($BuildNumber -lt 19041) {
    Write-Host "错误：需要 Windows 10 2004 (Build 19041) 或更高版本" -ForegroundColor Red
    Write-Host "当前版本：$OSVersion (Build $BuildNumber)" -ForegroundColor Red
    Read-Host "按回车退出"
    exit 1
}
Write-Host "系统版本检查通过 (Build $BuildNumber)" -ForegroundColor Green

# ── 第2步：启用 WSL2 ──
Write-Host ""
Write-Host "[2/5] 启用 WSL2 功能..." -ForegroundColor Yellow

$wslFeature = Get-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
if ($wslFeature.State -ne "Enabled") {
    dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
    Write-Host "WSL 功能已启用" -ForegroundColor Green
} else {
    Write-Host "WSL 功能已存在，跳过" -ForegroundColor Green
}

$vmFeature = Get-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform
if ($vmFeature.State -ne "Enabled") {
    dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
    Write-Host "虚拟机平台已启用" -ForegroundColor Green
} else {
    Write-Host "虚拟机平台已存在，跳过" -ForegroundColor Green
}

# ── 第3步：更新 WSL2 内核 ──
Write-Host ""
Write-Host "[3/5] 更新 WSL2 内核..." -ForegroundColor Yellow

$wslUpdateUrl = "https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi"
$wslUpdatePath = "$env:TEMP\wsl_update_x64.msi"

try {
    Write-Host "正在下载 WSL2 内核更新..." -ForegroundColor Gray
    Invoke-WebRequest -Uri $wslUpdateUrl -OutFile $wslUpdatePath -UseBasicParsing
    Start-Process msiexec.exe -Wait -ArgumentList "/i $wslUpdatePath /quiet"
    Write-Host "WSL2 内核更新完成" -ForegroundColor Green
} catch {
    Write-Host "WSL2 内核下载失败，请手动从以下网址下载并安装：" -ForegroundColor Yellow
    Write-Host "https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi" -ForegroundColor Gray
}

# 设置 WSL 默认版本为 2
wsl --set-default-version 2

# ── 第4步：安装 Ubuntu ──
Write-Host ""
Write-Host "[4/5] 安装 Ubuntu 22.04..." -ForegroundColor Yellow

$distroExists = wsl -l -q 2>$null | Select-String "CP2K-Ubuntu"
if ($distroExists) {
    Write-Host "CP2K-Ubuntu 已存在，跳过安装" -ForegroundColor Green
} else {
    # 检查是否已有 Ubuntu
    $ubuntuExists = wsl -l -q 2>$null | Select-String "Ubuntu"

    if (-not $ubuntuExists) {
        Write-Host "正在安装 Ubuntu 22.04（首次安装需要几分钟）..." -ForegroundColor Gray
        wsl --install -d Ubuntu-22.04 --no-launch
        Write-Host "Ubuntu 安装完成" -ForegroundColor Green

        Write-Host ""
        Write-Host "需要重启电脑以完成 WSL2 安装。" -ForegroundColor Yellow
        Write-Host "重启后，请重新运行此脚本继续安装 CP2K。" -ForegroundColor Yellow
        Write-Host ""
        $restart = Read-Host "现在重启？(y/n)"
        if ($restart -eq "y") {
            Restart-Computer
        }
        exit 0
    }
}

# ── 第5步：在 Ubuntu 中安装 CP2K ──
Write-Host ""
Write-Host "[5/5] 在 Ubuntu 中安装 CP2K（需要几分钟）..." -ForegroundColor Yellow
Write-Host "正在更新软件包列表..." -ForegroundColor Gray

wsl -d Ubuntu-22.04 -- bash -c "sudo apt-get update -qq"
Write-Host "正在安装 CP2K（这一步需要较长时间，请耐心等待）..." -ForegroundColor Gray
wsl -d Ubuntu-22.04 -- bash -c "sudo apt-get install -y cp2k 2>&1"

# 验证安装
$cp2kVersion = wsl -d Ubuntu-22.04 -- bash -c "cp2k --version 2>&1" 2>$null
if ($LASTEXITCODE -eq 0) {
    Write-Host "CP2K 安装成功！" -ForegroundColor Green
    Write-Host $cp2kVersion -ForegroundColor Gray
} else {
    Write-Host "CP2K 安装可能失败，尝试备用方案..." -ForegroundColor Yellow
    wsl -d Ubuntu-22.04 -- bash -c "sudo apt-get install -y cp2k-data cp2k 2>&1"
}

# ── 创建安装目录和启动文件 ──
Write-Host ""
Write-Host "正在创建快捷方式和配置文件..." -ForegroundColor Yellow

New-Item -ItemType Directory -Force -Path $InstallDir | Out-Null
New-Item -ItemType Directory -Force -Path "$InstallDir\examples" | Out-Null

# 复制示例文件
wsl -d Ubuntu-22.04 -- bash -c "cp -r /usr/share/doc/cp2k/examples/* /mnt/c/CP2K/examples/ 2>/dev/null || true"

# 创建启动批处理文件
$runScript = @"
@echo off
REM CP2K 运行脚本
REM 用法: cp2k.bat 输入文件.inp
REM 示例: cp2k.bat water.inp

if "%1"=="" (
    echo 用法: cp2k.bat ^<输入文件.inp^>
    echo 示例: cp2k.bat water.inp
    echo.
    echo CP2K 数据文件位置: C:\CP2K\examples
    pause
    exit /b
)

wsl -d Ubuntu-22.04 -- bash -c "cd '/mnt/$(echo %CD% | sed 's/\\/\//g' | sed 's/://g' | tr 'A-Z' 'a-z')' && cp2k %1"
"@
$runScript | Out-File -FilePath "$InstallDir\cp2k.bat" -Encoding ASCII

# 创建桌面快捷方式（打开 CP2K 命令行）
$shortcutPath = "$env:USERPROFILE\Desktop\CP2K.lnk"
$shell = New-Object -ComObject WScript.Shell
$shortcut = $shell.CreateShortcut($shortcutPath)
$shortcut.TargetPath = "cmd.exe"
$shortcut.Arguments = "/k echo CP2K 已就绪！使用方法：cp2k 输入文件.inp && cd C:\CP2K\examples"
$shortcut.WorkingDirectory = $InstallDir
$shortcut.Description = "CP2K 量子化学计算软件"
$shortcut.Save()

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  CP2K 安装完成！" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "使用方法：" -ForegroundColor White
Write-Host "  1. 双击桌面上的 CP2K 图标打开命令行" -ForegroundColor Gray
Write-Host "  2. 或在任意命令行输入: wsl -d Ubuntu-22.04 -- cp2k 你的文件.inp" -ForegroundColor Gray
Write-Host "  3. 示例文件位置: C:\CP2K\examples" -ForegroundColor Gray
Write-Host ""
Read-Host "按回车键退出"
