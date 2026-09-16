# YABE API v0.1.0

## Objetivos

Implementar el API del Yet Another Booking Engine (YABE) según la especificación OpenAPI vigente. El API expone las siguientes operaciones bajo el prefijo `/api/v1`:

* `GET /api/v1/hotels` — Listado de hoteles con sus tipos de habitación e información de inventario.
* `GET /api/v1/room-types` — Listado de tipos de habitación disponibles.
* `POST /api/v1/availability` — Consulta de disponibilidad de habitaciones para un número de huéspedes y intervalo de fechas dados.
* `POST /api/v1/bookings` — Creación de un nuevo booking.

**Modelos principales del contrato:**

| Esquema | Descripción |
|---|---|
| `Hotel` | Hotel con nombre, código y tipos de habitación (incluye `quantity` y `price` en openapi-2). |
| `RoomType` | Tipo de habitación con nombre, código y ocupación máxima (`maxOccupancy`). |
| `HotelRoomType` | Relación hotel-tipo de habitación con cantidad de unidades (`quantity`) y precio (`price`). |
| `AvailabilityRequest` | Solicitud de disponibilidad con `paxes`, `checkin`, `checkout`, y filtros opcionales `hotel` y `roomType`. |
| `Availability` | Respuesta de disponibilidad con hotel, tipo de habitación y precio. |
| `CreateBookingRequest` | Solicitud de creación de booking con hotel, tipo de habitación, huéspedes y fechas. |
| `Booking` | Booking confirmado con locator, hotel, tipo de habitación, huéspedes, fechas y estado (`CONFIRMED` / `CANCELLED`). |

**Diferencia entre openapi-1 y openapi-2:**

* `openapi-1.yaml`: `Hotel.roomTypes` es array de `RoomType`.
* `openapi-2.yaml`: `Hotel.roomTypes` es array de `HotelRoomType` (incluye `quantity` y `price` por hotel).

## Notas

* La versión de la API es `0.1.0`.
* El servidor está definido en `/api/v1`.
* Existen dos especificaciones OpenAPI (`openapi-1.yaml` y `openapi-2.yaml`) que difieren principalmente en el modelo de inventario de habitaciones por hotel.
* El endpoint de disponibilidad permite filtrar opcionalmente por `hotel` y/o `roomType`.
* Los bookings pueden tener estado `CONFIRMED` o `CANCELLED`.
* No se requiere autenticación para los endpoints del API.

## Histórico
