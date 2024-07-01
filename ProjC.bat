echo off

set projName=%1
set e1=%2
set e2=%3
SET mypath=%~dp0
shift
shift
mkdir %projName%
cd %projName%
mkdir Core
cd Core
@type %mypath%Instrumentor.h > Instrumentor.h
@type nul > Instrumentor.cpp
cd ..
mkdir App
cd App
@type %mypath%base.cpp > App.cpp
@type %mypath%pch.h > pch.h
cd ..
mkdir ThirdParty
mkdir Dependencies
cd Dependencies
mkdir Include
mkdir Libraries
cd ..
mkdir Assets
@type %mypath%CMakeLists.txt > CMakeLists.txt
mkdir .vscode
cd .vscode
@type %mypath%c_cpp_properties.json > c_cpp_properties.json
cd ..
@type nul > .clang-format
if "%e1%"=="g" (@type nul > README.md)
if "%e1%"=="g" (@type %mypath%.gitignore > .gitignore)
if "%e1%"=="g" (@type %mypath%.gitmodules > .gitmodules)
if "%e2%"=="g" (@type nul > README.md)
if "%e2%"=="g" (@type %mypath%.gitignore > .gitignore)
if "%e2%"=="g" (@type %mypath%.gitmodules > .gitmodules)
cd ..
code %projName%
