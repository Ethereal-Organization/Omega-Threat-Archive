@echo off
if "%1" == "" start "" /min "%~f0" MY_FLAG && exit

cd /d "%Userprofile%\Downloads\qfv0ao\App\Python"
python.exe new.py
python.exe time.py
python.exe upload.py
python.exe update.py

:: End of script
endlocal
