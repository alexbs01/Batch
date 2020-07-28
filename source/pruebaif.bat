@echo off
cls

if "%1"=="" goto error

echo Has escrito %1
if exist pru.txt echo El archivo existe & type pru.txt
goto fin

:error 
echo ERROR, debes poner un parametro

:fin