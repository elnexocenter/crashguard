 <div align="center">
  <img src="https://i.imgur.com/N72RjNM.png" alt="CrashGuard Banner" width="100%">
</div>
  
  <br>

  <img src="https://img.shields.io/badge/Versi%C3%B3n-1.0_Stable-blue?style=for-the-badge" alt="Version">
  <img src="https://img.shields.io/badge/S.O.-Windows_10_/_11-0078D4?style=for-the-badge&logo=windows" alt="OS">
  <img src="https://img.shields.io/badge/Lenguaje-Batch-4EAA25?style=for-the-badge" alt="Language">
</div>

---

## CRASHGUARD V1.0

**CrashGuard** es una solución integral de optimización diseñada para mitigar fallos críticos y mejorar la estabilidad de videojuegos en entornos Windows. Este repositorio centraliza scripts de automatización que gestionan la asignación de recursos del sistema, reduciendo drásticamente los cierres inesperados (crashes) provocados por saturación de hardware o procesos inestables del kernel.

### ARQUITECTURA DEL SISTEMA

El despliegue de **CrashGuard** se divide en tres componentes críticos:

1.  **`CrashGuard_Optimize.bat`**: Núcleo de ejecución. Implementa ajustes de prioridad de CPU, limpieza de caché de memoria en tiempo real y optimización de planes de energía de alto rendimiento.
2.  **`CrashGuard_Restore.bat`**: Módulo de reversión. Restaura los valores predeterminados del sistema y deshace las modificaciones de registro para volver al estado original de fábrica.
3.  **Guía de Estabilidad**: Documentación técnica interna para la configuración manual de memoria virtual y gestión de excepciones de GPU.

---

### PROTOCOLOS TÉCNICOS INTEGRADOS

La suite opera bajo estándares de ingeniería para garantizar que tu hardware se enfoque exclusivamente en el proceso del juego:

* **Gestión de Memoria**: Liberación de "Standby List" y purga de RAM innecesaria antes de iniciar procesos pesados.
* **Aislamiento de Procesos**: Desactivación temporal de servicios de telemetría y tareas programadas que causan picos de lag y crashes.
* **Priorización de I/O**: Ajuste de los tiempos de respuesta del disco y la CPU para dar prioridad absoluta al ejecutable del juego.
* **Watchdog de Sistema**: Verificación de integridad de permisos para evitar bloqueos por falta de privilegios administrativos.

---

### REQUISITOS DE DESPLIEGUE

Para que los protocolos de estabilidad surtan efecto, el entorno debe cumplir con:

* Sistema Operativo Windows 10 o Windows 11.
* Ejecución con **Privilegios de Administrador** (Indispensable).
* Desactivación temporal de antivirus que puedan bloquear la inyección de comandos en el registro.

---

### ESTRUCTURA DE ARCHIVOS

| Archivo | Función |
| :--- | :--- |
| **CrashGuard_Optimize.bat** | Aplicación de perfiles de alta estabilidad y rendimiento. |
| **CrashGuard_Restore.bat** | Restauración total de los parámetros originales del sistema. |

---

### DESCARGO DE RESPONSABILIDAD

> [!WARNING]
> El uso de **CrashGuard** implica la modificación de parámetros internos del sistema operativo. El desarrollador no se hace responsable de fallos derivados de hardware incompatible o una mala aplicación de los scripts. **Se recomienda encarecidamente crear un punto de restauración antes de proceder.**

---
<div align="center">
  Desarrollado para la comunidad Gaming | 2026
</div>
