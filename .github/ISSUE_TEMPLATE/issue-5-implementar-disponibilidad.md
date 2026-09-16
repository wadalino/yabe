# Implementar disponibilidad

**Estado:** open
**Creada:** 2026-09-14T19:45:19Z
**Cerrada:** N/A
**Número original:** #5

---

# Implementar disponibilidad

## Descripción

Implementar el endpoint de consulta de disponibilidad del API:

`POST /api/v1/availability`

El endpoint deberá devolver los hoteles y tipos de habitación disponibles para el número de huéspedes y el intervalo solicitado.

La lógica de disponibilidad deberá obtener los datos necesarios a través del servicio de datos existente. En esta implementación, dicho servicio proporciona los datos en memoria mediante el mock disponible.

La implementación de la disponibilidad no deberá depender de la forma concreta en que los datos son almacenados o proporcionados por el mock, de forma que la fuente de datos pueda sustituirse posteriormente por persistencia sin modificar la lógica de negocio de disponibilidad

La implementación deberá respetar el contrato definido en la especificación OpenAPI vigente.

Para determinar la disponibilidad se deberán considerar:

* El número de huéspedes (`paxes`) solicitado.
* La capacidad máxima (`maxOccupancy`) del tipo de habitación.
* La cantidad de unidades (`quantity`) definida en `HotelRoomType`.
* Los bookings existentes para cada hotel y tipo de habitación.
* La solapación de los bookings con el intervalo solicitado.

Solo se considerarán disponibles los tipos de habitación cuya capacidad máxima sea igual o superior al número de huéspedes solicitado.

Una habitación estará disponible cuando el número de bookings confirmados que se solapan con el intervalo solicitado sea inferior a la cantidad de unidades de ese tipo de habitación disponibles en el hotel.

El intervalo se considerará solapado cuando:

* `booking.checkin < requested.checkout`
* `booking.checkout > requested.checkin`

Los bookings cancelados no deberán consumir disponibilidad.

El precio incluido en la respuesta deberá obtenerse del `HotelRoomType` correspondiente. No se requiere implementar ninguna lógica de cálculo de tarifas.

El endpoint deberá permitir filtrar opcionalmente por hotel y tipo de habitación mediante sus respectivos códigos.

No se requiere persistencia en esta tarea. El servicio de datos mock existente seguirá siendo la fuente de datos.

## Criterios de aceptación

* `POST /api/v1/availability` está implementado.
* El endpoint acepta un `AvailabilityRequest` conforme al contrato OpenAPI vigente.
* El endpoint devuelve un array de elementos `Availability` conforme al contrato OpenAPI vigente.
* El número de huéspedes (`paxes`) se utiliza para determinar los tipos de habitación que pueden alojarlos.
* No se incluyen en la respuesta tipos de habitación cuyo `maxOccupancy` sea inferior a `paxes`.
* La disponibilidad se calcula utilizando la cantidad (`quantity`) definida en `HotelRoomType`.
* Los bookings confirmados que se solapan con el intervalo solicitado reducen el inventario disponible.
* Los bookings que no se solapan con el intervalo solicitado no reducen el inventario disponible.
* Los bookings con estado `CANCELLED` no reducen el inventario disponible.
* Cuando todas las unidades de un hotel y tipo de habitación están ocupadas durante el intervalo solicitado, ese tipo de habitación no se devuelve como disponible.
* Cuando existe al menos una unidad disponible, se devuelve el correspondiente elemento `Availability`.
* El `price` de cada elemento `Availability` corresponde al precio definido en el `HotelRoomType` correspondiente.
* El filtro `hotel`, cuando se proporciona, limita los resultados al hotel indicado.
* El filtro `roomType`, cuando se proporciona, limita los resultados al tipo de habitación indicado.
* La ausencia de ambos filtros permite consultar la disponibilidad de todos los hoteles y tipos de habitación que cumplen los criterios solicitados.
* Se han añadido Feature Tests que cubren como mínimo:

  * disponibilidad sin bookings solapados;
  * disponibilidad con bookings solapados;
  * bookings cancelados;
  * intervalo sin disponibilidad;
  * capacidad insuficiente para el número de huéspedes;
  * filtros por hotel y tipo de habitación;
  * precio obtenido del `HotelRoomType`;
  * cambio de disponibilidad en función del intervalo solicitado.
* La suite completa de tests continúa pasando.

## Fuera de alcance

* Persistencia en base de datos.
* Creación o cancelación de bookings.
* Gestión de concurrencia.
* Cálculo dinámico de tarifas.
* Tarifas por temporada, fechas, ocupación u otras reglas de pricing.
* Cambios en el servicio de datos mock salvo los estrictamente necesarios para soportar esta funcionalidad.
* Paginación, autenticación y autorización.

