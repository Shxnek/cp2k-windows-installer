@echo off
REM CP2K 交互式命令行

title CP2K 命令行

echo.
echo  ============================================
echo   CP2K 量子化学计算软件
echo   版本: 2024
echo  ============================================
echo.
echo  常用命令:
echo    cp2k -i 输入文件.inp          运行计算
echo    cp2k -i 输入文件.inp ^> 输出.out  输出到文件
echo    ls /usr/share/doc/cp2k/        查看示例
echo.
echo  示例文件位置 (Windows): C:\CP2K\examples
echo  示例文件位置 (Linux):   /mnt/c/CP2K/examples
echo.
echo  输入 exit 退出
echo  ============================================
echo.

wsl -d CP2K
