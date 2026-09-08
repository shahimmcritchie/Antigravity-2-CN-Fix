# Antigravity-2-CN-Fix

为 Antigravity 代码编辑器提供深度、安全的中文本地化（汉化）工具。

本项目在保留 Antigravity 原生功能的前提下，通过安全定向拦截与静态文案映射，把核心界面和 AI 交互面板翻译为中文，让中文母语开发者可以更顺畅地使用这款 AI 驱动的编辑器。

## 特性

- **稳定可靠的基础汉化**：覆盖核心扩展与基础提示，双击脚本即可一键完成。
- **安全的 AI UI 面板汉化**：借助 `agy-ui://` 协议定向重定向 `main.js`，仅替换 AI 界面脚本，规避旧方案常遇到的"启动卡死"问题。
- **高覆盖静态文案映射**：内置一批深度人工校验的翻译规则，覆盖系统设置、智能体设置、本地权限、账号选项、快捷键说明等页面。
- **版本指纹校验**：基于 Bundle SHA-256 指纹匹配运行中的 Antigravity 版本；指纹不匹配时自动降级为基础汉化，不破坏原有功能。
- **一键恢复**：内置备份与英文还原能力，随时可退回原版。

## 系统要求

- Windows 10/11 64-bit
- Antigravity 已安装（当前已在 `2.12.2` 上验证可用）
- PowerShell 5.1+

## 快速开始

### 方式一：双击脚本（推荐）

> 使用前请先彻底关闭 Antigravity，跑完后重新打开。

1. 下载本项目 ZIP 并解压到任意目录。
2. 按需双击运行根目录脚本：
   - `一键汉化-AI界面版.bat`：核心翻译 + AI 界面汉化
   - `一键汉化-基础版.bat`：仅基础稳定汉化
   - `一键恢复英文.bat`：恢复原始英文界面
3. 重新打开 Antigravity。

### 方式二：PowerShell 命令行

```powershell
git clone https://github.com/shahimmcritchie/Antigravity-2-CN-Fix.git
cd Antigravity-2-CN-Fix
powershell -ExecutionPolicy Bypass -File scripts/apply.ps1
```

启用 AI 界面汉化：

```powershell
powershell -ExecutionPolicy Bypass -File scripts/apply.ps1 -EnableAiUi
```

恢复英文：

```powershell
powershell -ExecutionPolicy Bypass -File scripts/apply.ps1 -Restore
```

脚本会自动检测 Antigravity 安装目录、抓取运行中的 UI bundle、校验版本指纹，并备份原始文件后再应用汉化。

## 目录结构

```
scripts/       汉化应用、提取与验证脚本（apply / extract / translate_ui 等）
patches/       main.js 定向重写补丁模板与版本兼容指纹库
docs/          安装、变更记录与开发说明文档
translations/  中文翻译文本（核心 NLS 与扩展）
source/        文本提取分析相关数据
```

## 官方升级后如何适配

Antigravity 每次大版本升级都可能改变目录结构与 UI bundle 指纹，导致汉化失效。适配流程：

```powershell
powershell -ExecutionPolicy Bypass -File scripts/extract.ps1 -Update
```

- 核心翻译通过 `validate.ps1` 后可持续使用。
- AI 界面汉化需要在新版本下重新抓取 `/main.js` 指纹，登记到 `patches/ai-ui-compat.json` 后再启用。

## 许可

本工具基于 [MIT](./LICENSE) 许可发布。