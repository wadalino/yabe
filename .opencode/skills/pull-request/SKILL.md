---
name: pull-request
description: Define las reglas y comprobaciones para preparar y publicar un Pull Request. Usar cuando se vaya a crear o actualizar un PR.
---

# Pull Request

Este skill define las reglas y comprobaciones necesarias para preparar y publicar un Pull Request de forma segura.

## Preparación del PR

### 1. Identificar cambios

- Identificar los archivos modificados por la tarea.
- Verificar que no se incluyen cambios ajenos a la feature.
- Revisar el estado, diff e historial de Git.

### 2. Verificar cambios

- Ejecutar los tests y verificar que pasan.
- Ejecutar el linter y verificar que no hay errores.
- Revisar que los cambios son coherentes con la feature.

### 3. Preparar commit

- Utilizar rutas explícitas al hacer `git add`.
- No añadir archivos no relacionados con la feature.
- Crear un commit con un mensaje descriptivo.

### 4. Publicar cambios

- Hacer `push` de la rama actual.
- **No hacer push directamente a `main`.**

### 5. Crear Pull Request

- Crear el Pull Request contra la rama base (`main`).
- Incluir `Closes #<issue-number>` en el cuerpo del Pull Request.
- Solicitar confirmación explícita antes de crear el PR.
- Informar de la URL del Pull Request.

## Reglas Importantes

- **No cerrar ni fusionar manualmente el issue o el Pull Request.**
- **No hacer push directamente a `main`.**
- **Solicitar confirmación explícita antes de realizar operaciones externas.**
- Si ya existe un Pull Request para la rama, no crear otro.

## Casos de Uso

### Creación inicial del PR

Cuando la rama no tiene commits publicados:

1. Identificar los cambios.
2. Verificar los cambios.
3. Crear el commit.
4. Hacer push de la rama.
5. Crear el Pull Request.
6. Informar de la URL.

### Actualización de PR existente

Cuando la rama ya tiene commits publicados:

1. Identificar los nuevos cambios.
2. Verificar los cambios.
3. Crear un nuevo commit.
4. Hacer push de la rama.
5. El PR existente se actualizará automáticamente.
6. Informar de la actualización.

## Cuerpo del Pull Request

El cuerpo del Pull Request debe incluir:

- Título descriptivo de la feature.
- Referencia al issue con `Closes #<issue-number>`.
- Resumen de los cambios realizados.
- Criterios de aceptación cumplidos (si aplica).

## Confirmación

Antes de crear o actualizar un PR:

- Mostrar los cambios que se van a publicar.
- Solicitar confirmación explícita del usuario.
- Esperar aprobación antes de proceder.
