@echo off
title CrashGuard Restore - Kenif - Programmer (Powered By ElNexo)

:: Check for administrative privileges
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo [ERROR] Este script requiere privilegios de administrador.
    pause
    exit /b
)

echo ==========================================================
echo           CrashGuard Framework - Restore
echo       Kenif - Programmer (Powered By ElNexo)
echo ==========================================================
echo.

echo [+] Restaurando Plan de Energia Balanced...
powercfg /setactive 381b4222-f694-41f0-9685-ff5bb260df2e >nul 2>&1

echo [+] Revirtiendo configuraciones de red...
netsh int tcp set global autotuninglevel=disabled >nul 2>&1

echo [+] Restaurando valores de bcdedit...
bcdedit /deletevalue increaseuserva >nul 2>&1

echo.
echo ==========================================================
echo    Sistema restaurado a su estado original.
echo       Kenif - Programmer (Powered By ElNexo)
echo ==========================================================
pause
