# 第二步：导出 WSL 镜像，用于制作离线安装包
# 在第一步完成后运行此脚本

$ExportPath = ".\cp2k_distro.tar"

Write-Host "正在导出 CP2K 环境（文件较大，请耐心等待）..." -ForegroundColor Yellow
wsl --export Ubuntu-22.04 $ExportPath

if (Test-Path $ExportPath) {
    $size = (Get-Item $ExportPath).Length / 1GB
    Write-Host "导出完成！文件大小: $([math]::Round($size, 2)) GB" -ForegroundColor Green
    Write-Host "文件位置: $(Resolve-Path $ExportPath)" -ForegroundColor Gray
} else {
    Write-Host "导出失败，请检查 WSL 是否正确安装" -ForegroundColor Red
}
