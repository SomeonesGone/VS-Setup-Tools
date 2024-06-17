echo off

set projName=%1
set isGit=%2
SET mypath=%~dp0
shift
shift
mkdir %projName%
cd %projName%
mkdir src
cd src
@type %mypath%base.cpp > %projName%.cpp
cd ..
mkdir dependencies
cd dependencies
mkdir include
mkdir libs
cd ..
mkdir assets
@type %mypath%CMakeLists.txt > CMakeLists.txt
mkdir .vscode
cd .vscode
@type %mypath%c_cpp_properties.json > c_cpp_properties.json
cd ..
@type nul > .clang-format
if "%isGit%"=="g" (@type nul > README.md)
if "%isGit%"=="g" (@type nul > .gitignore)
if "%isGit%"=="g" (@type nul > .gitmodules)
if "%isGit%"=="g" (@type nul > LICENSE)
cd ..
code %projName%
