#!/bin/bash
# 一键上传到 GitHub 脚本
# 在 Mac 终端运行: bash 上传到GitHub.sh

set -e

echo "=========================================="
echo "  CP2K 安装包 - 上传到 GitHub"
echo "=========================================="
echo ""

# ── 检查 git 是否安装 ──
if ! command -v git &> /dev/null; then
    echo "错误：未找到 git，请先安装 Xcode Command Line Tools："
    echo "  xcode-select --install"
    exit 1
fi

# ── 检查 gh 命令行工具 ──
if ! command -v gh &> /dev/null; then
    echo "需要安装 GitHub CLI 工具..."
    echo ""
    echo "请先运行以下命令安装 Homebrew 和 GitHub CLI："
    echo ""
    echo "  /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
    echo "  brew install gh"
    echo ""
    echo "安装完成后重新运行此脚本。"
    exit 1
fi

# ── 登录 GitHub ──
echo "检查 GitHub 登录状态..."
if ! gh auth status &> /dev/null; then
    echo "请登录 GitHub（会打开浏览器）..."
    gh auth login
fi

echo "已登录 GitHub"
echo ""

# ── 初始化 Git 仓库 ──
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

if [ ! -d ".git" ]; then
    echo "初始化 Git 仓库..."
    git init
    git branch -M main
fi

# ── 创建 .gitignore ──
cat > .gitignore << 'EOF'
# 大文件不上传（由 GitHub Actions 自动生成）
cp2k_distro.tar
output/

# macOS 系统文件
.DS_Store
EOF

# ── 提交所有文件 ──
echo "准备上传文件..."
git add .
git status

echo ""
read -p "确认上传以上文件到 GitHub？(y/n): " confirm
if [ "$confirm" != "y" ]; then
    echo "已取消"
    exit 0
fi

git commit -m "初始化 CP2K Windows 安装包项目" 2>/dev/null || \
git commit --allow-empty -m "更新配置文件"

# ── 创建 GitHub 仓库并推送 ──
REPO_NAME="cp2k-windows-installer"

echo ""
echo "正在 GitHub 上创建仓库: $REPO_NAME"
gh repo create "$REPO_NAME" \
    --public \
    --description "CP2K 量子化学计算软件 Windows 一键安装包" \
    --push \
    --source . 2>/dev/null || {
    # 仓库已存在，直接推送
    echo "仓库已存在，直接推送..."
    git remote remove origin 2>/dev/null || true
    git remote add origin "https://github.com/$(gh api user --jq .login)/$REPO_NAME.git"
    git push -u origin main --force
}

echo ""
echo "=========================================="
echo " 上传完成！"
echo "=========================================="
echo ""
GITHUB_USER=$(gh api user --jq .login)
echo " 仓库地址: https://github.com/$GITHUB_USER/$REPO_NAME"
echo ""
echo " 下一步："
echo " 1. 打开上面的仓库地址"
echo " 2. 点击 Actions 标签页"
echo " 3. 点击 '打包 CP2K Windows 安装程序'"
echo " 4. 点击 'Run workflow' 按钮"
echo " 5. 等待约 20-30 分钟"
echo " 6. 在 Artifacts 区域下载安装包"
echo ""
open "https://github.com/$GITHUB_USER/$REPO_NAME/actions" 2>/dev/null || true
