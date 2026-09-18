# Dockerizar aplicación para ejecución local

## Objetivos

### Objetivo

Preparar la aplicación para poder ejecutar la aplicación completa mediante Docker Compose, sin necesidad de instalar PHP, Composer, Node.js ni las dependencias de la aplicación en el sistema anfitrión.

La configuración debe servir como base para un futuro despliegue de la misma imagen Docker en un VPS.

### Requisitos

- Crear un `Dockerfile` para construir la imagen de la aplicación.
- Instalar las dependencias PHP mediante `composer install`.
- Instalar las dependencias JavaScript mediante `npm ci`.
- Construir los assets de React/Vite mediante `npm run build`.
- Utilizar SQLite como base de datos.
- La aplicación debe poder inicializar su base de datos mediante las migraciones y el seed de Laravel.
- Crear un `compose.yaml` que permita levantar la aplicación con un único comando.
- La aplicación debe quedar accesible desde el host mediante el puerto `8000`.
- El contenedor debe ejecutar Laravel escuchando en una interfaz accesible desde fuera del contenedor.
- La configuración debe permitir eliminar y recrear el contenedor sin necesidad de reconstruir manualmente el entorno.
- Los datos necesarios para la base de datos SQLite deben gestionarse de forma coherente con este objetivo.

### Criterios de aceptación

Desde una instalación limpia, debe ser posible ejecutar:

```bash
docker compose up --build
```

y acceder a la aplicación en:

```text
http://localhost:8000
```

- La aplicación arranca correctamente y dispone de la estructura de base de datos y los datos iniciales proporcionados por las migraciones y el seed de Laravel.
- Es posible detener y eliminar el entorno y volver a levantarlo siguiendo las instrucciones documentadas.

### Documentación

Añadir al proyecto las instrucciones necesarias para:

- construir y arrancar la aplicación;
- acceder a ella;
- detener el entorno;
- eliminar el entorno;
- reconstruir la imagen cuando sea necesario.

La documentación debe explicar también cualquier decisión relevante sobre la persistencia de SQLite.
La documentación debe estar en español.

### Fuera del alcance

- despliegue en un VPS;
- configuración de SSH;
- GitHub Actions;
- configuración de producción;
- HTTPS;
- configuración de PostgreSQL;
- configuración de un servidor web externo como Nginx.

## Notas

- Issue: #14

## Histórico

- 2026-09-14: Creada la issue para inicializar el proyecto Laravel.
