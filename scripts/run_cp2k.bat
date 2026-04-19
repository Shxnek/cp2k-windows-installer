@echo off
chcp 65001 >nul 2>&1
REM ============================================
REM  CP2K Run Script
REM  Usage: run_cp2k.bat input.inp
REM ============================================

setlocal
set "DISTRO_EXISTS="

for /f "usebackq delims=" %%i in (`wsl -l -q 2^>nul`) do (
    if /I "%%i"=="CP2K" set "DISTRO_EXISTS=1"
)

if not defined DISTRO_EXISTS (
    echo.
    echo  Error: CP2K WSL distribution was not found. / 未找到 CP2K 的 WSL 发行版。
    echo  Please run the installer again. / 请重新运行安装程序。
    echo.
    pause
    exit /b 1
)

if "%~1"=="" (
    echo.
    echo  CP2K - Quantum Chemistry Software / 量子化学计算软件
    echo  =====================================================
    echo.
    echo  Usage / 用法:
    echo    run_cp2k.bat yourfile.inp
    echo.
    pause
    exit /b 0
)

REM Resolve full path of the input file
set "INPUT_FILE=%~f1"
set "INPUT_DIR=%~dp1"
set "INPUT_NAME=%~nx1"

REM Convert Windows paths to WSL paths using wslpath — handles any drive
REM letter, UNC paths and spaces correctly (much safer than string tricks).
for /f "usebackq delims=" %%i in (`wsl -d CP2K wslpath -a "%INPUT_DIR%"`) do set "WSL_DIR=%%i"

if "%WSL_DIR%"=="" (
    echo.
    echo  Error: failed to convert path. / 路径转换失败。
    echo  Directory / 目录: %INPUT_DIR%
    echo.
    pause
    exit /b 1
)

echo.
echo  Running CP2K / 正在运行 CP2K...
echo  Input / 输入文件: %INPUT_NAME%
echo  Directory / 工作目录: %INPUT_DIR%
echo.

wsl -d CP2K -- bash -lc "cd \"%WSL_DIR%\" && cp2k -i \"%INPUT_NAME%\" 2>&1"

if %ERRORLEVEL% EQU 0 (
    echo.
    echo  Calculation complete! / 计算完成！
) else (
    echo.
    echo  Error: please check your input file. / 运行出错，请检查输入文件。
)

echo.
pause
