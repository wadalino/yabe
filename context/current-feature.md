# Automatizar el despliegue mediante GitHub Actions

## Objetivos

### Objetivo

Crear un workflow de GitHub Actions que despliegue la aplicación en un VPS mediante SSH, construyendo la imagen Docker en el runner y trasladándola como artefacto. El workflow debe ejecutarse manualmente (`workflow_dispatch`) y ser reejecutable para actualizar una instalación existente.

### Requisitos

- Workflow en `.github/workflows/` con `workflow_dispatch`.
- Obtener el código, construir la imagen con el `Dockerfile` existente.
- Exportar con `docker save` y comprimir para la transferencia.
- Transferir imagen y `compose.yaml` de despliegue al VPS por SSH/SCP.
- En el VPS: cargar la imagen (`docker load`) y arrancar/actualizar con Docker Compose, accesible en el puerto de despliegue.
- El VPS no ejecuta `docker build`; los datos SQLite se conservan en el volumen Compose.

### Seguridad

- Sin secretos en el repositorio; usar GitHub Secrets `VPS_HOST`, `VPS_USER`, `VPS_SSH_KEY`.

### Criterios de aceptación

- El workflow existe y contiene todos los pasos (construir, empaquetar, transferir, desplegar).
- El despliegue usa la imagen construida por el workflow y conserva SQLite.
- Archivos validados localmente; **workflow no ejecutado, sin despliegue ni SSH al VPS**.

### Fuera del alcance

- Aprovisionamiento del VPS, Docker, DNS, HTTPS, Nginx, HA, rollback automático, monitorización.

## Notas

- Issue: #15

## Histórico

- 2026-09-18: Dockerizada la aplicación para ejecución local con Docker Compose.
- 2026-09-14: Creada la issue para inicializar el proyecto Laravel.
