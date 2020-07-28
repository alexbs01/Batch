@echo off

cls

if "%1"=="" goto vacio
:inicio
dir *.%1 *.%2 *.%3 *.%4 *.%5 *.%6 *.%7 *.%8 *.%9 /s /o:e
shift /8
if "*.%1"=="*." goto fin
if "*.%2"=="*." goto fin
if "*.%3"=="*." goto fin
if "*.%4"=="*." goto fin
if "*.%5"=="*." goto fin
if "*.%6"=="*." goto fin
if "*.%7"=="*." goto fin
if "*.%8"=="*." goto fin
if "*.%9"=="*." goto fin
goto inicio

:vacio
echo No hay extensiones
goto fin2

:fin
echo. 
echo.
echo No hay mas archivos con esas extensiones

:fin2