@ECHO OFF
CLS

SET /A YY=%1
SET /A inicio=10

IF "%1"=="" ECHO ERROR: Debes introducir un valor. & GOTO fin2
IF %inicio% GTR %YY% ECHO ERROR: El parametro no debe ser menor a 10. & GOTO fin2

:secuencia
	PING 192.168.24.%inicio%
	IF %YY%==%inicio% GOTO fin1
	SET /A inicio=%inicio%+1
GOTO secuencia

:fin1
ECHO.
ECHO Programa finalizado

:fin2