set projName=%1
set extension=%2
set e=%3
SET mypath=%~dp0
shift
shift
mkdir %projName%
cd %projName%
mkdir Core
mkdir App
cd App
@type nul > App.%extension%
cd ..
mkdir ThirdParty
mkdir Dependencies
cd Dependencies
mkdir Include
mkdir Libraries
cd ..
mkdir Assets
mkdir .vscode
if "%e%"=="g" (@type nul > README.md)
if "%e%"=="g" (@type %mypath%.gitignore > .gitignore)
if "%e%"=="g" (@type %mypath%.gitmodules > .gitmodules)
cd ..
code %projName%
