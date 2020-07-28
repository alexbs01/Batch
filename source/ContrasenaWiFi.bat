@ECHO OFF
CLS

netsh wlan show profile

SET /P networkname=Nombre de la red: 

netsh wlan show profile %networkname% key=clear
PAUSE