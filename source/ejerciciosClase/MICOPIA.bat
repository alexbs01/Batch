@echo off

SET destino=%1

:repeticion
	SHIFT
	IF "%1"=="" GOTO fin
	COPY %1 %destino% 
GOTO repeticion

:fin
ECHO Programa finalizado