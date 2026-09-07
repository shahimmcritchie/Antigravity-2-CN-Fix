@echo off
cd /d "%~dp0"
start "" python "%~dp0scripts\bg_install.py" %1 "%LOCALAPPDATA%\Programs\Antigravity" "%~dp0" %2 %3 %4 %5 %6 %7 %8 %9
