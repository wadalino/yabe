# Implementar endpoints de consulta

**Estado:** open
**Creada:** 2026-09-14T19:44:12Z
**Cerrada:** N/A
**Número original:** #4

---

# Implementar endpoints de consulta

## Descripción

Implementar los endpoints de consulta del API para obtener el listado de hoteles y el listado de tipos de habitación.

Los endpoints deberán utilizar el servicio de datos mock existente como fuente de datos y devolver las estructuras definidas en la especificación OpenAPI.

Operaciones a implementar:

* `GET /api/v1/hotels`
* `GET /api/v1/room-types`

El endpoint de hoteles deberá devolver los hoteles junto con sus tipos de habitación e información de inventario (`quantity`), de acuerdo con el modelo `HotelRoomType` definido en el contrato.

El endpoint de tipos de habitación deberá devolver el listado de `RoomType`.

No se requiere persistencia ni ninguna otra fuente de datos en esta tarea.

## Criterios de aceptación

* `GET /api/v1/hotels` está implementado.
* `GET /api/v1/room-types` está implementado.
* Ambos endpoints utilizan el servicio de datos mock existente.
* Ninguno de los endpoints accede directamente a los datos mock desde el controller.
* `GET /api/v1/hotels` devuelve un array de hoteles conforme al esquema `Hotel` definido en OpenAPI.
* Cada hotel incluye sus `HotelRoomType`, incluyendo el `RoomType` y la cantidad de unidades (`quantity`).
* `GET /api/v1/room-types` devuelve un array conforme al esquema `RoomType` definido en OpenAPI.
* Los endpoints son accesibles sin autenticación.
* Se han añadido Feature Tests para ambos endpoints.
* Los tests verifican al menos el código de respuesta y la estructura de las respuestas.
* La suite completa de tests continúa pasando.

## Fuera de alcance

* Implementación de `POST /api/v1/availability`.
* Implementación de `POST /api/v1/bookings`.
* Cálculo de disponibilidad.
* Persistencia en base de datos.
* Migraciones y seeders.
* Paginación, filtrado u ordenación.
* Autenticación y autorización.
* Modificación de la especificación OpenAPI.

