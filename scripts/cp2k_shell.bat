@echo off
chcp 65001 >nul 2>&1
REM CP2K interactive shell launcher

setlocal

title CP2K Shell

echo.
echo  ============================================
echo   CP2K Quantum Chemistry Software
echo   CP2K 量子化学计算软件
echo   Version / 版本: 2026.1
echo  ============================================
echo.
echo  Working directory / 当前目录:
echo    Tries Windows user home first / 优先进入 Windows 用户主目录
echo    Falls back to Linux home if needed / 必要时回退到 Linux 用户主目录
echo    e.g.  /mnt/c/Users/%USERNAME%
echo.
echo  Common commands / 常用命令:
echo    cp2k -i input.inp              Run calculation / 运行计算
echo    cp2k -i input.inp ^> out.log    Save output / 输出到文件
echo.
echo  Type "exit" to quit / 输入 exit 退出
echo  ============================================
echo.

set "WINDOWS_HOME=%USERPROFILE%"
set "WSL_HOME="
set "DISTRO_EXISTS="

for /f "usebackq delims=" %%i in (`wsl -l -q 2^>nul`) do (
    if /I "%%i"=="CP2K" set "DISTRO_EXISTS=1"
)

if not defined DISTRO_EXISTS (
    echo  Error / 错误:
    echo    CP2K WSL distribution was not found. / 未找到 CP2K 的 WSL 发行版。
    echo    Please run the installer again. / 请重新运行安装程序。
    echo.
    pause
    exit /b 1
)

REM Convert the Windows home directory to a WSL path before using it.
for /f "usebackq delims=" %%i in (`wsl -d CP2K wslpath -a "%WINDOWS_HOME%" 2^>nul`) do set "WSL_HOME=%%i"

if defined WSL_HOME (
    wsl -d CP2K -- bash -lc "cd \"%WSL_HOME%\" 2>/dev/null || cd ~; exec bash"
) else (
    echo  Warning / 警告:
    echo    Failed to locate your Windows home in WSL. / 无法在 WSL 中定位你的 Windows 用户目录。
    echo    Falling back to the Linux home directory. / 将回退到 Linux 用户主目录。
    echo.
    wsl -d CP2K --cd ~
)
