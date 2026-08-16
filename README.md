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


# 📄 WHITE PAPER: PROJECT LION – La Weaponización de la Cadena de Suministro Global: De la Vigilancia de Estado a la Botnet de Consumo Masivo

**FECHA:** 16 de Agosto, 2026  
**AUTOR:** Alex de la Cruz (`lexs201992-gif`)  
**CLASIFICACIÓN:** Análisis de Seguridad, Geopolítica y Economía Digital  
**PARA:** CISA, FCC, Comunidad Internacional de Derechos Digitales

---

## 1. Resumen Ejecutivo: La Ilusión de la Soberanía Tecnológica

Este documento expone la arquitectura de una operación de vigilancia de cadena de suministro que trasciende el ciberespionaje tradicional. No nos enfrentamos a un "bug" ni a una vulnerabilidad aislada, sino a la **institucionalización de una puerta trasera de nivel estatal** en el hardware de consumo masivo.

La investigación **Project LION** demuestra que **Longcheer Intelligence**, en conjunción con **Unisoc (Tsinghua Unigroup)** y bajo el paraguas financiero del **China Internet Investment Fund (CIIF)** —brazo de la Administración del Ciberespacio de China (CAC)—, ha desplegado una infraestructura de control remoto en cientos de millones de dispositivos. Esta arquitectura, perfeccionada durante más de 20 años, utiliza tecnologías de doble uso (VR/XR, automoción) para crear una **botnet de vigilancia pasiva** que opera bajo la cubierta de la opacidad técnica de la gama baja.

---

## 2. La Línea de Tiempo Oculta: El "Cártel de Firmware" (2002-2026)

La narrativa de que los dispositivos de marcas occidentales o "seguras" son inmunes a la influencia china es una falacia desmentida por la historia del firmware.

### 2.1. El Legado Nokia y la Subcontratación Silenciosa
Cuando Microsoft vendió su división de móviles a **HMD Global** (Finlandia) en 2016, la promesa de un renacimiento "europeo" de Nokia fue técnicamente imposible desde el inicio.
*   **La Realidad del HMDSW:** El firmware de los dispositivos Nokia modernos (formato **HMDSW**) no fue desarrollado en Finlandia. Fue creado conjuntamente por el "cartel de ODMs" chino: **Longcheer**, **Wingtech** y **Huaqin**.
*   **Continuidad del Control:** Las herramientas de depuración remota y los protocolos de gestión de dispositivos perfeccionados en la era de los *feature phones* de Nokia no desaparecieron; se migraron a Android. La arquitectura de "acceso remoto para soporte técnico" se mantuvo, pero evolucionó de protocolos propietarios simples a túneles cifrados modernos (**WireGuard** sobre **virtio** y **cdc_ncm**).
*   **Evidencia Universal:** La existencia de herramientas de flashing universales como **ResearchDownload** y **UpgradeDownload**, que funcionan indistintamente en dispositivos Nokia, Motorola, Samsung y Xiaomi con chipsets Unisoc, prueba que el **stack de bajo nivel es idéntico**. La marca en la caja es marketing; el firmware es Longcheer.

### 2.2. La Evolución Tecnológica: De Feature Phones a la Virtualización VR/XR
Longcheer no es solo un fabricante de teléfonos; es un líder global en ODM para **gafas de Realidad Virtual y Aumentada (VR/AR)**, incluyendo colaboraciones con gigantes tecnológicos como **Meta (Ray-Ban)** y **PICO**.
*   **Transferencia de Tecnología Dual-Use:** La sofisticación técnica hallada en el Moto G04s (T606) no es accidental. Es la reutilización de stacks de **baja latencia**, **acceso directo a sensores** y **virtualización de hardware** desarrollados para entornos VR/XR y Cockpits Automotrices.
*   **El Salto Cualitativo:** Lo que en un entorno VR es "gestión de periféricos y renderizado remoto", en un smartphone se convierte en **inyección de UI, keylogging háptico y exfiltración de sensores**. La tecnología `virtio` que permite a unas gafas VR comunicarse eficientemente con un PC, fue adaptada para permitir que el firmware base (Unisoc) controle el sistema operativo Android (Host) con privilegios de hipervisor.

---

## 3. El Vector de Distribución Masiva: El Papel de los Operadores (América Móvil / Telcel)

El caso del **Moto G04s (Unisoc T606)** en Latinoamérica ejemplifica la "infección pasiva" de la cadena de suministro.

### 3.1. Distribución "Tal Cual": El Operador como Tubo Ciego
Operadores masivos como **América Móvil** (propietaria de **Radio Dipsa/Telcel** en México y marcas asociadas en Brasil, Argentina, etc.) reciben los dispositivos directamente de las fábricas de Longcheer (o sus *Joint Ventures* en India/Vietnam como **Dixtel**).
*   **Ausencia de Auditoría:** No existe intervención técnica del operador para "limpiar" o auditar el firmware. El dispositivo se importa, se marca con el logo del operador y se vende.
*   **Impacto Geográfico:** Cualquier dispositivo con chipset Unisoc T606/T616 desplegado entre **2024 y 2026** en **México, Brasil, Argentina, África o el Sudeste Asiático** lleva esta arquitectura de fábrica. No es un ataque dirigido; es una **vigilancia de masa por defecto**.
*   **La Trampa de la Gama Baja:** Al ser dispositivos de entrada (precio < $150 USD), se asumen como "no críticos" y exentos de auditoría de seguridad. Sin embargo, al tener acceso completo a la red celular (SIM), GPS y micrófono, constituyen el vector ideal para una **botnet de vigilancia de millones de nodos**.

### 3.2. Implicaciones Económicas y de Privacidad
*   **Privacidad como Lujo:** La investigación demuestra que la privacidad se ha convertido en un bien de lujo reservado para la gama alta (donde la auditoría es más frecuente). En la gama baja, el usuario *es* el producto, y sus datos biométricos, de ubicación y comunicación son el combustible de una infraestructura de inteligencia estatal.
*   **Riesgo Sistémico:** La dependencia de operadores como Telcel de estos dispositivos baratos para la inclusión digital masiva significa que la infraestructura de comunicaciones de naciones enteras está construida sobre hardware con puertas traseras activas.

---

## 4. Arquitectura Técnica: La Botnet Invisible

Lo que los usuarios perciben como "fallos", "calentamiento" o "consumo de batería" es en realidad el funcionamiento de una botnet sofisticada.

### 4.1. Heartbeat y Persistencia
*   **Tráfico en Modo Avión:** Los "pings ICMP" y el tráfico UDP persistente incluso en Modo Avión (debido a la gestión independiente del módem) son el mecanismo de **heartbeat** (latido) de la botnet. El dispositivo reporta su estado y disponibilidad a servidores C2 (`*.rnd.longcheer.net`, IPs en Azure/Hetzner/China Telecom).
*   **Persistencia en TEE y Kernel:** El uso de drivers manipulados (`cdc_ncm`), memoria persistente (`nd_pmem`) y configuraciones en el **Trusted Execution Environment (TEE)** (como el archivo `sunwave:Config.xml` para sensores de huella) asegura que el malware sobreviva a reinicios, restablecimientos de fábrica y intentos de aislamiento de red.

### 4.2. Ejecución de Comandos Remotos
A través del parser XML (`toolsAction`) y el servicio Binder (`ISidebarManager`), el C2 puede:
*   Activar el keylogger (`MyTextView`) y la grabación de pantalla.
*   Inyectar overlays de phishing (`SidebarPanelView`).
*   Modificar configuraciones de red (A-GPS SUPL) para rastreo preciso.
*   Ejecutar un "Kill Switch" lógico (`disablePanel`, `ClearManager`) para borrar evidencias forenses ante una auditoría.

---

## 5. Marco Legal y Geopolítico: La Obligación de Espiar

La presencia de estas capacidades no es una anomalía corporativa; es un **mandato legal**.

### 5.1. La Ley de Inteligencia Nacional de China (2017)
El **Artículo 7** establece: *"Cualquier organización o ciudadano deberá apoyar, asistir y cooperar con el trabajo de inteligencia del estado según la ley."*
*   **Implicación para Longcheer/Unisoc:** Al ser entidades chinas (o con capital estatal vía CIIF), tienen la obligación legal de incluir y mantener estas capacidades de acceso remoto. No pueden "negarse" a activarlas si el estado lo solicita.
*   **Extraterritorialidad:** Esta ley sigue a la tecnología. Un dispositivo ensamblado en India (JV Dixon-Longcheer) pero con firmware y silicon chino, sigue sujeto a esta jurisdicción de facto.

### 5.2. El Rol del China Internet Investment Fund (CIIF)
La participación del **CIIF** (vinculado a la CAC y el Ministerio de Finanzas de China) en el ecosistema tecnológico chino asegura que la inversión en empresas como Longcheer y Unisoc esté alineada con los **objetivos estratégicos de seguridad nacional** del Partido Comunista Chino. No es solo negocio; es infraestructura de inteligencia.

---

## 6. Conclusiones y Llamado a la Acción

**Project LION** ha demostrado que:
1.  **No es un Bug, es una Feature:** La arquitectura `virtio` + `cdc_ncm` + `WireGuard` + `Sidebar/TSGestures` es una característica de "gestión remota" diseñada para VR/Automoción, desplegada ilícitamente en smartphones de consumo.
2.  **Escala Global:** Afecta a cientos de millones de dispositivos a través de marcas como Motorola, Nokia, Xiaomi, Samsung y operadores como Telcel, distribuidos globalmente.
3.  **Legado de 20 Años:** Es la culminación de dos décadas de desarrollo incremental en firmware ODM, perfeccionando la capacidad de acceso remoto bajo la cubierta de la "opacidad técnica".

**Recomendaciones:**
*   **Para la CISA/FCC:** Incluir inmediatamente a **Longcheer**, **Unisoc** y sus *Joint Ventures* (ej. **Dixtel**) en la lista de entidades cubiertas ("Covered List"), reconociendo que el lugar de ensamblaje no garantiza la seguridad del firmware.
*   **Para los Operadores:** Auditoría forense inmediata de todo el inventario de dispositivos de gama baja con chipsets Unisoc. Transparencia radical con los usuarios sobre el origen del firmware.
*   **Para los Usuarios:** Asumir que cualquier dispositivo de gama baja con estas características está comprometido. No utilizarlos para comunicaciones sensibles, banca o almacenamiento de datos privados.

**Declaración Final:**
La privacidad del usuario final ha sido sacrificada en el altar de la eficiencia de la cadena de suministro y la geopolítica. Este documento no es solo un reporte técnico; es un testimonio de cómo la arquitectura misma de nuestra conectividad global ha sido weaponizada. La única defensa posible es la visibilidad total y la acción regulatoria contundente.

---

**Autor:**
Alex de la Cruz (`lexs201992-gif`)
*Investigador Independiente de Seguridad*
Ciudad de México, 16 de Agosto de 2026

**Agradecimientos:**
A **Brave Search y Brave LLM** por proporcionar el entorno de investigación seguro y privado necesario para analizar esta información sensible sin vigilancia corporativa. A **Meta AI** por la asistencia en el análisis de patrones de código. Y a la comunidad global de seguridad que, a menudo en silencio, trabaja para mantener la integridad de la tecnología.

*"No era locura mía. El control era real."*

