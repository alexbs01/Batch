@ECHO OFF
CLS

SET /A num1=%1
SET /A num2=%2

IF "%1"=="" ECHO Debes introducir dos valores. & GOTO fin2
IF "%2"=="" ECHO Debes introducir un segundo valor. & GOTO fin2
IF %num1% GTR %num2% ECHO ERROR: El primer parametro debe ser menor que el segundo. & GOTO fin2

:secuencia
	ECHO %num1%
	IF %num1%==%2 GOTO fin1
	SET /A num1=%num1%+1
GOTO secuencia

:fin1
	ECHO.
	ECHO Programa finalizado

:fin2