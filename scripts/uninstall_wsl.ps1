# CP2K 卸载脚本
Write-Host "正在移除 CP2K WSL 环境..." -ForegroundColor Yellow
wsl --unregister CP2K
Write-Host "CP2K 环境已移除" -ForegroundColor Green
