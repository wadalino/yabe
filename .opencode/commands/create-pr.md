---
description: Prepara y crea el Pull Request de una feature. Publica los cambios y crea el PR contra main.
agent: build
---

# /create-pr

Este comando prepara y crea el Pull Request de una feature.

## Instrucciones

1. **Cargar los skills necesarios**:
   - `feature-workflow` para el contexto de la feature.
   - `pull-request` para las reglas de creación del PR.

2. **Obtener el número del issue** desde `$ARGUMENTS` o desde `context/current-feature.md`.

3. **Comprobar la rama actual y el estado del repositorio**:
   - Verificar que no se está trabajando directamente sobre `main`.
   - Verificar que hay cambios pendientes o commits sin publicar.

4. **Identificar los cambios pertenecientes a la tarea**:
   - Revisar `git status` y `git diff`.
   - Verificar que no se incluyen cambios ajenos a la feature.

5. **Ejecutar las verificaciones necesarias**:
   - Ejecutar los tests y verificar que pasan.
   - Ejecutar el linter y verificar que no hay errores.

6. **Mostrar los cambios que se van a publicar**:
   - Listar los archivos modificados.
   - Mostrar el resumen de los cambios.

7. **Solicitar confirmación explícita**:
   - Preguntar al usuario si desea continuar con la publicación.
   - Esperar aprobación antes de proceder.

8. **Crear el commit cuando existan cambios sin publicar**:
   - Utilizar rutas explícitas al hacer `git add`.
   - Crear un commit con un mensaje descriptivo.

9. **Hacer `push` de la rama**:
   - Push de la rama actual al origin.
   - **No hacer push directamente a `main`.**

10. **Crear el Pull Request contra `main`**:
    - Incluir `Closes #<issue-number>` en el cuerpo del Pull Request.
    - El PR se creará contra la rama `main`.

11. **Informar de la URL del Pull Request y detenerse**:
    - Mostrar la URL del PR creado.
    - No fusionar el Pull Request.
    - No cerrar manualmente el issue.

## Casos especiales

### Si ya existe un Pull Request para la rama

- No crear otro PR.
- Informar al usuario que ya existe un PR.
- El push de nuevos commits actualizará el PR existente.

### Si no hay cambios pendientes

- Informar al usuario que no hay cambios para publicar.
- Sugerir verificar el estado del repositorio.

## Ejemplo de uso

```
/create-pr 3
```

Esto creará un PR para la feature asociada al issue #3.

## Notas importantes

- **No cerrar ni fusionar manualmente el issue o el Pull Request.**
- **No hacer push directamente a `main`.**
- **Solicitar confirmación explícita antes de realizar operaciones externas.**
- El PR utilizará `Closes #<issue-number>` para que GitHub cierre el issue cuando se produzca el merge.
