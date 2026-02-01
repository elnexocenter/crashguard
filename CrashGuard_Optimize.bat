@echo off
setlocal enabledelayedexpansion
title CRASHGUARD ULTIMATE PRO - Kenif - Programmer (Powered By ElNexo)
color 0B

:: Admin Check
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo [!] ERROR: SE REQUIEREN PRIVILEGIOS DE ADMINISTRADOR.
    echo [!] POR FAVOR, EJECUTA COMO ADMINISTRADOR.
    pause
    exit /b
)

:MENU
cls
echo.
echo    ##########################################################
echo    #                                                        #
echo    #   CRASHGUARD ULTIMATE PRO - SYSTEM ENGINE V2.0         #
echo    #   Developer: Kenif - Programmer                        #
echo    #   Architecture: ElNexo Ego-System                      #
echo    #                                                        #
echo    ##########################################################
echo.
echo    [1] OPTIMIZACION TOTAL (RECOMENDADO)
echo    [2] SOLO GAMING ^& LATENCIA
echo    [3] LIMPIEZA DE SISTEMA ^& MEMORIA
echo    [4] SALIR
echo.
set /p opt="> Selecciona una opcion: "

if "%opt%"=="1" goto FULL_OPT
if "%opt%"=="2" goto GAME_OPT
if "%opt%"=="3" goto CLEAN_OPT
if "%opt%"=="4" exit
goto MENU

:FULL_OPT
cls
echo [+] INICIANDO OPTIMIZACION TOTAL...
echo.

:: 1. POWER PLAN OPTIMIZATION
echo [+] Configurando Plan de Energia "Ultimate Performance"...
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 >nul 2>&1
powercfg -setactive e9a42b02-d5df-448d-aa00-03f14749eb61 >nul 2>&1
:: Disable Power Throttling
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d 1 /f >nul 2>&1

:: 2. GAMING ^& KERNEL TWEAKS
echo [+] Tuning Kernel ^& Game Mode...
:: Enable Game Mode
reg add "HKCU\Software\Microsoft\GameBar" /v "AllowAutoGameMode" /t REG_DWORD /d 1 /f >nul
:: BCD Tweaks
bcdedit /set disabledynamictick yes >nul
bcdedit /set useplatformtick yes >nul
bcdedit /set tscsyncpolicy Enhanced >nul
:: Priority Separation (Max Performance)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d 38 /f >nul

:: 3. NETWORK OPTIMIZATION
echo [+] Optimizando Stack de Red ^& Latencia...
:: TCP Global Parameters
netsh int tcp set global autotuninglevel=normal >nul
netsh int tcp set global chimney=enabled >nul
netsh int tcp set global dca=enabled >nul
netsh int tcp set global netmanagesoftware=disabled >nul
netsh int tcp set global non_sack_cts_areas=disabled >nul
netsh int tcp set global rss=enabled >nul
netsh int tcp set global ecncapability=disabled >nul
:: DNS Optimization (Cloudflare)
netsh interface ip set dns name="Ethernet" static 1.1.1.1 >nul 2>&1
netsh interface ip add dns name="Ethernet" 1.0.0.1 index=2 >nul 2>&1

:: 4. VISUAL EFFECTS (Performance Mode)
echo [+] Optimizando Efectos Visuales...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /t REG_DWORD /d 2 /f >nul

:: 5. SERVICE REDUCTION
echo [+] Deshabilitando Servicios de Telemetria...
for %%s in (DiagTrack SysMain TrkWks WbioSrvc TabletInputService PrintNotify Spooler MapsBroker) do (
    sc stop "%%s" >nul 2>&1
    sc config "%%s" start= disabled >nul 2>&1
)

goto FINISH

:GAME_OPT
cls
echo [+] OPTIMIZANDO PARA GAMING EXTREMO...
:: GPU Latency tweak
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchMode" /t REG_DWORD /d 2 /f >nul
:: Multimedia Class Scheduler tweaks
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d 4294967295 /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d 0 /f >nul
goto FINISH

:CLEAN_OPT
cls
echo [+] LIMPIANDO ARCHIVOS TEMPORALES ^& MEMORIA...
del /q /f /s %temp%\* >nul 2>&1
del /q /f /s C:\Windows\Temp\* >nul 2>&1
prefetcher /clear >nul 2>&1
powershell -Command "[GC]::Collect(); Clear-RecycleBin -Force" >nul 2>&1
echo [+] Limpieza completada.
pause
goto MENU

:FINISH
echo.
echo ==========================================================
echo    OPTIMIZACION EXTREMA COMPLETADA CON EXITO
echo    Desarrollado por Kenif - Programmer ^| Architecture: ElNexo
echo ==========================================================
echo [!] REINICIA TU COMPUTADORA PARA APLICAR LOS CAMBIOS.
pause
goto MENU
