@echo off
set date=2003-02-10
date %date%
ping -n 10 localhost > nul 
del %0
