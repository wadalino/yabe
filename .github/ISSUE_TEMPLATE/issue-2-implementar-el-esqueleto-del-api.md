# Implementar el esqueleto del API

**Estado:** closed
**Creada:** 2026-09-14T19:42:41Z
**Cerrada:** 2026-09-15T09:03:35Z
**Número original:** #2

---

# Implementar el esqueleto del API

## Descripción

Implementar en Laravel el esqueleto inicial del API definido en la especificación OpenAPI acordada con negocio.

La especificación OpenAPI existente constituye el contrato del API y **no forma parte del alcance de esta tarea**. El objetivo es preparar la estructura de la aplicación necesaria para comenzar a implementar las operaciones en tareas posteriores.

El API será inicialmente público, sin autenticación, y estará versionado como `v1`.

El esqueleto deberá contemplar las siguientes operaciones definidas en el contrato:

* `GET /api/v1/hotels`
* `GET /api/v1/room-types`
* `POST /api/v1/availability`
* `POST /api/v1/bookings`

Deberán crearse los componentes Laravel necesarios para implementar posteriormente estas operaciones, manteniendo una separación clara entre la capa HTTP y la lógica de aplicación.

En esta issue no se implementará la lógica funcional de ninguna de las operaciones.

## Criterios de aceptación

* La aplicación Laravel expone las rutas definidas en la especificación OpenAPI.
* Existe una estructura de controllers adecuada para las operaciones del API.
* La API es accesible sin autenticación.
* El API utiliza el prefijo `/api/v1`.
* Existe un mecanismo de prueba que permite verificar que las rutas están correctamente registradas.
* La suite de tests existente continúa pasando.
* El código queda preparado para implementar cada operación en issues posteriores.

## Fuera de alcance

* Modificar o ampliar la especificación OpenAPI.
* Implementar la lógica de listado de hoteles.
* Implementar la lógica de listado de tipos de habitación.
* Implementar la lógica de disponibilidad.
* Implementar la lógica de creación de bookings.
* Persistencia de datos.
* Integración con proveedores externos.
* Autenticación y autorización.
* Paginación, filtrado u ordenación.

