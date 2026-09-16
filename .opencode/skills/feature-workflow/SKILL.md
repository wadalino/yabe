---
name: feature-workflow
description: Define el workflow general de features y sus fases. Usar cuando se inicie, implemente, verifique o finalice una feature.
---

# Feature Workflow

Este skill define el workflow reproducible para el desarrollo de features a partir de GitHub Issues.

## Fases del Workflow

### 1. Inicio

Prepara el contexto necesario para trabajar en la feature:

- Consulta el GitHub Issue asociado (título, descripción, labels, comentarios, criterios de aceptación).
- Actualiza `context/current-feature.md` con la información de la feature:
  - Establece el encabezado de primer level con el nombre de la feature.
  - Rellena la sección `## Objetivos` con los requisitos y criterios de aceptación.
  - Registra el issue asociado en `## Notas` con el formato `- Issue: #<number>`.
  - Preserva el histórico existente.
- Marca el issue como `in-progress` en GitHub.
- **Se detiene después de completar esta fase.** No implementa la feature.

### 2. Implementación y Verificación

Implementa la feature y comprueba que cumple su especificación:

- Implementa los cambios necesarios.
- Ejecuta los tests y verifica que pasan.
- Comprueba que se cumplen los criterios de aceptación del issue.
- Realiza commits de forma incremental con mensajes descriptivos.

### 3. Finalización

Una vez verificada la feature, prepara el cierre:

- Actualiza `context/current-feature.md`:
  - Añade al principio de `## Histórico` una entrada de una línea que resuma el trabajo realizado.
  - Cambia el encabezado principal a `# Feature actual`.
  - Vacía `## Objetivos`.
  - Vacía `## Notas`.
  - Conserva los encabezados y el histórico anterior.
- Crea el commit de finalización.
- Hace push de la rama actual.
- Cambia el issue de `in-progress` a `done`.

## Reglas Generales

- **El agente no debe avanzar automáticamente a una fase posterior sin una solicitud explícita del usuario.**
- Cada fase debe completarse antes de pasar a la siguiente.
- El usuario controla el flujo del workflow.

## Relación entre Feature, Issue y Descriptor

- Cada feature está asociada a un GitHub Issue.
- El descriptor de la feature activa se encuentra en `context/current-feature.md`.
- El descriptor debe reflejar el estado actual de la feature.
- Al finalizar una feature, el descriptor queda preparado para la siguiente.

## Contexto por Fase

### Inicio
- Cargar este skill (`feature-workflow`).
- Consultar el GitHub Issue.
- Leer `context/current-feature-file-spec.md` para conocer la estructura del descriptor.

### Implementación y Verificación
- Cargar este skill (`feature-workflow`).
- Leer `context/current-feature.md` para mantener el contexto de la feature.
- Leer `context/coding-conventions.md` para seguir las convenciones de código.

### Finalización
- Cargar este skill (`feature-workflow`).
- Leer `context/current-feature.md` para actualizar el descriptor.
- Cargar el skill `pull-request` si se necesita crear o actualizar un PR.
