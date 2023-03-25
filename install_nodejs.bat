@echo off

REM Download and install Node.js.
mkdir %USERPROFILE%\Downloads\nodejs
cd %USERPROFILE%\Downloads\nodejs
powershell -Command "(New-Object System.Net.WebClient).DownloadFile('https://nodejs.org/dist/v14.16.0/node-v14.16.0-x64.msi', 'node.msi')"
start /wait msiexec /i node.msi /quiet
cd ..
rmdir /s /q nodejs
