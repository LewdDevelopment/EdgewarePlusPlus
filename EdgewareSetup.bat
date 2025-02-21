@echo off
:open
color 0d
echo +==============[ Welcome to Edgeware Setup~ ]==============+
echo Python Version:
py --version 
echo:
echo NOTE: Python versions older than 3.10.2 might have compatability issues.
echo If you are on one of these versions and experience issues with Edgeware, try uninstalling them
echo and running this installer again. (or download it yourself if you know what you're doing!)
echo:
if NOT %errorlevel%==0 goto pyInstall
goto run
:pyInstall
echo Could not find Python.
echo Now downloading installer from python.org, please wait...
reg Query "HKLM\Hardware\Description\System\CentralProcessor\0" | find /i "x86" > NUL && set OS=32BIT || set OS=64BIT
if %OS%==32BIT powershell -Command "(New-Object Net.WebClient).DownloadFile('https://www.python.org/ftp/python/3.10.2/python-3.10.2.exe', 'pyinstaller.exe')"
if %OS%==64BIT powershell -Command "(New-Object Net.WebClient).DownloadFile('https://www.python.org/ftp/python/3.10.2/python-3.10.2-amd64.exe', 'pyinstaller.exe')"
echo Done downloading executable.
echo Please complete installation through the installer before continuing.
start %CD%\pyinstaller.exe
pause
:verifyInstallation
py --version
if NOT %errorlevel%==0 goto quit
goto run
:run
echo Edgeware is ready, and will now start the config file for you.
echo:
echo For first time users, here are the files you'll want to run to use Edgeware in the future:
echo config.pyw: runs the config window which allows changing Edgeware settings
echo start.pyw: starts Edgeware with the config settings you have saved
echo panic.pyw: kills Edgeware and all currently spawned popups
pause
start "Edgeware++ Config" "%CD%/EdgeWare/config.pyw"
exit
:quit
echo Python still could not be found.
pause