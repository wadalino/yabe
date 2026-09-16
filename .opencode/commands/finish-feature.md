---
description: Ejecuta la fase de Finalización de una feature. Actualiza el descriptor, commit, push y cambia el issue a done.
agent: build
---

# /finish-feature

Este comando ejecuta la fase de Finalización de una feature en la rama actual.

## Instrucciones

1. **Obtener el número del issue** desde `$ARGUMENTS` o desde `context/current-feature.md`:
   - Si se proporciona `$ARGUMENTS`, usar ese número.
   - Si no, leer `## Notas` en `context/current-feature.md` para obtener el número del issue.
   - Formato en `## Notas`: `- Issue: #<number>`

2. **Comprobar que el issue corresponde a la feature actual**:
   - Verificar que el issue en `## Notas` coincide con el número obtenido.

3. **Comprobar que la implementación está verificada y cumple los criterios de aceptación**:
   - Ejecutar los tests y verificar que pasan.
   - Revisar que se cumplen los criterios de aceptación del issue.

4. **Comprobar que no se está trabajando directamente sobre `main`**:
   - Verificar que la rama actual no es `main`.
   - Si es `main`, informar al usuario y detenerse.

5. **Revisar el estado, diff e historial de Git**:
   - Verificar el estado del repositorio.
   - Revisar los cambios realizados.

6. **Actualizar `context/current-feature.md`**:
   - Añadir al principio de `## Histórico` una entrada de una línea que resuma el trabajo realizado.
   - Formato: `- YYYY-MM-DD: Resumen del trabajo realizado.`
   - Cambiar el encabezado principal a `# Feature actual`.
   - Vaciar `## Objetivos`.
   - Vaciar `## Notas`.
   - Conservar los encabezados y el histórico anterior.

7. **Solicitar confirmación explícita antes de publicar los cambios**:
   - Mostrar los cambios que se van a realizar.
   - Preguntar al usuario si desea continuar.
   - Esperar aprobación antes de proceder.

8. **Crear el commit de finalización**:
   - Utilizar un mensaje descriptivo como "Finalizar feature: <nombre de la feature>".

9. **Hacer `push` de la rama actual**:
   - Push de la rama actual al origin.
   - **No hacer push directamente a `main`.**
   - Si ya existe un Pull Request para la rama, el push lo actualizará automáticamente.

10. **Quitar `in-progress` del issue**:
    - Eliminar el label `in-progress` del issue en GitHub.

11. **Añadir `done` al issue**:
    - Añadir el label `done` al issue en GitHub.

## Casos especiales

### Si ya existe un Pull Request para la rama

- El push final actualizará el PR existente.
- No crear un nuevo PR.
- Informar al usuario que el PR se ha actualizado.

### Si no se está trabajando en una feature

- Verificar que `context/current-feature.md` tiene un issue asociado en `## Notas`.
- Si no hay issue asociado, informar al usuario y detenerse.

## Ejemplo de uso

```
/finish-feature 3
```

Esto finalizará la feature asociada al issue #3.

## Notas importantes

- **No fusionar el Pull Request.**
- **No cerrar manualmente el issue.** El PR utilizará `Closes #<issue-number>` para que GitHub cierre el issue cuando se produzca el merge.
- **No hacer push directamente a `main`.**
- **Solicitar confirmación explícita antes de realizar operaciones externas.**
- El histórico de `context/current-feature.md` se preserva entre features.
- Al finalizar, el descriptor queda preparado para una nueva feature.
