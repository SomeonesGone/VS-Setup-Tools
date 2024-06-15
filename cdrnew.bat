echo off
set arg1=%1
set arg2=%2
shift
shift
mkdir %arg1%
cd %arg1%
mkdir src
cd src
type nul > %arg1%.%arg2%
cd ..
mkdir dependencies
cd dependencies
cd ..
mkdir assets
code .
cd ..