# CP2K Windows One-Click Installer

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![CP2K Version](https://img.shields.io/badge/CP2K-2026.1-blue)](https://www.cp2k.org)
[![Build](https://github.com/Shxnek/cp2k-windows-installer/actions/workflows/build.yml/badge.svg)](https://github.com/Shxnek/cp2k-windows-installer/actions/workflows/build.yml)

> CP2K is a professional scientific software for quantum chemistry and solid-state physics simulations.
> This project packages CP2K **2026.1** (latest) as a Windows one-click installer — no technical background required, just double-click to install.
>
> Powered by **Ubuntu 24.04 WSL2 + conda-forge**.

---

## Download

1. Click the **Actions** tab at the top of the page
   <img width="1635" height="299" alt="5e72a199425a2024152714b0ba9e4ccb" src="https://github.com/user-attachments/assets/87617604-f057-44f1-a588-4d9b62a8ebec" />
2. Click the latest entry with a green checkmark
   <img width="1470" height="528" alt="9ccb80869028a30441ad89ab3adec894" src="https://github.com/user-attachments/assets/05ed9370-4c8c-48c4-8206-f78b276048e6" />
3. Scroll to the bottom and click the installer under **Artifacts** → `CP2K-Windows-installer`
   <img width="2150" height="1229" alt="ab27a5e719b4b66e670d7b128cd11d61" src="https://github.com/user-attachments/assets/60579bc7-610f-481d-bf8f-24e3f4ff6160" />
4. Unzip the `.zip` file to get `CP2K_2026.1_Windows_Setup.exe`
5. Right-click → **Run as administrator** and follow the prompts

> 💡 The installer is approximately 1–2 GB. Installation takes 3–5 minutes — please be patient.

---

## When to Use This Installer

This installer runs CP2K inside **WSL2 on a single Windows PC** — ideal for learning and testing, not for large-scale production.

| Scenario | Suitability |
|----------|-------------|
| Learning & getting started | ✅ Excellent |
| Input file debugging | ✅ Excellent |
| Small system single-point / geometry optimisation | ✅ Good |
| Short AIMD runs | ✅ Acceptable |
| Large system calculations | ❌ Not suitable |
| Multi-node parallel computing | ❌ Not available |
| GPU-accelerated calculations | ❌ Not recommended |
| Long-term production runs | ❌ Unstable |

### Recommended Workflow

```
Local WSL2 (this installer)          Remote Linux HPC
         |                                   |
  Write input files               Large-scale calculations
  Test small systems              Multi-node parallel jobs
  Tune parameters                 Long production runs
  Analyse results                 GPU acceleration
         |                                   |
         └──── Validate locally, then submit ┘
```

> **Best practice:** Treat WSL2 + CP2K as your **development and testing environment**, not a production computing platform.

---

## Installation Overview

The installer guides you through the entire process — no manual steps needed. Built-in checks and prompts include:

- **Pre-install checks**
  - Windows version requirement (Win10 2004 or later)
  - Sufficient disk space (at least 6 GB on C drive)
  - WSL2 availability (enabled automatically if missing)

- **Real-time progress**
  - Step 1/3: Import CP2K runtime environment (~2–4 min)
  - Step 2/3: Configure system environment variables
  - Step 3/3: Clean up temporary files

- **On failure**
  - A dialog appears explaining the exact cause and recommended fix

---

## System Requirements

| Item | Requirement |
|------|-------------|
| OS | Windows 10 (version 2004 or later) or Windows 11 |
| RAM | 4 GB or more |
| Disk space | At least 6 GB free on drive C |
| Other | CPU must support virtualisation (enabled by default on most modern PCs) |

> Not sure about your Windows version? Press `Win + R`, type `winver`, and press Enter.

---

## How to Use After Installation

A **CP2K** shortcut will appear on your desktop after installation.

**Run a calculation:**
- Double-click the CP2K desktop icon to open a shell, then type:
  ```
  cp2k -i yourfile.inp
  ```
  The shell tries to open in your Windows user home directory (`C:\Users\<you>`). If that path cannot be resolved inside WSL, it falls back to the Linux home directory.

---

## FAQ

**Q: The installer says "virtualisation needs to be enabled"?**
Restart, press `Del` or `F2` to enter BIOS, find `Virtualization Technology`, set it to `Enabled`, save and restart.

**Q: The installer enabled WSL2 but the import still fails after reboot?**
Make sure Windows has fully restarted and finished applying the optional-feature changes. On Windows 10, you may also need to install the WSL2 Linux kernel update package: `https://aka.ms/wsl2kernel`

**Q: My antivirus flagged the installer — is it safe?**
Temporarily disable real-time protection before installing, then re-enable it afterwards. WSL2 import operations are sometimes mis-flagged.

**Q: Installation is stuck on "Importing runtime environment" — is that normal?**
Yes — this step takes 2–4 minutes. Please wait and do not force-close the window.

**Q: I downloaded a `.zip` file — where is the `.exe`?**
GitHub wraps artifacts in `.zip`. Unzip it and the `.exe` installer is inside.

**Q: How do I uninstall?**
Control Panel → Programs → Uninstall a program → CP2K → Uninstall. All files are removed automatically.

---

## Build It Yourself

To build from source (e.g. to update the CP2K version):

1. Fork this repository
2. Go to **Actions → Build CP2K Windows Installer**
3. Click **Run workflow** on the right
4. Wait ~30–40 minutes (conda-forge download included); download the result from the Artifacts section

Completely free — GitHub provides 2,000 free build minutes per month.

---

## Project Structure

```
cp2k-windows-installer/
├── .github/workflows/
│   └── build.yml              # Automated build pipeline (GitHub Actions)
│                              # Uses Ubuntu 24.04 WSL2 + conda-forge cp2k 2026.1
├── installer/
│   ├── cp2k_setup.iss         # Inno Setup installer script (bilingual EN/ZH)
│   └── cp2k.ico               # Application icon (multi-resolution)
├── scripts/
│   ├── cp2k_shell.bat         # CP2K shell launcher (tries Windows home, falls back to Linux home)
│   ├── run_cp2k.bat           # Command-line calculation runner
└── README.md
```

---

## License

This project is licensed under the **MIT License** — see the [LICENSE](LICENSE) file for details.

CP2K itself is licensed under the [GPL-2.0 License](https://github.com/cp2k/cp2k/blob/master/LICENSE).

---

## Links

- [CP2K Official Website](https://www.cp2k.org)
- [CP2K Manual](https://manual.cp2k.org)

---
---

# CP2K Windows 一键安装包

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![CP2K Version](https://img.shields.io/badge/CP2K-2026.1-blue)](https://www.cp2k.org)
[![Build](https://github.com/Shxnek/cp2k-windows-installer/actions/workflows/build.yml/badge.svg)](https://github.com/Shxnek/cp2k-windows-installer/actions/workflows/build.yml)

> CP2K 是一款用于量子化学和固体物理计算的专业科学软件。
> 本项目将 **CP2K 2026.1**（最新版）打包为 Windows 一键安装程序，无需任何技术背景，双击即可完成安装。
>
> 基于 **Ubuntu 24.04 WSL2 + conda-forge** 构建。

---

## 下载安装包

1. 点击页面顶部的 **Actions** 标签
   <img width="1635" height="299" alt="5e72a199425a2024152714b0ba9e4ccb" src="https://github.com/user-attachments/assets/87617604-f057-44f1-a588-4d9b62a8ebec" />
2. 点击最新一条带绿色勾的记录
   <img width="1470" height="528" alt="9ccb80869028a30441ad89ab3adec894" src="https://github.com/user-attachments/assets/05ed9370-4c8c-48c4-8206-f78b276048e6" />
3. 拉到页面底部，点击 **Artifacts** 下的 `CP2K-Windows-installer` 下载
   <img width="2150" height="1229" alt="ab27a5e719b4b66e670d7b128cd11d61" src="https://github.com/user-attachments/assets/60579bc7-610f-481d-bf8f-24e3f4ff6160" />
4. 解压 `.zip` 文件，得到 `CP2K_2026.1_Windows_Setup.exe`
5. 右键 → **以管理员身份运行**，按提示完成安装

> 💡 安装程序约 1-2 GB，安装过程需要 3-5 分钟，请耐心等待。

---

## 使用场景

本安装包在**单台 Windows 电脑的 WSL2**中运行 CP2K，适合学习和测试，不适用于大规模生产计算。

| 场景 | 是否适合 |
|------|---------|
| 学习入门 | ✅ 非常适合 |
| 输入文件调试 | ✅ 非常适合 |
| 小体系单点/优化 | ✅ 适合 |
| 短时间 AIMD | ✅ 勉强适合 |
| 大体系计算 | ❌ 不适合 |
| 多节点并行 | ❌ 不可用 |
| GPU 加速计算 | ❌ 不推荐 |
| 长时间生产计算 | ❌ 不稳定 |

### 推荐工作流

```
本地 WSL2（本安装包）                  远程 Linux 服务器
        |                                      |
  写输入文件                           大规模计算
  小体系测试                           多节点并行
  参数调试                             长时间任务
  结果分析                             GPU 加速
        |                                      |
        └────────── 确认无误后提交 ────────────┘
```

> **最佳实践：** 把 WSL2 + conda CP2K 定位成**开发和测试环境**，而不是生产计算环境，是最合理的使用方式。

---

## 安装过程说明

安装程序会全程引导，无需手动操作。内置的检查和提示包括：

- **安装前自动检查**
  - Windows 版本是否满足要求（需 Win10 2004 或更高）
  - C 盘是否有足够空间（至少 6GB）
  - WSL2 是否已启用（未启用会自动帮你开启，并提示重启）

- **安装中实时进度**
  - 步骤 1/3：导入 CP2K 运行环境（约 2-4 分钟）
  - 步骤 2/3：配置系统环境变量
  - 步骤 3/3：清理临时文件

- **安装失败时**
  - 尽量区分是 Windows 功能启用失败、WSL2 尚未就绪，还是导入运行环境失败
  - Windows 10 如缺少 WSL2 内核更新包，也会提示额外处理步骤

---

## 系统要求

| 项目 | 要求 |
|------|------|
| 操作系统 | Windows 10（2004 版本及以上）或 Windows 11 |
| 内存 | 4GB 及以上 |
| 硬盘空间 | C 盘至少 6GB 可用空间 |
| 其他 | CPU 需支持虚拟化（绝大多数现代电脑默认支持）|

> 不确定 Windows 版本？按 `Win + R`，输入 `winver` 回车查看。

---

## 安装完成后如何使用

安装完成后，桌面会出现 **CP2K** 快捷方式。

**运行计算：**
- 双击桌面 CP2K 图标，打开命令行后输入：
  ```
  cp2k -i 你的文件.inp
  ```
  Shell 会优先定位到你的 Windows 用户主目录（`C:\Users\用户名`）；如果该路径在 WSL 中无法解析，则会回退到 Linux 用户主目录。

---

## 常见问题

**Q：安装时提示"需要启用虚拟化"？**
重启电脑，开机按 `Del` 或 `F2` 进入 BIOS，找到 `Virtualization Technology`，改为 `Enabled` 保存重启。

**Q：安装器提示已启用 WSL2，但重启后仍然导入失败？**
请先确认 Windows 已经真正完成重启，并且可选功能修改已应用完成。如果你使用的是 Windows 10，还可能需要手动安装 WSL2 Linux 内核更新包：`https://aka.ms/wsl2kernel`

**Q：杀毒软件报警怎么办？**
安装前临时关闭杀毒软件的实时防护，安装完成后再开启。WSL2 的导入操作有时会被误报。

**Q：安装卡在"导入运行环境"很久？**
正常现象，这一步需要 2-4 分钟，请耐心等待，不要强行关闭。

**Q：下载的是 `.zip` 文件？**
正常的，GitHub 会自动打包成 `.zip`。解压后里面就是 `.exe` 安装包。

**Q：如何卸载？**
控制面板 → 程序 → 卸载程序 → 找到 CP2K → 卸载，会自动清理所有文件。

---

## 自行重新打包

如需自己构建（例如更新 CP2K 版本），操作如下：

1. Fork 本仓库
2. 进入 **Actions → Build CP2K Windows Installer / 打包 CP2K Windows 安装程序**
3. 点击右侧 **Run workflow**
4. 等待约 30-40 分钟（含 conda-forge 下载），完成后在 Artifacts 区域下载

全程免费，GitHub 每月提供 2000 分钟免费构建时间。

---

## 项目结构

```
cp2k-windows-installer/
├── .github/workflows/
│   └── build.yml              # 自动打包流程（GitHub Actions）
│                              # 基于 Ubuntu 24.04 WSL2 + conda-forge cp2k 2026.1
├── installer/
│   ├── cp2k_setup.iss         # Inno Setup 安装包脚本（中英双语界面）
│   └── cp2k.ico               # 应用程序图标（多分辨率）
├── scripts/
│   ├── cp2k_shell.bat         # CP2K 命令行启动脚本（优先进入 Windows 主目录，失败回退到 Linux 主目录）
│   ├── run_cp2k.bat           # 命令行计算运行脚本
└── README.md
```

---

## 许可证

本项目基于 **MIT 许可证** 开源，详见 [LICENSE](LICENSE) 文件。

CP2K 本体采用 [GPL-2.0 许可证](https://github.com/cp2k/cp2k/blob/master/LICENSE)。

---

## 相关链接

- [CP2K 官方网站](https://www.cp2k.org)
- [CP2K 使用手册](https://manual.cp2k.org)
