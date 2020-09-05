# Batch

## Que es Batch

Los archivos Batch son ficheros de texto que contienen comandos de Windows que permiten ejecutar tareas repetitivas o procesos largos y tediosos en los que hay que ejecutar una gran cantidad de comandos, todo esto se hace bajo los archivos con la extensión **.bat**.  

## Como encuentra los comandos

1. Comprueba si el comando pertenece a los incluidos en el *command.com*.  
2. Después mira si es un archivo que está en el directorio actual con una extensión *.com* o *.exe*.  
3. Luego si es un archivo *.bat* que está en el directoio actual.  
4. Finalmente, si no se cumplen ninguno de estos pasos, revisa en todos los directorios de que se alojan en la variable **PATH**.  

Sabiendo esto, es recomendable disponer de una carpeta que almacene todos los bats, para ello podemos crear una carpeta en C:\ con este propósito y añadirlo a la variable de entorno PATH.  

```cmd
C:\>mkdir Bats

C:\>set path=%path%; C:\Bats
```

## Como evitar ver las instrucciones en el cmd
Si ejecutamos un bat veremos en el cmd que instrucciones realiza en cada momento, por lo que si no queremos que se vea al inicio del bat, la primera línea será:  

```cmd
@ECHO OFF
```

## Comentarios 

Para crear comentarios en un Bathfile existen dos formas, la segunda más óptima que la primera.  

- **REM**: Poniendo REM al principio de la línea indicamos que es un comentario, por contra, indicándolo de esta manera el intérprete de comandos procesa toda la línea.  

- **::**: La otra forma es poniendo dos veces dos puntos al inicio de la línea, el intérprete lo identifica como una etiqueta errónea y no lee la línea entera.  

```cmd
@ECHO OFF
REM Esto es un comentario

:: Y esto es otro comentario
```

## ECHO

Hace aparecer los mensajes indicados en el cmd.  

- **ECHO ON**: Es la opción por defecto y hace que se muestren las instrucciones.  
- **ECHO OFF**: Hace que al ejecutarse no se muestren los comandos que se van ejecutando.  
- **ECHO [mensaje]**: Muestra el mensaje por pantalla. Este mensaje se puede redireccionar otro archivo con *>* o *>>*, el primero sobrescribe lo que hay en el fichero, y el segundo añade a mayores de lo que ya hay.  
- **ECHO.**: Crea una línea en blanco.  

## PAUSE

Para el programa mostrando por pantalla el mensaje "Presione cualquier tecla para continuar..."  

- **PAUSE**: Pausa el programa hasta que pulsemos una tecla, si lo combinamos con *> NUL* no mostrará ningún mensaje pero seguirá teniendo la misma función.  

## Parámetros

Se pueden introducir parámetros poniendolos justo después del nombre del archivo a la hora de ejecutarlo desde el terminal.  

- **%n**: Siendo **n** un valor entre 1 y 9.  

```bat
@ECHO OFF
ECHO Buenos dias, me llamo %1
ECHO Y soy de %2.
```

Para ejecutar este programa que tiene el nombre de parametros.bat haríamos:  
```cmd
C:\> parametros.bat Alejandro Coruña
```

Como a la hora de usar parámetros solo podemos usarlos entre %1 y %9 estamos limitados a 9 parámetros, por lo que para superar este límite podemos usar el comando **SHIFT**, que "bajará" todos los parámetros en uno (%2 -> %1). Entonces siguiendo esto el anterior script se podría escribir con un parámetro con esta forma:  

```bat
@ECHO OFF
ECHO Buenos dias, me llamo %1
SHIFT
ECHO Y soy de %1
```

En el cmd no habría que cambiar nada. Este comando **SHIFT** tiene un atributo, ```/n``` que permite indicar a partir de que posición (entre 2 y 9) comienza a restar uno.  

## IF

Permite crear condicionales, partes de código que no tienen porque ejecutarse sí o sí.  

**Sintaxis**  
- IF [NOT] condicion comando  
- IF [NOT] ERRORLEVEL  

**Explicación**  
- **[NOT]**: Niega, por lo que se ejecutará el comando si NO se cumple la condición.  
- **condicion**: Con la forma de **EXIST nombreArchivo** comprobará si existe el archivo y ejecutará el comando si lo hay.  
	Con la forma de **stringA==stringB**, compara las cadenas de texto diferenciando entre mayúsculas y minúsculas, los strings entre "".  
	Esta condición también puede ser **/i stringA OPERADOR strigB**, siendo OPERADOR uno de los operadores de la tabla de abajo.  
- **comando**: Si la condición se cumple se ejecuta el comando, si queremos ejecutar varios comandos entre cada uno incluiremos el símbolo de **&**

| OPERADOR | SIFNIFICADO     |  
| -------- | -----------     |  
| EQU      | igual a         |  
| NEQ      | no es igual a   |  
| LSS      | menor que       |  
| LEQ      | menor o igual a |  
| GTR      | mayor a         |  
| GEQ      | mayor o igual l |  

- ERRORLEVEL 

Cada orden genera un código de salida que indica si se ejecutó sin problemas o si hubo algún error durante el prceso. Por lo general el código 0 significa que no hubo errores.  
En [esta página web](oadcom.com/symantecenterprise/communities/community-home/librarydocuments/viewdocument?DocumentKey=82da0cae-8efa-4830-bb32-7f52f0a22402&CommunityKey=ef59d715-7ea1-41c6-97f3-dd1bcc10d0c3&tab=librarydocuments) hay una lista con una infinidad de códigos de errorlevel que pueden ser de utilidad.  

```bat
@ECHO OFF
:: Poniendo una extension como parametro comprueba si existe al menos un archivo con esa extension en el directorio actual
IF EXIST *.%1 ECHO Hay al menos un archivo .%1
IF NOT EXIST *.%1 ECHO No hay ningun archivo con esa extension en el directorio
```

Este script también se podría crear con un ELSE:  

```bat
@ECHO OFF
IF EXIST *.%1 (ECHO Hay al menos un archivo .%1
) ELSE (
ECHO No hay ningun archivo con esa extension en el directorio)

:: ELSE no puede comenzar la línea
```

## GOTO

Este comando nos permite realizar un salto hacia delante o hacia atrás, para que se ejecuten las líneas de código de una determinada manera o para realizar bucles.  

**Sintaxis**
- GOTO x
- :x

**Explicación**
El comando de goto, está conformado por dos partes, un inicio (```GOTO x```) que realiza el salto y un final (```:x```) que será el lugar al que salte la línea de ejecución del código que puede estar antes o después del goto. Hay que tener cuidado ya que se pueden crear búcles sin fin con mucha facilidad.  

```bat
@ECHO OFF
:: Hace lo mismo que el bat del if pero tiene un goto para evitar poner un segundo if

IF EXIST *.%1 ECHO Hay al menos un archivo .%1 & GOTO fin
ECHO No hay ningun archivo con esa extension en el directorio

:fin
```

## CHOICE

Nos permite una opción entre las que se nos aparecen en pantalla.  

**Sintaxis**
- CHOICE [/C teclas][/N][/S][T nn][/D predeterminado][texto]

**Explicación**  
- **[/C teclas]**: Con este parámetro podemos indicar con que teclas se hará la selección ya que por defecto es S o N.  
- **[/N]**: Hace que no se muestren las opciones por pantalla, pero el CHOICE seguirá funcionando.  
- **[/S]**: Hará que haya que distinguir entre mayúsculas y minúsculas.  
- **[/T nn]: Sustituyendo las n por un número indica el tiempo que esperará antes de escoger la opción predeterminada
- **[/D predeterminado]**: Indica la opción por defecto que se escogerá tras un determinado tiempo, esta opción debe estar incluida en el /C.  
- **[Texto]**: Muestra el texto que le aparecerá al usuarario a la hora de elegir opciones.  

Para ejecutar la opción que escogimos debemos usar un IF ERRORLEVEL, y el código del errorlevel **irá desde la última opción a la primera**.  

```bat
@ECHO OFF
:inicio
ECHO Que quieres hacer?
CHOICE /C CDS /T 20 /D S /M "abrir Calculadora, mostrar Directorios, Salir(20 segundos para S)"
IF ERRORLEVEL 3 GOTO salir
IF ERRORLEVEL 2 GOTO directorios
IF ERRORLEVEL 1 GOTO calculadora
:calculadora
	START calc.exe & GOTO fin

:directorios
	DIR & GOTO fin

:salir
	EXIT	

:fin
ECHO Desea hacer algo mas?
CHOICE /T 10 /D N

IF ERRORLEVEL 2 GOTO salir
IF ERRORLEVEL 1 GOTO inicio
```

## SET

El comando **SET** nos permite crear variables de entorno que se utilizan para controlar algunos programas.  

**Sintaxis**
- SET [parametro] [nombre=[string]]  

**Explicación**
- **[parametro]**: Este parámetro puede ser **/a** o **/p**, el primero se utiliza para definir valores númericos, en el caso de la segunda opción del atributo el string será el texto que aparecerá antes de introducir el valor de la variable. Es decir **/p** lee los valores del teclado.  
- **[nombre=[string]]**: Establece un nombre de la variable y le atribuye un valor.  

```bat
@ECHO OFF

:errorname
SET /p name="Pon tu nombre: "
IF "%name%"=="" GOTO errorname

ECHO Hola %name%
```

Este script te saluda pidiendote el nombre por una variable de entorno y comprueba si escribiste un valor o lo dejaste vacío.  

## FOR
Se utiliza para realizar bucles hasta que se cumpla una determinada condición.  

**Sintaxis**
- FOR [parametros] %%variable IN (conjunto) DO comando

**Explicación**  
- **[parametros]**: 
	- **/F**: Da la opción de recorrer las líneas de un fichero de texto y almacenarlas en la variable contenedora %%, el /F hay que utilizarlo junto con "tokens=*"
	- **/L**: Permite especificar un rango en el **conjunto** (inicio,salto,final). El conjunto (2,3,50) irá desde el 2 al 50 dando saltos de 3 en 3.  
	- **/R**: Nos permite especificar una ruta en la que se ejecutará el comando.  
	
- **%%variable**: Almacena cada uno de los valores del conjunto.  
- **(conjunto)**: El conjunto puede ser una serie de archivos sobre los que se aplicará un comando, una serie de números o un rango si utilizamos el /L.  

```bat
@ECHO OFF

FOR /L %%i IN (1,2,100) DO ECHO %%i
FOR %%i IN (exe com bat) DO DIR *.%%i
FOR %%i IN (txt) DO (
	TYPE *.%%i
	)
```

Este archivo mostraría los números del uno al cien yendo de dos en dos, depués mostraría todos los .exe, .com y .bat del directorio actual y por último mostrara por pantalla todo el contenido de todos los .txt.  

## CALL o START

Ambas instrucciones tienen la misma utilidad, ejecutar un programa externo al archivo bat que se está ejecutando.  

**Sintaxis**
- CALL nombreDelProgama  
> START tiene la misma sintaxis pero tiene muchos más atributos posibles que lo hacen más versatil, para ver todo los atributos basta con poner *start /?* en el cmd

**Explicación**  
Estos comandos permiten ejecutar un programa y posteriormente una vez este se ejecute vuelve al bat y continúa con la línea de ejecución. Si no se pusiera ninguno de estos dos comandos y se pusiera directamente el nombre del archivo la línea de ejecución finalizaría con el programa, ya que CALL y START hacen que continúe la ejecución.  

