@ECHO OFF
CLS

SET /A num1=0
SET /A num2=1
SET /A num3=0
SET /A tope=%1

IF "%1"=="" GOTO error1
IF %1 LSS 0 GOTO error2

:repeticion
	ECHO %num1%
	IF %num1% GTR %tope% GOTO fin
	SET /A num1=%num1%+%num2%
	SET /A num2=%num3%
	SET/A num3=%num1%
GOTO repeticion

:error1
	ECHO Debes poner un numero que sirva como maximo
	GOTO fin

:error2
	ECHO Debes poner un numero mayor que 0
	GOTO fin

:fin
	ECHO Programa finalizado