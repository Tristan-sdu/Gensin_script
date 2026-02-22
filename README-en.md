# Genshin BGI One-Dragon Automation Scripts

One-click Windows scripts to start BetterGI one-dragon workflows, including Bilibili server, miHoYo official server, and a sequential script that runs Bilibili first and miHoYo second.

English README: `README-en.md`

## Source Notes
- `run_script_bilibili_then_mihoyo.bat`: written by this repository owner (merged sequential script).
- `run_script_bilibili.bat`: based on the video workflow.
- `run_script_mihoyo.bat`: based on the video workflow.
- Reference video: "原神bgi一条龙 自动化启动运行 每天4点叫电脑起来上班"
  - https://www.bilibili.com/video/BV1SXbzzHEJw/?share_source=copy_web&vd_source=2f5a3de018aebd1ce4702d71f7c0e70f

## Script Features
- Checks administrator privileges automatically (`NET SESSION`).
- Checks and closes running `BetterGI.exe` before launch.
- Waits 10 seconds before continuing to avoid process conflicts.
- Runs `BetterGI.exe --startOneDragon`.

Extra logic in `run_script_bilibili_then_mihoyo.bat`:
1. Run one-dragon under the Bilibili path first.
2. After the first `BetterGI.exe` exits, run one-dragon under the miHoYo path.

## Default Paths
The scripts currently use hardcoded directories (change them to your local install paths):

- Bilibili: `D:\Program Files\Genshin Impact bilibili\BetterGI`
- miHoYo: `D:\Program Files\miHoYo Launcher\BetterGI`

## Usage
1. Right-click the script and select "Run as administrator".
2. Choose the script you need:
   - Bilibili only: `run_script_bilibili.bat`
   - miHoYo only: `run_script_mihoyo.bat`
   - Bilibili then miHoYo: `run_script_bilibili_then_mihoyo.bat`
3. If you want daily automation, configure Task Scheduler + wake timer as shown in the video.

## Notes
- This repository is for script learning and automation workflow organization; evaluate risks by yourself.
- Follow the terms of use of related software, platforms, and the game.
- If you see a "cannot enter directory" error, check whether the BetterGI install path matches the script.
- Known compatibility issue: when running in Windows 11 PowerShell, LF line endings previously caused errors; keep scripts in UTF-8 encoding with CRLF line endings.
