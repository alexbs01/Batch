@ECHO OFF
:: Poner la maquina virtual con 256 MB de memoria grafica
:: graficaVB "<NombreMaquina1>" "<NombreMaquina2>"...
:: Poner el nombre entre comillas
CLS

IF "%1"=="" GOTO instrucciones

:siguienteMaquina

START C:\"Program Files"\Oracle\VirtualBox\VBoxManage modifyvm %1 --vram 256
ECHO La memoria virtual de la maquina %1 se actualizo.
ECHO.

SHIFT
IF "%1"=="" GOTO fin

GOTO siguienteMaquina

:instrucciones
ECHO.
ECHO La sintaxis es:
ECHO graficaVB "<NombreMaquina1>" "<NombreMaquina2>"...
ECHO.

:fin
