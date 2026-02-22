@echo off
:: 合并脚本：先执行 Bilibili 脚本（含管理员检测等完整逻辑），
:: 等 Bilibili 脚本“运行完（即 BetterGI 一条龙退出）”后，再执行 miHoYo 脚本。
:: 说明：已去掉每个脚本末尾的 pause，避免需要手动按键才能进入下一步。

setlocal EnableExtensions EnableDelayedExpansion
chcp 65001 >nul

:: ===============================
:: 管理员权限检测（与原脚本一致）
:: ===============================
NET SESSION >nul 2>&1
if %errorlevel% neq 0 (
    echo 请右键以管理员身份运行此脚本！
    pause
    exit /b
)

:: ======================================================
:: 1) Bilibili 脚本内容（原 run_script_bilibili.bat）
:: ======================================================
echo.
echo ===============================
echo [1/2] Bilibili：准备执行一条龙
echo ===============================

:: 先关闭已运行的 BetterGI.exe 程序
echo 正在检查并关闭已运行的 BetterGI.exe...
tasklist | find /i "BetterGI.exe" >nul
if %errorlevel% equ 0 (
    echo 发现 BetterGI.exe 正在运行，正在关闭...
    taskkill /f /im BetterGI.exe >nul 2>&1
    echo 程序已关闭，等待10秒...
    timeout /t 10 /nobreak >nul
    echo 等待完成，继续执行...
) else (
    echo BetterGI.exe 未在运行，直接启动...
)

:: 切换到指定目录
cd /d "D:\Program Files\Genshin Impact bilibili\BetterGI" || (
    echo ERROR：无法进入 Bilibili BetterGI 目录
    pause
    exit /b 1
)

:: 执行 BetterGI.exe（一条龙）
echo 正在启动 BetterGI.exe...
.\BetterGI.exe --startOneDragon

echo Bilibili 一条龙已运行结束（BetterGI.exe 已退出）。

:: ======================================================
:: 2) miHoYo 脚本内容（原 run_script_mihoyo.bat）
:: ======================================================
echo.
echo ===============================
echo [2/2] miHoYo：准备执行一条龙
echo ===============================

:: 先关闭已运行的 BetterGI.exe 程序
echo 正在检查并关闭已运行的 BetterGI.exe...
tasklist | find /i "BetterGI.exe" >nul
if %errorlevel% equ 0 (
    echo 发现 BetterGI.exe 正在运行，正在关闭...
    taskkill /f /im BetterGI.exe >nul 2>&1
    echo 程序已关闭，等待10秒...
    timeout /t 10 /nobreak >nul
    echo 等待完成，继续执行...
) else (
    echo BetterGI.exe 未在运行，直接启动...
)

:: 切换到指定目录
cd /d "D:\Program Files\miHoYo Launcher\BetterGI" || (
    echo ERROR：无法进入 miHoYo BetterGI 目录
    pause
    exit /b 1
)

:: 执行 BetterGI.exe（一条龙）
echo 正在启动 BetterGI.exe...
.\BetterGI.exe --startOneDragon

echo miHoYo 一条龙已运行结束（BetterGI.exe 已退出）。

echo.
echo 全部完成！
pause
