@echo off
title CrashGuard Ultimate - Restore - Kenif - Programmer (Powered By ElNexo)
color 07

:: Admin Check
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo [ERROR] Se requieren privilegios de Administrador.
    pause
    exit /b
)

echo ==========================================================
echo       RESTABLECIENDO CONFIGURACION ORIGINAL
echo       Kenif - Programmer (Powered By ElNexo)
echo ==========================================================
echo.

:: 1. Revert Power Plan
echo [+] Restaurando Plan de Energia Equilibardo...
powercfg -setactive 381b4222-f694-41f0-9685-ff5bb260df2e >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /f >nul 2>&1

:: 2. Revert Services
echo [+] Activando Servicios Originales...
for %%s in (DiagTrack SysMain TrkWks WbioSrvc TabletInputService PrintNotify Spooler MapsBroker) do (
    sc config "%%s" start= auto >nul 2>&1
    sc start "%%s" >nul 2>&1
)

:: 3. Revert BCD
echo [+] Restaurando BCD...
bcdedit /deletevalue disabledynamictick >nul 2>&1
bcdedit /deletevalue useplatformtick >nul 2>&1
bcdedit /deletevalue tscsyncpolicy >nul 2>&1

:: 4. Revert Registry ^& Network
echo [+] Restaurando Registro ^& Red...
netsh int tcp set global autotuninglevel=normal >nul 2>&1
netsh interface ip set dns name="Ethernet" source=dhcp >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d 2 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /t REG_DWORD /d 0 /f >nul
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchMode" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d 10 /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d 20 /f >nul

echo.
echo ==========================================================
echo    Proceso de Restauracion Completado.
echo    Kenif - Programmer (Powered By ElNexo)
echo ==========================================================
pause
