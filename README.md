# SiliconTV - App de Series Populares

Proyecto desarrollado para **Silicon Power Inc.** en colaboración con **Doonamis**. Esta aplicación permite a los usuarios explorar las series de televisión más populares, visualizar detalles completos y acceder al contenido incluso sin conexión a internet.

## Descripción del Proyecto
La aplicación ha evolucionado desde una versión inicial de catálogo hasta una experiencia completa con soporte offline, personalización de usuario y adaptabilidad de interfaz.

### Funcionalidades V1.0
* **Listado Paginado:** Consulta de las series de televisión más populares mediante la API de [TMDB](https://developers.themoviedb.org/3/tv/get-popular-tv-shows).
* **Detalle de Serie:** Visualización completa de información específica de cada título seleccionado.

### Funcionalidades V2.0
* **Modo Offline:** Persistencia de datos local utilizando **Floor** para garantizar la disponibilidad del contenido sin conexión.
* **Control Total de Experiencia:** Sistema completamente intercambiable y combinable entre **búsqueda online y local**.
* **Personalización:** Cambio dinámico de **tema (Light/Dark)** e **idioma**.
* **Interacción Web:** En modo online, es posible visitar la página oficial de la serie directamente en el navegador por defecto del dispositivo.
* **Adaptabilidad:** Interfaz optimizada para orientación vertical/horizontal y soporte de DarkMode.

### Reglas de Negocio en la Búsqueda
* **Modo Online:** Permite acceso completo a la actualización de la lista de series populares, visualización de imágenes y navegación a la web oficial de la serie.
* **Modo Local:** Permite consultar exclusivamente los valores previamente descargados en el modo online. Las imágenes y la actualización de listas no están disponibles en este modo.

## 🛠️ Stack Tecnológico
* **Lenguaje:** Dart
* **Framework:** Flutter
* **Arquitectura:** Clean Architecture
* **Gestión de Estado:** BLoC (Business Logic Component)
* **Inyección de Dependencias:** GetIt
* **Persistencia Local:** Floor Database
* **Consumo de API:** Dio (HTTPS)

## ⚙️ Razonamiento de Decisiones Técnicas

### Persistencia de Datos (Floor Database)
Para el modo offline, se ha seleccionado **Floor** por ser un paquete para bases de datos relacionales ligeras que se integra con Flutter, permitiendo gestionar relaciones complejas entre datos de forma eficiente.

## 🚀 Instalación y Configuración

1.  Clona el repositorio:
    ```bash
    git clone <URL_DEL_REPOSITORIO>
    ```
2.  **Configuración de API Key:**
    Es necesario crear un archivo `.env` en la raíz del proyecto para gestionar las credenciales de forma segura. Crea el archivo y añade tu clave:
    ```text
    API_KEY = [TU_API_KEY]
    ```
3.  Instala las dependencias:
    ```bash
    flutter pub get
    ```
4.  Genera el código necesario (BLoC y Floor):
    ```bash
    flutter pub run build_runner build --delete-conflicting-outputs
    ```
5.  Ejecuta la aplicación:
    ```bash
    flutter run
    ```

## 📜 Créditos
API proveída por [The Movie Database (TMDB)](https://developers.themoviedb.org/3/tv/get-popular-tv-shows).