# KOBE - Aplicación Móvil de Presupuesto (frontend)

![Logo de Kobey](/MarkdownImgs/KobeyLogo.jpg)

## Descripción General

Aplicación que permite armar un presupuesto por mes, en donde existen 3 tipos de movimientos: ingresos, gastos y ahorros. Para cada tipo de movimiento se pueden definir hasta 10 categorías. En un mes dado, el usuario puede definir cuál es el valor que espera designar a cada categoría (presupuesto). Posteriormente en el transcurso del mes el usuario irá registrando sus movimientos y a partir de estos, en una pestaña de estadísticas podrá ver cómo se va cumpliendo el plan que hizo para el mes.

[Link del Figma](https://www.figma.com/file/Wfm3uEARRaBuLn5mNORQ3i/PLANTILLA-PROGRA-MOVIL?type=design&node-id=0%3A1&mode=design&t=YAmKpRVIuzYmmX1n-1)

## Imagen de Referencia:

![Imagen de Referencia](/MarkdownImgs/Referencia.jpg)

## Entorno de Desarrollo

Para crear un entorno de desarrollo de una aplicación web con Flutter en el frontend y Express.js en el backend, para instalarlo se puede seguir estos pasos:

## Configuración del Frontend

1. Instalación de Flutter - Desarrollo para móvil.
    * Primero, descarga e instala Flutter desde su página oficial: <https://flutter.dev/docs/get-started/install>. Sigue las instrucciones específicas para tu sistema operativo. Posteriormente añadir el path a las variables de entorno.
2. Configuración de Android Studio - Emulador de un móvil android para probar la aplicación.
    * Instala Android Studio desde la página oficial de Android Studio: <https://developer.android.com/studio>.
    * Dentro de Android Studio, instala el Android SDK y configura un emulador en el AVD Manager para simular un dispositivo móvil.
3. Configuración de Visual Studio Code - IDE a utilizar en el proyecto.
    * Descarga e instala Visual Studio Code (VSCode) desde su página oficial: <https://code.visualstudio.com/>.
    * Pueden instalarse los siguientes plugins para facilitar la codificación en Flutter:
        * Flutter: Para integrar soporte para Flutter en VSCode e incluye funcionalidades como la ejecución y depuración de aplicaciones.
        * Dart: Necesario para trabajar con Flutter, ya que proporciona soporte para el lenguaje de programación Dart.
        * Awesome Flutter Snippets: Proporciona snippets de código útiles para desarrollar más rápidamente en Flutter.
        * Flutter Widget Snippets: Una colección de snippets para los widgets más comúnmente usados en Flutter.

## Configuración del Backend

1. Instalación de Node.js
    * Descarga e instala Node.js desde su página oficial: <https://nodejs.org/>. Node.js es necesario para trabajar con Express.js. Posteriormente añadir el path a las variables de entorno.
2. Creación y configuración de un proyecto Express.js
    * Abre una terminal y utiliza el siguiente comando para instalar el generador de aplicaciones Express: npm install -g express-generator
    * Crea un nuevo proyecto Express con el comando: express nombre-de-tu-proyecto
3. Desarrollo en Express.js
    * Desarrolla tu aplicación backend modificando los archivos en el directorio del proyecto. Pueden instalarse adicionales según sea necesario, instalándolas con npm install nombre.
    * Pueden usarse herramientas como Postman o Insomnia para probar las API endpoints de tu aplicación Express.js.

## Ejecución y Pruebas

* Para el frontend, abre VS Code, navega al directorio de tu proyecto Flutter y ejecuta tu aplicación usando el emulador configurado en Android Studio.
* Para el backend, en una terminal navega al directorio de tu proyecto Express y ejecuta `npm start` para iniciar el servidor.

# Requerimientos

## Requerimientos Funcionales

| <!-- -->                              | <!-- -->        |
|:-------------                        |:---------------|
| Identificación del Requerimiento      | RF1        |
| Nombre del Requerimiento              | Creación de cuenta |
| Características                       | El usuario podrá crear una cuenta, definiendo un nombre de usuario y contraseña. |
| Descripción del requerimiento         | El usuario podrá crear una cuenta otorgando los datos: email, nombre de usuario, nombre completo y la contraseña |
| Requerimiento NO Funcional            | RNF1, RNF2, RNF5 |
| Prioridad del requerimiento           | Alta |

| <!-- -->                              | <!-- -->        |
|:-------------                        |:---------------|
| Identificación del Requerimiento      | RF2        |
| Nombre del Requerimiento              | Autenticación de usuario |
| Características                       | El usuario para iniciar sesión deberá ingresar información de la cuenta |
| Descripción del requerimiento         | El usuario para iniciar sesión deberá ingresar su nombre de usuario y contraseña |
| Requerimiento NO Funcional            | RNF1, RNF2, RNF5 |
| Prioridad del requerimiento           | Media |

| <!-- -->                              | <!-- -->        |
|:-------------                        |:---------------|
| Identificación del Requerimiento      |  RF3       |
| Nombre del Requerimiento              | Creación de categorías        |
| Características                       | El usuario podrá crear categorías      |
| Descripción del requerimiento         | El usuario podrá crear un máximo de 10 categorías para sus ingresos, gastos y ahorros.      |
| Requerimiento NO Funcional            | RNF1, RNF2, RNF6      |
| Prioridad del requerimiento           | Media      |

| <!-- -->                              | <!-- -->        |
|:-------------                        |:---------------|
| Identificación del Requerimiento      | RF4        |
| Nombre del Requerimiento              | Creación del plan de presupuesto |
| Características                       | El usuario podrá crear un plan de presupuesto para cada categoría de ingresos, gastos y ahorros. |
| Descripción del requerimiento         | El usuario podrá crear un plan de presupuesto para cada categoría de ingreso, gastos y ahorros. |
| Requerimiento NO Funcional            | RNF1, RNF2, RNF6, RNF7 |
| Prioridad del requerimiento           | Media |

| <!-- -->                              | <!-- -->        |
|:-------------                        |:---------------|
| Identificación del Requerimiento      | RF5        |
| Nombre del Requerimiento              | Ingreso de movimientos|
| Características                       | El usuario podrá ingresar sus movimientos financieros según cada categoría de ingresos, gastos y ahorros. |
| Descripción del requerimiento         | El usuario podrá ingresar sus movimientos financieros según cada categoría de ingresos, gastos y ahorros. |
| Requerimiento NO Funcional            | RNF1, RNF2, RNF6, RNF7. |
| Prioridad del requerimiento           | Alta |

| <!-- -->                              | <!-- -->        |
|:-------------                        |:---------------|
| Identificación del Requerimiento      | RF6        |
| Nombre del Requerimiento              | Visualización de historial de presupuestos y movimientos |
| Características                       | El usuario podrá ver sus presupuestos pasados. |
| Descripción del requerimiento         | El usuario podrá ver sus presupuestos de periodos anteriores(Mes y Año). |
| Requerimiento NO Funcional            | RNF1, RNF2, RNF6, RNF7 |
| Prioridad del requerimiento           | Media |

| <!-- -->                              | <!-- -->        |
|:-------------                        |:---------------|
| Identificación del Requerimiento      | RF7        |
| Nombre del Requerimiento              | Cambio de contraseña |
| Características                       | El usuario puede solicitar un cambio de la contraseña. |
| Descripción del requerimiento         | El usuario puede solicitar un cambio de la contraseña brindando su nombre de usuario o email. |
| Requerimiento NO Funcional            | RNF1, RNF2, RNF6, RNF7 |
| Prioridad del requerimiento           | Baja |

## Requerimientos NO Funcionales






| <!-- -->                              | <!-- -->        |
|:-------------                        |:---------------|
| Identificación del Requerimiento      | RNF1       |
| Nombre del Requerimiento              | Rendimiento |
| Características                       | Respuesta inmediata y eficiencia de procesamiento. |
| Descripción del requerimiento         | La aplicación debe responder rápidamente a las entradas del usuario y manejar eficazmente el procesamiento de datos. |
| Prioridad del requerimiento           | Alta |

| <!-- -->                              | <!-- -->        |
|:-------------                        |:---------------|
| Identificación del Requerimiento      | RNF2        |
| Nombre del Requerimiento              | Disponibilidad |
| Características                       | Acceso constante y tiempo de inactividad mínimo. |
| Descripción del requerimiento         | La aplicación debe estar disponible para su uso la mayor cantidad de tiempo posible, con un tiempo mínimo de inactividad. |
| Prioridad del requerimiento           | Alta |

| <!-- -->                              | <!-- -->        |
|:-------------                        |:---------------|
| Identificación del Requerimiento      | RNF3        |
| Nombre del Requerimiento              | Usabilidad |
| Características                       | Intuitiva y accesible para todos los usuarios. |
| Descripción del requerimiento         | La interfaz de usuario debe ser intuitiva y fácil de usar para personas sin experiencia previa con la aplicación. |
| Prioridad del requerimiento           | Media |

| <!-- -->                              | <!-- -->        |
|:-------------                        |:---------------|
| Identificación del Requerimiento      | RNF4        |
| Nombre del Requerimiento              | Compatibilidad |
| Características                       | Funciona en múltiples dispositivos y sistemas. |
| Descripción del requerimiento         | La aplicación debe ser compatible con múltiples versiones de sistemas operativos móviles, como Android e iOS, y adaptarse bien a diferentes tamaños de pantalla y resoluciones. |
| Prioridad del requerimiento           | Alta |

| <!-- -->                              | <!-- -->        |
|:-------------                        |:---------------|
| Identificación del Requerimiento      | RNF5        |
| Nombre del Requerimiento              | Seguridad |
| Características                       | Protección y cifrado de datos. |
| Descripción del requerimiento         | La aplicación debe proteger la información sensible del usuario, asegurando que todos los datos transmitidos y almacenados estén cifrados. |
| Prioridad del requerimiento           | Alta |

| <!-- -->                              | <!-- -->        |
|:-------------                        |:---------------|
| Identificación del Requerimiento      | RNF6        |
| Nombre del Requerimiento              | Escalabilidad |
| Características                       | Manejo efectivo del crecimiento de usuarios y carga de datos. |
| Descripción del requerimiento         | La aplicación debe poder manejar un aumento en el número de usuarios y en la carga de procesamiento de datos sin degradar significativamente el rendimiento. |
| Prioridad del requerimiento           | Media |

| <!-- -->                              | <!-- -->        |
|:-------------                        |:---------------|
| Identificación del Requerimiento      | RNF7        |
| Nombre del Requerimiento              | Mantenibilidad |
| Características                       | Código organizado y fácilmente actualizable. |
| Descripción del requerimiento         | El código de la aplicación debe estar bien organizado y documentado para facilitar actualizaciones y mantenimiento por parte de los desarrolladores. |
| Prioridad del requerimiento           | Baja |

| <!-- -->                              | <!-- -->        |
|:-------------                        |:---------------|
| Identificación del Requerimiento      | RNF8        |
| Nombre del Requerimiento              | Consumo de batería |
| Características                       | Eficiencia energética y consumo optimizado. |
| Descripción del requerimiento         | La aplicación debe ser eficiente en términos de consumo de batería, evitando un drenaje excesivo cuando está en uso activo o en segundo plano. |
| Prioridad del requerimiento           | Media |

| <!-- -->                              | <!-- -->        |
|:-------------                        |:---------------|
| Identificación del Requerimiento      | RNF9        |
| Nombre del Requerimiento              | Gestor de Base de Datos |
| Características                       | Confiabilidad y avanzadas capacidades de gestión de datos con PostgreSQL. |
| Descripción del requerimiento         | La aplicación usará PostgreSQL como sistema de gestión de base de datos. |
| Prioridad del requerimiento           | Alta |

| <!-- -->                              | <!-- -->        |
|:-------------                        |:---------------|
| Identificación del Requerimiento      | RNF10        |
| Nombre del Requerimiento              | Código de desarrollo |
| Características                       | Desarrollo unificado y multiplataforma con Flutter. |
| Descripción del requerimiento         | La aplicación usará flutter como marco de código fuente de desarrollo. |
| Prioridad del requerimiento           | Alta |


# Diagramas

## Diagrama Relacional

![Diagrama Relacional](/MarkdownImgs/DiagramaRelacional.jpg)

Leyenda de Tablas:
* Tipo: Se refiere a los 3 tipos de transacciones que hay: INGRESO, GASTO y AHORRO.
* Categoría: Se refiere a la naturaleza del ingreso/gasto/ahorro
    * tipo: Ingreso - Categoría: sueldo, intereses, pago por honorarios…
    * tipo: Gastos - Categoría: transporte, comida, utilidades, salud, educación, entretenimiento…
    * tipo: Ahorro - Categoría: casa, carro, viajes, emprendimiento…
        * Explicación: por ejemplo en un registro el tipo puede ser INGRESO y la categoría puede ser SUELDO
    * Calendar: Esta tabla estará compuesta por muchas fechas y estará vinculada a una tabla mes. Esto principalmente para facilitar luego la creación de filtros dentro de la aplicación y la asignación de fechas al registro en la tabla Tracker.
    * Month: Tabla que contiene todos los meses de cada año con un distinto ID. Esta tabla nos facilitará la programación de filtros.
    * Año: Tabla que contiene todos los años posibles dentro de un lapso de tiempo determinado a futuro. Esta tabla nos facilitará la programación de filtros.
    * Presupuesto: Es la cantidad de dinero planificado para cada categoría y mes (ya que puede variar entre meses). Es una meta, no necesariamente se cumplirá. 
    * Registro (Tracking): Es la tabla principal, donde se registran todos los ingresos, gastos o ahorros, con su respectiva categoría, fecha de registro y detalle.
    * User: Es la tabla donde se guarda la información del usuario, principalmente sus nombres y apellidos, además de sus credenciales para ingresar a su cuenta de la aplicación (email y password).

## Diagrama de Casos de Uso

![Diagrama de casos de uso](/MarkdownImgs/DiagramaCasosDeUso.jpg)

## Diagrama de Despliegue

![Diagrama de Despliegue](/MarkdownImgs/DiagramaDespliegue.jpg)



