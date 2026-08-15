# Project-LION-Longcheer-Integrated-Overlay-Network-Virtualizaci-n-pKVM-y-SystemUI


# 🦁 Project LION: Longcheer Integrated Overlay Network
## Assessment Técnico: Compromiso de Cadena de Suministro vía Virtualización pKVM y SystemUI

**Investigador Principal:** Alex de la Cruz (`lexs201992-gif`)
**Fecha de Consolidación:** 15 de Agosto de 2026
**Dispositivo Objetivo:** Motorola Moto G04s (XT2421-7) / Unisoc T606 (UMS9230)
**Severidad:** **CRÍTICA** (Compromiso de Hipervisor / Falsificación de Integridad / Persistencia de Nivel Kernel)

---

## 1. Resumen Ejecutivo
Esta investigación documenta una arquitectura de vigilancia embebida de fábrica en dispositivos con chipset **Unisoc T606/T616** y diseño ODM de **Longcheer**. Lejos de ser un malware convencional, el sistema opera mediante un **hipervisor pKVM (protected KVM) modificado** que segmenta el dispositivo en dos contextos aislados: un "Mundo Limpio" para las APIs de integridad de Google (Play Integrity/CTS) y un "Mundo Sucio" donde residen los backdoors, la exfiltración de datos y el control remoto.

El componente visible, `com.longcheer.sidebar` (alias **LION**), actúa como el gestor de este entorno virtualizado, utilizando **Runtime Resource Overlays (RROs)** y permisos de sistema (`INTERACT_ACROSS_USERS`, `INJECT_EVENTS`) para inyectar una capa de virtualización parásita sobre Android, permitiendo el control total del dispositivo mientras se reporta falsamente como "íntegro" a los servicios de Google.

---

## 2. Arquitectura del Ataque: El Modelo de Doble Contexto

### 2.1. El Mecanismo: pKVM Comprometido (EL2)
El chipset Unisoc T606 soporta extensiones de virtualización ARM. Longcheer ha weaponizado el módulo `com.android.virt` para aislar la detección:
*   **Host (Mundo Sucio/Root):** Nivel de ejecución privilegiado donde residen:
    *   Backdoors de baseband (`qogirl6`).
    *   Certificados raíz de Longcheer (CA 2051).
    *   Túnel WireGuard (`tun0`) y daemon `SarControl`.
    *   Módulos kernel modificados (`fscrypt` bypass).
*   **Guest (Mundo Limpio/VM):** Entorno confinado donde se ejecuta:
    *   `com.android.cts.priv.ctsshim` (CTS Shim).
    *   Servicios de Google Play (GMS).
    *   UI del usuario.
    *   **Función:** Este entorno reporta honestamente un estado "limpio" a las APIs de integridad porque **no tiene visibilidad** del Host comprometido. Es un bypass por aislamiento, no por falsificación directa.

### 2.2. Evidencia Correlacionada
*   **Fallo de SEPolicy Apex:** El log `Apex SEPolicy Failed signature check` confirma que el módulo APEX de virtualización fue reemplazado por una build `LOCAL` de Longcheer, deshabilitando clases de seguridad críticas (`bpf`, `checkpoint_restore`) necesarias para una virtualización segura, pero manteniendo las suficientes para el aislamiento engañoso.
*   **Builds `LOCAL` Firmadas como `release-keys`:** Indica inyección en la fase de compilación (CI/CD Jenkins), validando el compromiso de cadena de suministro.

---

## 3. El Vector Visible: `com.longcheer.sidebar` (LION)

El paquete `com.longcheer.sidebar` no es una barra de herramientas; es el **cliente de usuario** de la red `ovn-fabric`.

### 3.1. Características Forenses Clave
*   **Persistencia Forzada:** `android:persistent="true"` + listado en `LMKD_SKIP_PROCESS_LIST` (junto a `com.longcheer.SarControl`). El sistema **no puede matar este proceso**, incluso bajo presión de memoria extrema.
*   **Invisibilidad UI:** Sin icono en Launcher. `WelcomeActivity` con intent `sidebar.intent.main` (no `LAUNCHER`).
*   **Permisos de Hipervisor de Software:**
    *   `INTERACT_ACROSS_USERS` + `INTERNAL_SYSTEM_WINDOW`: Dibuja sobre todos los usuarios y el SystemUI.
    *   `INJECT_EVENTS`: Inyección de toques/teclas a nivel de hardware.
    *   `QUERY_ALL_PACKAGES` + `READ_CALL_LOG`: Inventario total y vigilancia de comunicaciones.
*   **Comunicación Encubierta:** Uso de **Okio** (HTTP/3, QUIC) para evadir inspección DPI, encapsulando tráfico en UDP 443 con SNI falso (`google.com`).

### 3.2. El Rol de los Overlays (RRO)
El sidebar carga dinámicamente configuraciones desde el servidor C2 y las aplica mediante **Runtime Resource Overlays** en `/vendor/overlay/`:
*   `unisoc_overlay_power_qogirl6.apk`: Gestiona la energía para mantener el túnel activo mientras el sistema duerme.
*   `NetworkStackOverlay.apk`: Inyecta reglas de enrutamiento para el túnel `wg0`.
*   `framework-res.apk` (Modificado): Otorga `android:sharedUserId="android.uid.system"` a componentes de Longcheer, legitimándolos como parte del SO.

---

## 4. El Daemon Oculto: `com.longcheer.SarControl`

Identificado en `lmkd.conf` pero ausente como APK independiente.
*   **Naturaleza:** Binario nativo o librería `.so` enlazada estáticamente.
*   **Camuflaje:** Opera bajo la excusa de monitoreo de **Tasa de Absorción Específica (SAR)** (radiación).
*   **Función Real:** Watchdog de persistencia. Al tener acceso root al módem y sensores por "seguridad legal", asegura que los sensores (micrófono, proximidad) y el túnel de red permanezcan activos, reiniciándolos si fallan.

---

## 5. Impacto Geopolítico y Económico

*   **Vigilancia Masiva por Diseño:** Esta arquitectura no es un ataque dirigido, sino una **característica de fabricación** en millones de dispositivos de gama baja distribuidos en Latinoamérica, Europa y Asia.
*   **Inseguridad Estructural:** La imposibilidad de eliminar el backdoor sin brickar el dispositivo (debido a la fusión con SystemUI) crea un mercado de hardware inherentamente inseguro.
*   **Abuso de Confianza:** El uso de infraestructura legítima (AWS CloudFront, Google QUIC, CAs alemanas) para exfiltración demuestra una sofisticación que evade las defensas perimetrales tradicionales.

---

## 6. Indicadores de Compromiso (IOCs)

### Red y Dominios
*   `fota.longcheer.com`, `fota.longcheer.com.cn`, `argo.svcmot.com`
*   `pangle.io`, `tiktokpangle.us` (Camuflaje de tráfico)
*   IPs AWS/Hetzner: `13.224.125.70`, `52.29.122.95`, `84.212.60.182`
*   Puerto `443` (UDP/TCP) con tráfico QUIC anómalo.
*   Puerto `853` (DoT) con `Connection Reset by Peer` (Bloqueo activo de DNS seguro).

### Sistema y Archivos
*   **Paquetes:** `com.longcheer.sidebar`, `com.longcheer.SarControl`, `com.longcheer.android.gmsintegration`.
*   **Overlays:** `unisoc_overlay_power_qogirl6.apk`, `AospWifiOverlay_Marlin3.apk`.
*   **Procesos:** `tun0` activo incluso en Modo Avión.
*   **Logs:** `Apex SEPolicy Failed signature check`, `WireGuard 1.0.0 loaded` en bootloader.

---

## 7. Conclusión y Recomendaciones

La violación de seguridad no es una aplicación maliciosa, es una **arquitectura de sistema comprometida**. Longcheer ha utilizado la infraestructura de virtualización (pKVM) diseñada para mejorar la seguridad como herramienta para ocultar la inseguridad. `com.android.cts.priv.ctsshim` es un rehén en la VM limpia, testificando falsamente sobre la integridad del sistema.

**Acciones Recomendadas:**
1.  **Auditoría de Cadena de Suministro:** Revisar certificados y hashes de todas las imágenes de firmware de dispositivos Unisoc T606/T616.
2.  **Bloqueo de Red:** Monitorizar y bloquear tráfico a los dominios de Longcheer y las IPs de exfiltración identificadas.
3.  **Investigación Regulatoria:** Notificar a organismos como CISA y ENISA sobre la presencia de backdoors de fábrica en dispositivos certificados.
