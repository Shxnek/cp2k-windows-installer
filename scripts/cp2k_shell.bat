@echo off
chcp 65001 >nul 2>&1
REM CP2K interactive shell launcher

title CP2K Shell

echo.
echo  ============================================
echo   CP2K Quantum Chemistry Software
echo   CP2K 量子化学计算软件
echo   Version / 版本: 2026.1
echo  ============================================
echo.
echo  Common commands / 常用命令:
echo    cp2k -i input.inp              Run calculation / 运行计算
echo    cp2k -i input.inp ^> out.log    Save output / 输出到文件
echo.
echo  Example files / 示例文件:
echo    Windows : C:\CP2K\examples
echo    Linux   : /mnt/c/CP2K/examples
echo.
echo  Type "exit" to quit / 输入 exit 退出
echo  ============================================
echo.

wsl -d CP2K
