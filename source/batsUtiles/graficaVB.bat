@ECHO OFF
ECHO.
ECHO **************
ECHO * REQUISITOS *
ECHO **************
ECHO.
ECHO ES OBLIGATORIO QUE EN TODA LA RUTA DE LA MAQUINA VIRTUAL NO HAYA ESPACIOS
ECHO.
ECHO *****************
ECHO * Instrucciones *
ECHO *****************
ECHO.
ECHO 1. Cuando se abra el archivo de texto borra las rutas de las maquinas de las que no quieras modificar la VRAM
ECHO 2. Cuando en el .txt solo haya la maquinas deseadas GUARDA el archivo y cierralo
ECHO 3. Despues pulsa ENTER
ECHO.
PAUSE

DIR /B /S *.vbox >> direccionesVMAumentoGrafica.txt

START direccionesVMAumentoGrafica.txt

PAUSE
 
FOR /F %%i IN (direccionesVMAumentoGrafica.txt) DO (
	START C:\"Program Files"\Oracle\VirtualBox\vboxmanage modifyvm %%i --vram 256
	IF %ERRORLEVEL% == 0 ECHO Maquina %%i con VRAM cambiada a 256
)

DEL direccionesVMAumentoGrafica.txt
