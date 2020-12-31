@ECHO OFF
CLS

SET /P nombre=Tipo de usuario: 
SET /P inicio=Numero inicial de usuario: 
SET /P final=Numero de usuarios a crear: 
SET /A ultimo_usuario="%final%+%inicio%-1"

:BucleUsuario
	NET USER %nombre%%inicio% /ADD
	IF "%inicio%"=="%ultimo_usuario%" GOTO fin
	SET /A inicio=%inicio%+1
GOTO BucleUsuario

:fin
	ECHO Se crearon %final% usuarios nuevos