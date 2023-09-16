@ECHO OFF

IF "%1" == "on" GOTO activeMachine
IF "%1" == "off" (GOTO disableMachine
	) ELSE (
		SC QUERY HvHost
		GOTO end)


:activeMachine
	SC STOP HvHost | findstr "ESTADO"
	powershell -Command "bcdedit /set hypervisorlaunchtype off"
	reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard" /v EnableVirtualizationBasedSecurity /t REG_DWORD /d 0 /f
	SC QUERY HvHost | findstr "ESTADO"
	ECHO Ahora abre el "Aislamiento del nucleo" y desactiva la "Integridad de memoria", luego reinicia
GOTO end
	

:disableMachine
	SC START HvHost | findstr "ESTADO"
	powershell -Command "bcdedit /set hypervisorlaunchtype auto"
	reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard" /v EnableVirtualizationBasedSecurity /t REG_DWORD /d 1 /f
	SC QUERY HvHost | findstr "ESTADO"
	ECHO Ahora abre el "Aislamiento del nucleo" y activa la "Integridad de memoria", luego reinicia
GOTO end

:end