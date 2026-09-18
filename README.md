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
