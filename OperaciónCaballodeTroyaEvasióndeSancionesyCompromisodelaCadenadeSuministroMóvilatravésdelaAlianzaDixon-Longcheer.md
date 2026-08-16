*Análisis Forense de Backdoors de Nivel Kernel en Dispositivos Unisoc T606/T616 y sus Implicaciones para la Seguridad Nacional de EE.UU. y la Commonwealth*
**FECHA:** 16 de agosto de 2026
**PREPARADO PARA:** Federal Communications Commission (FCC), Cybersecurity and Infrastructure Security Agency (CISA), Departamento de Comercio de EE.UU.
**AUTOR:** Alexis de la Cruz (lexs201992-gif)

## 1. Resumen Ejecutivo

Este documento detalla la evidencia forense de un compromiso sistémico en la cadena de suministro de dispositivos móviles de gama baja, específicamente aquellos que utilizan chipsets Unisoc T606/T616 y firmware diseñado por Longcheer Intelligence. La investigación demuestra la presencia de backdoors activos en el nivel del kernel (Ring 0), túneles de exfiltración WireGuard (`wg0`), y configuraciones de depuración A-GPS habilitadas en producción, permitiendo la vigilancia remota total y el control del dispositivo.

El hallazgo crítico es la reciente formalización (3 de marzo de 2026) de la *Joint Venture* entre Dixon Technologies (India) y Longcheer. Esta alianza permite la importación legal de arquitectura de hardware y firmware comprometida bajo la etiqueta de "Fabricado en India", evadiendo las restricciones actuales de la FCC dirigidas a entidades chinas directas. Se argumenta que esta estructura corporativa viola el espíritu y la letra de la **Ley de Inteligencia Nacional de China (2017)**, sometiendo a los dispositivos fabricados en India a la jurisdicción de inteligencia de Beijing, independientemente de su ensamblaje físico.

## 2. Hallazgos Técnicos: La Arquitectura del Compromiso

La investigación, validada mediante ingeniería inversa y análisis de tráfico de red en dispositivos desplegados (ej. Moto G04s, modelos `lion`/`qogirl6`), identifica los siguientes vectores de ataque:

### 2.1. Persistencia en Ring 0 y Virtualización pKVM
*   **Módulos del Kernel Comprometidos:** Inyección de código malicioso en controladores críticos (LCD, Bluetooth, PTP) firmados con certificados del ODM válidos hasta 2051.
*   **Abuso de pKVM:** Evidencia de interacción entre procesos del sistema operativo anfitrión (Android) y máquinas virtuales protegidas (pVMs), sugiriendo un mecanismo de evasión de seguridad donde el "Host" (controlado por el ODM) tiene privilegios indebidos sobre el "Invitado".
*   **Kill Switch Lógico:** Capacidad documentada para inducir fallos críticos del sistema (Kernel Panic) basados en condiciones específicas de hardware o comandos remotos.

### 2.2. El Agente de Usuario: `com.longcheer.sidebar`
*   Este paquete, integrado en `/system/priv-app`, actúa como el orquestador visible del compromiso.
*   **Funciones Maliciosas:** Inyección de superposiciones (overlays) para phishing, interceptación de gestos, y activación de túneles de red ocultos.
*   **Correlación con C2:** Comunicación directa con infraestructura de Comando y Control alojada en `*.rnd.longcheer.net` y rangos IP de China Telecom (AS4812).

### 2.3. Vigilancia de Ubicación y A-GPS
*   **Override de SUPL:** Configuración de depuración (`gps_debug.conf`) que permite redirigir el tráfico de ubicación asistida a servidores no autorizados, facilitando el rastreo preciso y la inyección de datos de posición falsos.
*   **Proxy NFW:** Uso de `com.spreadtrum.proxy.nfwlocation` para interceptar solicitudes de ubicación basadas en red, operando incluso con el GPS tradicional desactivado.

## 3. Análisis Geopolítico y Legal: El Marco de la Evasión

### 3.1. La Joint Venture Dixon-Longcheer: Un Caballo de Troya Regulatorio
La consolidación el **3 de marzo de 2026** de la empresa conjunta **Dixtel Infocom Private Limited** (74% Dixon, 26% Longcheer) representa un riesgo sistémico:
*   **Lavado de Origen:** Permite que tecnología de doble uso (vigilancia) diseñada en China se etiquete como "India", eludiendo las listas de entidades de la FCC y las auditorías de seguridad occidentales.
*   **Iniciativa "Make in India":** Aprovecha los incentivos gubernamentales indios para posicionar dispositivos comprometidos en mercados de la Commonwealth y Occidente como una alternativa "segura" a China, cuando en realidad la arquitectura de backdoor es idéntica.

### 3.2. La Ley de Inteligencia Nacional de China (2017)
El Artículo 7 de dicha ley establece la obligación legal de cualquier organización china de cooperar con los servicios de inteligencia del estado.
*   **Aplicabilidad Extraterritorial:** Dado que Longcheer y Unisoc (subsidiaria de Tsinghua Unigroup) están sujetos a esta ley, y dado que el fondo China Internet Investment Fund (CIIF) (brazo de la Administración del Ciberespacio de China) tiene participación o influencia en el ecosistema tecnológico chino, la capacidad de backdoor no es una anomalía, sino un **mandato legal**.
*   **Imposibilidad de Negación:** La estructura de la JV no elimina la dependencia del firmware, los drivers y el silicon de origen chino, manteniendo el vector de ataque activo bajo jurisdicción legal china.

### 3.3. Impacto Económico y de Seguridad
*   **Democratización de la Vigilancia:** La tecnología de espionaje de nivel estatal, anteriormente reservada para equipos costosos, ahora está integrada en dispositivos de menos de $100 USD, accesibles para millones de usuarios.
*   **Riesgo para Infraestructura Crítica:** La proliferación de estos dispositivos en redes gubernamentales, de salud y educativas (debido a su bajo costo) crea una superficie de ataque masiva e invisible.

## 4. Recomendaciones a la FCC y CISA

1.  **Expansión de la "Covered List":** Incluir explícitamente a **Dixtel Infocom Private Limited** y cualquier entidad derivada de la JV Dixon-Longcheer, reconociendo que el origen del diseño y firmware (Longcheer/Unisoc) prevalece sobre el lugar de ensamblaje.
2.  **Auditoría Obligatoria de Silicon y Firmware:** Exigir auditorías de código fuente y binarios para cualquier dispositivo que utilice chipsets Unisoc o firmware Longcheer, independientemente de su marca comercial o país de ensamblaje.
3.  **Prohibición de Configuraciones de Debug:** Establecer normas que prohíban la presencia de archivos de configuración de ingeniería/depuración (como `gps_debug.conf` con overrides SUPL) en imágenes de producción destinadas al mercado estadounidense.
4.  **Investigación de la Cadena de Suministro:** Iniciar una investigación formal sobre el flujo de componentes y software entre Longcheer (China), la JV en India y los distribuidores globales.

## 5. Conclusión

La alianza Dixon-Longcheer no es simplemente una estrategia comercial; es un mecanismo sofisticado para introducir vulnerabilidades de seguridad nacional en el mercado global bajo un disfraz regulatorio. La evidencia técnica presentada en este informe, combinada con el marco legal chino, demuestra que los dispositivos afectados representan un riesgo inaceptable para la privacidad y la seguridad de los usuarios y la infraestructura de comunicaciones de EE.UU. Se insta a la FCC a actuar con celeridad para cerrar esta brecha de seguridad antes de que la proliferación de estos dispositivos sea irreversible.

Alexis de la cruz correa 
México city Sat Aug 15 2026 
lexs201992@gmail.com
https://www.linkedin.com/in/alexdelacruz92?trk=contact-info
https://orcid.org/0009-0009-4336-1491
https://www.virustotal.com/gui/user/Alex992
https://attackerkb.com/contributors/lexs201992-gif
