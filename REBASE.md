# REBASE.md - Limpieza del historial con git rebase interactivo

## Qué se hizo y por qué

Durante el desarrollo de la práctica fui haciendo varios commits con mensajes
poco descriptivos (`asdf`, `cambios`, `arreglo`, `cosas`). Antes de subirlo definitivamente
al repositorio quise limpiar el historial para que quedara claro y
profesional, así que usé `git rebase -i` para fusionar los 4 commits feos en
uno solo con un mensaje claro.

## Estado del historial antes del rebase
598eb6a (HEAD -> main) cosas
9293092 arreglo
2b2c3f2 cambios
df0f265 asdf
33d24f2 (origin/main) Añadir workflow de deploy con LocalStack en Actions
b069ee1 Añadir workflow de validación Terraform y badge
2ec8c17 Configuración inicial de Terraform con LocalStack

## Pasos realizados

1. Lancé el rebase interactivo sobre los últimos 4 commits:
```bash
   git rebase -i HEAD~4
```

2. En el editor de nano cambié 3 de los 4 `pick` por `squash` para fusionar
   los commits en uno solo, dejando el primero como base:
pick   df0f265 asdf
squash 2b2c3f2 cambios
squash 9293092 arreglo
squash 598eb6a cosas

3. Guardé y cerré el archivo. Git abrió otro editor para escribir el mensaje
   del commit fusionado. Borré todos los mensajes anteriores y escribí uno
   nuevo y descriptivo:
Añadir archivo de notas de la práctica

4. Comprobé el historial local con `git log --oneline` y vi que los 4
   commits se habían fusionado en uno solo.

5. Como el rebase reescribe el historial, el push normal no funciona porque
   el repo remoto tiene el historial antiguo. Por eso usé `--force` para
   sobreescribirlo:
```bash
   git push --force
```

## Estado del historial después del rebase
0e2cc0e (HEAD -> main) Añadir archivo de notas de la práctica
33d24f2 (origin/main) Añadir workflow de deploy con LocalStack en Actions
b069ee1 Añadir workflow de validación Terraform y badge
2ec8c17 Configuración inicial de Terraform con LocalStack

## Decisiones que tomé

- Decidí usar `squash` en vez de `fixup` porque quería conservar todos los
  mensajes anteriores en el editor para revisarlos antes de escribir el
  mensaje final, aunque al final escribí uno nuevo desde cero.
- Usé `--force` en lugar de `--force-with-lease` porque trabajo solo en este
  repo y no había riesgo de pisar cambios de nadie. En un proyecto en equipo
  habría usado `--force-with-lease`, que es más seguro porque solo hace push
  forzado si nadie más ha subido cambios desde el último fetch.
