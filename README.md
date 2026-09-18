# yabe
Yet another booking engine

## Ejecución con Docker

No es necesario instalar PHP, Composer ni Node.js en el sistema anfitrión.
Solo se necesita Docker y Docker Compose.

### Construir y arrancar la aplicación

Desde la raíz del proyecto:

```bash
docker compose up --build
```

### Acceder a la aplicación

Abrir en el navegador:

```text
http://localhost:8000
```

### Detener el entorno

```bash
docker compose stop
```

Para arrancar de nuevo el entorno detenido:

```bash
docker compose start
```

### Eliminar el entorno

```bash
docker compose down
```

Los contenedores se eliminan pero los datos de la base de datos se conservan
en el volumen `yabe-database`. Al volver a ejecutar `docker compose up`
la aplicación arranca con los datos existentes y sin necesidad de reconstruir
la imagen.

### Reconstruir la imagen

Cuando cambien las dependencias o el código que forma parte de la imagen:

```bash
docker compose up --build
```

Para eliminar también los datos de la base de datos:

```bash
docker compose down -v
```

El siguiente arranque recreará la base de datos mediante las migraciones
y el seed de Laravel.

### Persistencia de SQLite

La aplicación utiliza SQLite. La base de datos se guarda en
`/app/storage/database/database.sqlite` dentro del contenedor, ruta
configurada mediante la variable `DB_DATABASE` en `compose.yaml`.

Esa ruta está respaldada por el volumen nombrado `yabe-database`, por lo que:

- eliminar y recrear el contenedor no pierde los datos;
- no es necesario reconstruir la imagen para recuperar el entorno;
- `docker compose down -v` elimina el volumen y los datos.

Se ha elegido un volumen nombrado en `storage/database` en lugar del
directorio `database/` del proyecto para no ocultar las migraciones,
factorías y seeders con el contenido del volumen.

## Despliegue en VPS con GitHub Actions

El workflow `Deploy to VPS` (`.github/workflows/deploy.yml`) construye la
imagen Docker en GitHub Actions y la despliega en un VPS mediante SSH.
El VPS no construye la imagen: la recibe, la carga y la ejecuta con
Docker Compose (`compose.deploy.yaml`).

### Requisitos previos

- Un VPS con Debian, Docker y Docker Compose instalados.
- Acceso SSH al VPS mediante clave.
- El usuario SSH debe pertenecer al grupo `docker` del VPS.
- Configurar en el repositorio (Settings → Secrets and variables →
  Actions) los siguientes secrets:
  - `VPS_HOST`: dirección del VPS.
  - `VPS_USER`: usuario SSH.
  - `VPS_SSH_KEY`: clave privada SSH.

### Ejecutar el despliegue

1. Abrir la pestaña Actions del repositorio.
2. Seleccionar el workflow `Deploy to VPS`.
3. Pulsar `Run workflow`.

El workflow construye la imagen, la empaqueta con `docker save`,
transfiere el paquete y `compose.deploy.yaml` al directorio `~/yabe`
del VPS, carga la imagen con `docker load` y actualiza la aplicación
con `docker compose up -d` en el puerto `8000`.

Volver a ejecutar el workflow actualiza una instalación existente sin
perder los datos de SQLite, que se conservan en el volumen
`yabe-database` del VPS. La variable `APP_URL` puede ajustarse en el
VPS sin modificar el fichero (por defecto `http://localhost:8000`).
