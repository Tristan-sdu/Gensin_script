# 原神 BGI 一条龙自动化脚本

英文版说明见：`README-en.md`

用于在 Windows 上一键启动 BetterGI 一条龙流程，包含 Bilibili 服、miHoYo 官服，以及“先 Bilibili 后 miHoYo”的串行脚本。

## 来源说明
- `run_script_bilibili_then_mihoyo.bat`：本仓库作者自写（合并串行执行脚本）。
- `run_script_bilibili.bat`：来自视频方案。
- `run_script_mihoyo.bat`：来自视频方案。
- 参考视频：【原神bgi一条龙 自动化启动运行 每天4点叫电脑起来上班】
  - https://www.bilibili.com/video/BV1SXbzzHEJw/?share_source=copy_web&vd_source=2f5a3de018aebd1ce4702d71f7c0e70f

## 脚本功能
- 自动检查管理员权限（`NET SESSION`）。
- 启动前检查并关闭已运行的 `BetterGI.exe`。
- 等待 10 秒后再继续启动，避免进程冲突。
- 执行 `BetterGI.exe --startOneDragon`。

`run_script_bilibili_then_mihoyo.bat` 额外逻辑：
1. 先运行 Bilibili 路径下的一条龙。
2. 等第一个 `BetterGI.exe` 退出后，再运行 miHoYo 路径下一条龙。

## 默认路径
当前脚本内写死了以下目录（请按你的安装位置修改）：

- Bilibili：`D:\Program Files\Genshin Impact bilibili\BetterGI`
- miHoYo：`D:\Program Files\miHoYo Launcher\BetterGI`

## 使用方法
1. 右键脚本，选择“以管理员身份运行”。
2. 按需选择脚本：
   - 仅 Bilibili：`run_script_bilibili.bat`
   - 仅 miHoYo：`run_script_mihoyo.bat`
   - 先 Bilibili 再 miHoYo：`run_script_bilibili_then_mihoyo.bat`
3. 如需每天定时执行，可按视频中的“任务计划程序 + 定时唤醒”方式配置。

## 注意事项
- 本仓库仅用于脚本学习与自动化流程整理，请自行评估使用风险。
- 请遵守相关软件、平台与游戏的使用条款。
- 若出现“无法进入目录”报错，优先检查 BetterGI 实际安装路径是否与脚本一致。
- 已遇到的兼容性问题：在 Windows 11 的 PowerShell 中执行时，曾出现过 LF 行尾导致的报错；本项目脚本建议统一使用 UTF-8 编码并保持 CRLF 行尾。
