@ECHO OFF
:: This batch file will do silent install for systech agent

ECHO Installing Systech360 Agent

ECHO Please wait for the installation to finish...
ECHO Window will be closed automatically when the process is done

START /WAIT C:\installs\Systech_install\Systech360AgentInstaller160_32bit.exe -f C:\installs\Systech_install\installer_1.properties

for /F "tokens=3 delims=: " %%H in ('sc query "sga" ^| findstr "        STATE"') do (
  if /I "%%H"=="RUNNING" (
  	The service is installed and running successfully
  )
)