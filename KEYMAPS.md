# Neovim Keymaps

> `<leader>` = `Space`

---

## Edición general

| Atajo | Descripción |
|-------|-------------|
| `jk` (insert) | Salir a normal mode |
| `J` / `K` (visual) | Mover línea seleccionada abajo / arriba |
| `<` / `>` (visual) | Indentar sin perder la selección |
| `+` / `-` | Incrementar / decrementar número bajo el cursor |
| `<C-a>` | Seleccionar todo el archivo |
| `<leader>co` | Toggle comentario (normal y visual) |

---

## Archivos y ventanas

| Atajo | Descripción |
|-------|-------------|
| `<leader>w` | Guardar archivo |
| `<leader>q` | Cerrar ventana |
| `<leader>sh` | Split horizontal |
| `<leader>sv` | Split vertical |
| `<A-h/j/k/l>` | Navegar entre paneles |
| `<A-S-h/j/k/l>` | Redimensionar panel activo |
| `<leader>th` | Convertir splits a disposición horizontal |
| `<leader>tk` | Convertir splits a disposición vertical |

---

## Buffers — Barbar

| Atajo | Descripción |
|-------|-------------|
| `<Tab>` | Siguiente buffer |
| `<S-Tab>` | Buffer anterior |
| `<A-S-Tab>` | Ir al último buffer usado |
| `<leader>x` | Cerrar buffer actual |
| `<leader>X` | Cerrar todos los buffers excepto el actual |
| `<leader>bl` | Cerrar buffers a la izquierda |
| `<leader>bm` | Seleccionar buffer interactivamente |
| `<A-.>` / `<A-,>` | Mover buffer a la derecha / izquierda |
| `<A-p>` | Pin / unpin buffer |

---

## Explorador — Neo-tree

| Atajo | Descripción |
|-------|-------------|
| `<leader>b` | Toggle Neo-tree |
| `<leader>e` | Enfocar Neo-tree |
| `<leader>t` | Toggle Neo-tree manteniendo foco en el editor |
| `<leader>o` | Volver el foco al archivo actual |
| `<leader>nb` | Ver buffers abiertos en Neo-tree |

---

## Búsqueda — Telescope

| Atajo | Descripción |
|-------|-------------|
| `<leader>ff` | Buscar archivos (incluye ocultos) |
| `<leader>fg` | Buscar texto en el proyecto (live grep) |
| `<leader>fr` | Archivos abiertos recientemente |
| `<leader>fb` | Buffers abiertos |
| `<leader>ft` | Buscar TODOs en el proyecto |

---

## Buscar y reemplazar — Spectre

| Atajo | Descripción |
|-------|-------------|
| `<leader>S` | Toggle panel Spectre |
| `<leader>sw` | Buscar la palabra bajo el cursor en el proyecto |
| `<leader>sw` (visual) | Buscar selección en el proyecto |
| `<leader>sp` | Buscar/reemplazar solo en el archivo actual |

---

## LSP

| Atajo | Descripción |
|-------|-------------|
| `K` | Mostrar documentación (hover) |
| `gd` | Ir a definición |
| `gD` | Ir a declaración |
| `gr` | Ver todas las referencias |
| `<leader>ca` | Code actions (correcciones, imports, etc.) |
| `<leader>gf` | Formatear archivo |

---

## Autocompletado — nvim-cmp

| Atajo | Descripción |
|-------|-------------|
| `<C-Space>` | Forzar apertura del menú de completado |
| `<CR>` | Confirmar la sugerencia seleccionada |
| `<C-e>` | Cancelar / cerrar el menú |
| `<C-b>` / `<C-f>` | Scroll arriba / abajo en la documentación |

---

## Git — Gitsigns

| Atajo | Modo | Descripción |
|-------|------|-------------|
| `]h` / `[h` | normal | Saltar al hunk siguiente / anterior |
| `<leader>hp` | normal | Preview del hunk actual |
| `<leader>hs` | normal/visual | Stage hunk (o selección) |
| `<leader>hr` | normal/visual | Reset hunk (o selección) |
| `<leader>hu` | normal | Deshacer el último stage |
| `<leader>hS` | normal | Stage todo el archivo |
| `<leader>hR` | normal | Reset todo el archivo |
| `<leader>gb` | normal | Blame completo de la línea actual |
| `<leader>gdc` | normal | Diff del archivo actual |
| `<leader>gd` | normal | Git status en Telescope |

## Git — LazyGit

| Atajo | Descripción |
|-------|-------------|
| `<leader>gg` | Abrir LazyGit en ventana flotante |

---

## Sesiones — auto-session

| Atajo | Descripción |
|-------|-------------|
| `<leader>ss` | Guardar sesión actual |
| `<leader>sl` | Listar y restaurar sesiones (Telescope) |
| `<leader>sd` | Eliminar todas las sesiones guardadas |

---

## Surround — nvim-surround

| Atajo | Descripción |
|-------|-------------|
| `ys{motion}{char}` | Agregar surround — ej: `ysiw"` envuelve la palabra en `"` |
| `ds{char}` | Eliminar surround — ej: `ds"` quita las comillas |
| `cs{old}{new}` | Cambiar surround — ej: `cs"'` cambia `"` por `'` |
| `S{char}` (visual) | Envolver la selección con el caracter indicado |

---

## TODOs — todo-comments

| Atajo | Descripción |
|-------|-------------|
| `]t` / `[t` | Saltar al TODO siguiente / anterior |
| `<leader>ft` | Ver todos los TODOs en Telescope |

> Etiquetas reconocidas: `TODO`, `FIXME`, `HACK`, `NOTE`, `WARN`, `PERF`
