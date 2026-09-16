---
description: Inicia una feature a partir de un GitHub Issue. Prepara el contexto y marca el issue como in-progress.
agent: build
---

# /start-feature

Este comando inicia una feature a partir de un GitHub Issue.

## Instrucciones

1. **Cargar el skill `feature-workflow`** para seguir el workflow definido.

2. **Obtener el número del issue** desde `$ARGUMENTS` o pedir al usuario si no se proporciona.

3. **Consultar el issue** en GitHub:
   - Obtener título, descripción, labels, comentarios y criterios de aceptación.
   - Verificar que el issue está abierto.

4. **Actualizar `context/current-feature.md`**:
   - Establecer el encabezado de primer nivel con el nombre de la feature (título del issue).
   - Rellenar la sección `## Objetivos` con:
     - Descripción de la feature.
     - Requisitos y criterios de aceptación del issue.
   - Registrar el issue asociado en `## Notas` con el formato:
     ```
     - Issue: #<number>
     ```
   - **Preservar el histórico existente** (no eliminar entradas anteriores).

5. **Marcar el issue como `in-progress`** en GitHub:
   - Añadir el label `in-progress` al issue.
   - Si el label no existe, crearlo primero.

6. **Detenerse después de completar esta fase.**
   - No implementar la feature.
   - No crear commits.
   - No crear un Pull Request.
   - Informar al usuario que la fase de Inicio se ha completado y que puede proceder con la implementación.

## Ejemplo de uso

```
/start-feature 3
```

Esto iniciará la feature asociada al issue #3.

## Notas importantes

- Este comando solo ejecuta la fase de **Inicio** del workflow.
- El usuario debe solicitar explícitamente la implementación después de este comando.
- El histórico de `context/current-feature.md` se preserva entre features.
- El issue se marca como `in-progress` para indicar que se está trabajando en él.
