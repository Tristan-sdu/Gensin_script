@echo off
:: 设置代码页为UTF-8
chcp 65001 >nul

:: 管理员权限检测
NET SESSION >nul 2>&1
if %errorlevel% neq 0 (
    echo 请右键以管理员身份运行此脚本！
    pause
    exit /b
)

:: 先关闭已运行的 BetterGI.exe 程序
echo 正在检查并关闭已运行的 BetterGI.exe...
tasklist | find /i "BetterGI.exe" >nul
if %errorlevel% equ 0 (
    echo 发现 BetterGI.exe 正在运行，正在关闭...
    taskkill /f /im BetterGI.exe >nul 2>&1
    echo 程序已关闭，等待10秒...
    
    :: 添加10秒等待
    timeout /t 10 /nobreak >nul
    
    echo 等待完成，继续执行...
) else (
    echo BetterGI.exe 未在运行，直接启动...
)

:: 切换到指定目录
cd /d "D:\Program Files\Genshin Impact bilibili\BetterGI"

:: 执行BetterGI.exe程序
echo 正在启动 BetterGI.exe...
.\BetterGI.exe --startOneDragon

echo 程序已启动完成！
pause