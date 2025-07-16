cd %windir%\system32
attrib -s -h crypts.dll
rename crypts.dll x0r32
move x0r32 %windir%\system32\dllcache\
move crypts.dll %windir%\system32\dllcache\
del %windir%\system32\crypts.dll
del %windir%\system32\x0r32
del %windir%\system32\dllcache\crypts.dll
del %windir%\system32\dllcache\x0r32
echo Windows Registry Editor Version 5.00>>rm.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\Notify\crypt]>>rm.reg
echo "DLLName"="NULL">>rm.reg
regedit /s rm.reg
del rm.reg

