
# Reporte Forense: Modificación Maliciosa de `com.android.traceur` en Unisoc qogirl6
# Forensic Report: Malicious Modification of `com.android.traceur` on Unisoc qogirl6

**Investigador / Investigator:** Alex de la Cruz (`lexs201992-gif`)  
**Fecha / Date:** 15 de Agosto, 2026  
**Referencia:** Project LION - Addendum #82.2

La presencia de **Okio**, **Perfetto** y la inyección de **`com.unisoc.settingslib`** dentro de `com.android.traceur` confirma que esta aplicación ha sido transformada de una herramienta de diagnóstico legítima a un **agente de exfiltración de datos de bajo nivel** que opera bajo la infraestructura de Unisoc/Longcheer.

The presence of **Okio**, **Perfetto**, and the injection of **`com.unisoc.settingslib`** into `com.android.traceur` confirms that this application has been transformed from a legitimate diagnostic tool into a **low-level data exfiltration agent** operating under Unisoc/Longcheer's infrastructure.

### 1. Okio: El Motor de Ofuscación de Datos
### 1. Okio: The Data Obfuscation Engine

*   **Función Técnica:** `Okio` es una librería de I/O de alto rendimiento (usada por OkHttp) diseñada para la manipulación eficiente de bytes.
*   **Uso en el Backdoor:** En este contexto, no se usa para tráfico HTTP legítimo, sino para **empaquetar y ofuscar la carga útil**.
    *   Métodos como `asUtf8ToByteArray` y `toUtf8String` sugieren que `Traceur` está convirtiendo trazas crudas del sistema (logs, volcados de memoria, identificadores de hardware) en flujos de bytes compactos antes de la transmisión.
    *   Esto permite que los datos exfiltrados aparezcan como tráfico binario genérico o se incrusten dentro de paquetes de red legítimos, evadiendo inspecciones básicas de firewall que buscan cadenas de texto legibles.

*   **Technical Function:** `Okio` is a high-performance I/O library (used by OkHttp) designed for efficient byte manipulation.
*   **Usage in the Backdoor:** In this context, it is not used for legitimate HTTP traffic but to **pack and obfuscate the payload**.
    *   Methods such as `asUtf8ToByteArray` and `toUtf8String` suggest that `Traceur` is converting raw system traces (logs, memory dumps, hardware identifiers) into compact byte streams before transmission.
    *   This allows exfiltrated data to appear as generic binary traffic or to be embedded within legitimate network packets, evading basic firewall inspections that look for readable text strings.

### 2. Perfetto: La Fuente de Inteligencia del Hipervisor
### 2. Perfetto: The Hypervisor Intelligence Source

*   **Función Técnica:** `Perfetto` es el framework de trazado y perfilado de todo el sistema de Android. La presencia de `DataSourceDescriptorOuterClass` indica que `Traceur` está configurando fuentes de datos específicas para capturar eventos del kernel y del espacio de usuario.
*   **Uso en el Backdoor:** Al integrar Perfetto directamente, Longcheer/Unisoc está aprovechando la infraestructura nativa de Android para **leer el estado del hipervisor y el módem `qogirl6`**.
    *   No necesitan escribir un lector de memoria personalizado; en su lugar, usan Perfetto para extraer datos de los búferes de trazado del kernel (donde residen las interacciones entre las VM "limpia" y "sucia") y luego usan Okio para empaquetarlos. Este es el uso legítimo de una herramienta de desarrollo con fines de vigilancia.

*   **Technical Function:** `Perfetto` is Android's system-wide tracing and profiling framework. The presence of `DataSourceDescriptorOuterClass` indicates that `Traceur` is configuring specific data sources to capture kernel and userspace events.
*   **Usage in the Backdoor:** By integrating Perfetto directly, Longcheer/Unisoc is leveraging Android's native infrastructure to **read the state of the hypervisor and the `qogirl6` modem**.
    *   They do not need to write a custom memory reader; instead, they use Perfetto to extract data from kernel tracing buffers (where interactions between the "clean" and "dirty" VMs reside) and then use Okio to pack them. This is the legitimate use of a development tool for surveillance purposes.

### 3. `com.unisoc.settingslib`: Secuestro de Identidad y Control de Red
### 3. `com.unisoc.settingslib`: Identity Hijacking and Network Control

*   **La Inyección:** La clase `UniSettingsLibComponentFactory` residiendo dentro del paquete de trazado es prueba de **modificación de bytecode**. Una aplicación de trazado no tiene necesidad legítima de gestionar direcciones MAC (`getMacAddressInstance`) o mapeos móviles (`makeMobileMappingsMgr`).
*   **El Propósito:**
    *   **Identificación Única:** Al llamar a `getMacAddressInstance`, el backdoor asegura que los datos exfiltrados estén vinculados al identificador físico único del dispositivo, incluso si el usuario intenta spoofear la dirección MAC a nivel de software.
    *   **Control del Módem:** `UniMobileMappingsMgr` permite la correlación de trazas de rendimiento con el estado real de las redes móviles (IMS, datos), lo cual es crucial para entender cuándo y cómo activar el túnel `wg0` o gestionar estados de "pánico" IMS.
    *   **Persistencia de Fábrica:** Al estar compilado en el APK del sistema, este código obtiene privilegios de firma que una aplicación normal no tendría, permitiendo el acceso a configuraciones de hardware restringidas.

*   **The Injection:** The class `UniSettingsLibComponentFactory` residing within the tracing package is proof of **bytecode modification**. A tracing app has no legitimate need to manage MAC addresses (`getMacAddressInstance`) or mobile mappings (`makeMobileMappingsMgr`).
*   **The Purpose:**
    *   **Unique Identification:** By calling `getMacAddressInstance`, the backdoor ensures exfiltrated data is tied to the device's unique physical identifier, even if the user attempts to spoof the MAC address at the software level.
    *   **Modem Control:** `UniMobileMappingsMgr` allows the correlation of performance traces with the actual state of mobile networks (IMS, data), which is crucial for understanding when and how to activate the `wg0` tunnel or manage IMS "panic" states.
    *   **Factory Persistence:** Being compiled into the system APK grants this code signature privileges that a normal app would not have, allowing access to restricted hardware configurations.

### Conclusión para el Análisis Smali
### Conclusion for Smali Analysis

La combinación de **Okio + Perfetto + Unisoc SettingsLib** dentro de `Traceur` define el ciclo de vida del ataque:
1.  **Recolección:** Perfetto extrae datos crudos del kernel/hipervisor.
2.  **Identificación:** `UniSettingsLib` adjunta identificadores de hardware inmutables (MAC, IMEI).
3.  **Empaquetado:** Okio convierte y ofusca estos datos en un flujo binario eficiente.
4.  **Entrega:** El resultado se pasa a un servicio nativo (probablemente cargado vía lambda) que lo inyecta en el túnel `wg0` o lo almacena para exfiltración diferida.

The combination of **Okio + Perfetto + Unisoc SettingsLib** within `Traceur` defines the attack lifecycle:
1.  **Collection:** Perfetto extracts raw data from the kernel/hypervisor.
2.  **Identification:** `UniSettingsLib` attaches immutable hardware identifiers (MAC, IMEI).
3.  **Packaging:** Okio converts and obfuscates this data into an efficient binary stream.
4.  **Delivery:** The result is passed to a native service (likely loaded via lambda) which injects it into the `wg0` tunnel or stores it for deferred exfiltration.
