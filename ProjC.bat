echo off

set projName=%1
set e1=%2
set e2=%3
SET mypath=%~dp0
shift
shift
mkdir %projName%
cd %projName%
mkdir App
cd App
@type %mypath%CMakeListsApp.txt > CMakeLists.txt
@type %mypath%base.cpp > App.cpp
@type %mypath%pch.hpp > pch.hpp
cd ..
mkdir ThirdParty
mkdir Core
cd Core
@type %mypath%CMakeListsCore.txt > CMakeLists.txt
mkdir CoreLib
cd CoreLib
@type %mypath%CMakeListsCoreLib.txt > CMakeLists.txt
mkdir Files
cd Files
@type %mypath%Instrumentor.cpp > Instrumentor.cpp
cd ..
mkdir Include
cd Include
mkdir Instrumentor
cd Instrumentor
@type %mypath%Instrumentor.hpp > Instrumentor.hpp
cd ..
cd ..
cd ..
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
