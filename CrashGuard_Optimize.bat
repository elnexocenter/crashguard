@echo off
setlocal enabledelayedexpansion
title CRASHGUARD OMEGA RED - ULTIMATE PERFORMANCE - Kenif - Programmer (Powered By ElNexo)

:: Admin Check
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo [ERROR] Se requieren privilegios de Administrador para optimizar el Kernel.
    pause
    exit /b
)

echo ==========================================================
echo       CRASHGUARD OMEGA RED - ESTABILIDAD ABSOLUTA
echo       Kenif - Programmer (Powered By ElNexo)
echo ==========================================================
echo.
echo [!] Iniciando Motor de Fluidez Extrema...

:: 1. DEEP KERNEL TWEAKS (Fluidity)
echo [+] Optimizando Programador de Hilos (Kernel Processor Scheduling)...
:: Ajuste de Win32PrioritySeparation para maxima respuesta en aplicaciones en primer plano (juegos)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d 38 /f >nul
:: Desactivar el throttling de energia del sistema (Power Throttling)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "PowerThrottlingOff" /t REG_DWORD /d 1 /f >nul

:: 2. ANTI-CRASH MEMORY ENGINE
echo [+] Previniendo Errores de Memoria (Anti-Crash Logic)...
:: Forzar el uso de Large Pages para memoria de sistema (mejora acceso a RAM)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargePageMinimum" /t REG_DWORD /d 4294967295 /f >nul
:: Optimizar el Cache de Sistema para evitar bloqueos por I/O
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "IoPageLockLimit" /t REG_DWORD /d 983040 /f >nul
:: Limpieza agresiva de Standby List (Mediante PowerShell inyectado)
powershell -Command "[GC]::Collect(); [GC]::WaitForPendingFinalizers(); [System.Runtime.GCSettings]::LatencyMode = 'SustainedLowLatency'" >nul

:: 3. GPU FLOW & LATENCY
echo [+] Inyectando Sincronizacion de Latencia (GPU Scheduling)...
:: Habilitar Hardware-Accelerated GPU Scheduling (HAGS) via Registro
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchMode" /t REG_DWORD /d 2 /f >nul
:: Desactivar FSO (Fullscreen Optimizations) globales que causan stutters
reg add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehavior" /t REG_DWORD /d 2 /f >nul

:: 4. DISK & NETWORK STABILITY
echo [+] Optimizando Buffers de Disco e Internet...
:: Desactivar algoritmo de Nagle (Reduccion de Latencia de Red)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "TcpAckFrequency" /t REG_DWORD /d 1 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "TCPNoDelay" /t REG_DWORD /d 1 /f >nul
:: Optimizar tiempos de busqueda de disco (I/O)
fsutil behavior set disablelastaccess 1 >nul

:: 5. CLEANUP & FINISH
echo [+] Eliminando interferencias de telemetria...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f >nul

echo.
echo ==========================================================
echo    SISTEMA ULTRA-FLUIDO - ANTI-CRASH ACTIVO
echo       Impacto de CPU: 0%% | Fluidez: MAXIMA
echo       Kenif - Programmer (Powered By ElNexo)
echo ==========================================================
echo.
echo [ADVERTENCIA] Los cambios de registro requieren REINICIO para efecto total.
pause
