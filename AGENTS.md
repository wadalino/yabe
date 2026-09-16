# Instrucciones para el agente

## Contexto

Leer los siguientes ficheros para obtener contexto completo del proyecto:

- @context/current-feature.md
- @context/current-feature-file-spec.md
- @context/feature-workflow.md
- @context/coding-conventions.md

## Workflow de Features

Cuando la tarea implique iniciar, implementar, verificar o finalizar una feature, un issue o `context/current-feature.md`, cargar el skill `feature-workflow`:

```
.opencode/skills/feature-workflow/SKILL.md
```

Este skill define las fases del workflow (Inicio, Implementación y verificación, Finalización) y las reglas generales para trabajar con una feature.

## Creación de Pull Requests

Cuando se vaya a crear o actualizar un Pull Request, cargar el skill `pull-request`:

```
.opencode/skills/pull-request/SKILL.md
```

Este skill define las reglas y comprobaciones necesarias para preparar y publicar un PR de forma segura.

## Comandos Disponibles

- `/start-feature <issue>`: Inicia una feature a partir de un GitHub Issue.
- `/create-pr <issue>`: Prepara y crea el Pull Request de una feature.
- `/finish-feature <issue>`: Ejecuta la fase de Finalización de una feature.

## GitHub

Al crear o modificar issues o pull requests:

- Utilizar Markdown válido.
- Los saltos de línea deben ser saltos reales, no la cadena literal `\n`.
- Para cuerpos con varias líneas, utilizar `--body-file` o un mecanismo equivalente que preserve correctamente el formato.
- No cerrar ni fusionar manualmente issues o Pull Requests.
- Utilizar `Closes #<issue-number>` en el cuerpo del PR para que GitHub cierre el issue cuando se produzca el merge.

## Labels de GitHub Issues

Los estados de una feature se representan mediante dos labels:

- `in-progress`: La feature está en desarrollo.
- `done`: La implementación ha terminado y el PR está listo para merge.

Los labels son mutuamente excluyentes. Al iniciar una feature se añade `in-progress`. Al finalizarla se elimina `in-progress` y se añade `done`.
