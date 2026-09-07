@echo off
cd /d "%~dp0"
title Antigravity 恢复英文
echo.
echo ==========================================
echo   Antigravity 恢复英文
echo ==========================================
echo.
echo 请先彻底关闭 Antigravity 客户端。
echo 关闭后按任意键继续...
pause >nul
echo.
powershell -ExecutionPolicy Bypass -File "%~dp0scripts\apply.ps1" -Restore
echo.
echo 操作完成。请重新打开 Antigravity。
pause
