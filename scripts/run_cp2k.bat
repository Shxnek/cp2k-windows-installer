@echo off
REM ============================================
REM  CP2K 运行脚本
REM  用法: 把此文件拖到你的 .inp 文件上
REM     或: cp2k.bat 输入文件.inp
REM ============================================

setlocal

if "%~1"=="" (
    echo.
    echo  CP2K - 量子化学计算软件
    echo  ========================
    echo.
    echo  用法:
    echo    直接把 .inp 文件拖拽到本图标上运行
    echo    或在命令行输入: cp2k.bat ^<你的文件.inp^>
    echo.
    echo  示例文件位置: C:\CP2K\examples
    echo.
    pause
    exit /b 0
)

REM 获取输入文件的完整路径
set "INPUT_FILE=%~f1"
set "INPUT_DIR=%~dp1"
set "INPUT_NAME=%~nx1"

REM 将 Windows 路径转换为 WSL 路径
REM 例如: C:\Users\xxx\test.inp -> /mnt/c/Users/xxx/test.inp
set "WSL_DIR=%INPUT_DIR:~0,1%"
set "WSL_DIR=%WSL_DIR:C=c%"
set "WSL_DIR=%WSL_DIR:D=d%"
set "WSL_DIR=%WSL_DIR:E=e%"
set "WSL_PATH=/mnt/%WSL_DIR%/%INPUT_DIR:~3%"
set "WSL_PATH=%WSL_PATH:\=/%"

echo.
echo  正在运行 CP2K...
echo  输入文件: %INPUT_NAME%
echo  工作目录: %INPUT_DIR%
echo.

wsl -d CP2K -- bash -c "cd '%WSL_PATH%' && cp2k -i '%INPUT_NAME%' 2>&1"

if %ERRORLEVEL% EQU 0 (
    echo.
    echo  计算完成！
) else (
    echo.
    echo  运行出错，请检查输入文件是否正确。
)

echo.
pause
