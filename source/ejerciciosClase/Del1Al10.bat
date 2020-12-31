@ECHO OFF
CLS

SET /A numero=1

:secuencia
	ECHO %numero%
	IF %numero%==10 GOTO fin
	SET /A numero=%numero%+1
GOTO secuencia

:fin
ECHO.
ECHO Programa finalizado