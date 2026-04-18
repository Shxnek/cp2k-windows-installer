@echo off
chcp 65001 >nul 2>&1
REM ============================================
REM  CP2K Run Script
REM  Usage: run_cp2k.bat input.inp
REM ============================================

setlocal

if "%~1"=="" (
    echo.
    echo  CP2K - Quantum Chemistry Software / 量子化学计算软件
    echo  =====================================================
    echo.
    echo  Usage / 用法:
    echo    run_cp2k.bat yourfile.inp
    echo.
    echo  Example files / 示例文件: %~dp0examples
    echo.
    pause
    exit /b 0
)

REM Get full path of input file
set "INPUT_FILE=%~f1"
set "INPUT_DIR=%~dp1"
set "INPUT_NAME=%~nx1"

REM Convert Windows path to WSL path (e.g. C:\Users\x\test.inp -> /mnt/c/Users/x/test.inp)
set "WSL_DIR=%INPUT_DIR:~0,1%"
set "WSL_DIR=%WSL_DIR:C=c%"
set "WSL_DIR=%WSL_DIR:D=d%"
set "WSL_DIR=%WSL_DIR:E=e%"
set "WSL_PATH=/mnt/%WSL_DIR%/%INPUT_DIR:~3%"
set "WSL_PATH=%WSL_PATH:\=/%"

echo.
echo  Running CP2K / 正在运行 CP2K...
echo  Input / 输入文件: %INPUT_NAME%
echo  Directory / 工作目录: %INPUT_DIR%
echo.

wsl -d CP2K -- bash -c "export CP2K_DATA_DIR=/opt/conda/share/cp2k/data; cd '%WSL_PATH%' && cp2k -i '%INPUT_NAME%' 2>&1"

if %ERRORLEVEL% EQU 0 (
    echo.
    echo  Calculation complete! / 计算完成！
) else (
    echo.
    echo  Error: please check your input file. / 运行出错，请检查输入文件。
)

echo.
pause
