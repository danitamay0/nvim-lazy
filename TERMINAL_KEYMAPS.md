# Zellij Keymaps

> Configurado en `~/.config/zellij/config.kdl` con `clear-defaults=true` — es decir, **no** quedan atajos por defecto de Zellij, todo lo de aquí es tu configuración.

---

## Fullscreen de un panel

| Atajo | Descripción |
|-------|-------------|
| `Ctrl p` → `f` | Toggle fullscreen del panel enfocado (mismo atajo entra y sale) |
| `Ctrl b` → `z` | Alternativa estilo tmux — también entra y sale |

---

## Entrar a los modos (desde `normal`)

| Atajo | Modo |
|-------|------|
| `Ctrl g` | Locked — bloquea el teclado, pasa las teclas directo a la app (clave dentro de nvim) |
| `Ctrl p` | Pane |
| `Ctrl t` | Tab |
| `Ctrl n` | Resize |
| `Ctrl h` | Move (mover panel) |
| `Ctrl s` | Scroll / Search |
| `Ctrl o` | Session |
| `Ctrl b` | Tmux (compatibilidad) |
| `Ctrl q` | Quit |
| `Ctrl g` (en locked) | Volver a normal |

---

## Pane — `Ctrl p`

| Atajo | Descripción |
|-------|-------------|
| `hjkl` / flechas | Mover foco entre paneles |
| `n` | Nuevo panel |
| `d` | Nuevo panel abajo |
| `r` | Nuevo panel a la derecha |
| `s` | Nuevo panel apilado |
| `c` | Renombrar panel |
| `e` | Toggle flotante ↔ embebido |
| `f` | **Toggle fullscreen** |
| `i` | Fijar panel (pinned) |
| `w` | Toggle paneles flotantes |
| `z` | Toggle frames de panel |
| `p` | Switch focus |
| `x` | Cerrar panel enfocado |

---

## Tab — `Ctrl t`

| Atajo | Descripción |
|-------|-------------|
| `hjkl` / flechas | Tab anterior / siguiente |
| `1`-`9` | Ir a la tab N |
| `n` | Nueva tab |
| `r` | Renombrar tab |
| `x` | Cerrar tab |
| `s` | Toggle sync tab (escribe en todos los paneles a la vez) |
| `[` / `]` | Break pane a la izquierda / derecha |
| `b` | Break pane |
| `tab` | Toggle tab |

---

## Resize — `Ctrl n`

| Atajo | Descripción |
|-------|-------------|
| `hjkl` / flechas | Aumentar tamaño en esa dirección |
| `HJKL` | Disminuir tamaño en esa dirección |
| `+` / `=` | Aumentar |
| `-` | Disminuir |

---

## Move — `Ctrl h`

| Atajo | Descripción |
|-------|-------------|
| `hjkl` / flechas | Mover el panel en esa dirección |
| `n` / `tab` | Mover panel (ciclar) |
| `p` | Mover panel hacia atrás |

---

## Scroll / Search — `Ctrl s`

| Atajo | Descripción |
|-------|-------------|
| `e` | Editar scrollback en el editor |
| `s` | Entrar a búsqueda |
| `hjkl` | Scroll |
| `d` / `u` | Media página abajo / arriba |
| `PageUp` / `PageDown` | Página completa |
| `Ctrl c` | Ir al final y salir a normal |

En búsqueda (`s` dentro de scroll):

| Atajo | Descripción |
|-------|-------------|
| `n` / `p` | Siguiente / anterior resultado |
| `c` | Toggle case sensitivity |
| `o` | Toggle whole word |
| `w` | Toggle wrap |

---

## Session — `Ctrl o`

| Atajo | Descripción |
|-------|-------------|
| `w` | Session manager |
| `p` | Plugin manager |
| `l` | Layout manager |
| `c` | Configuration |
| `a` | About |
| `s` | Share |
| `d` | Detach |

---

## Tmux compat — `Ctrl b`

| Atajo | Descripción |
|-------|-------------|
| `hjkl` | Mover foco |
| `"` / `%` | Nuevo panel abajo / derecha |
| `c` | Nueva tab |
| `n` / `p` | Next / prev tab |
| `,` | Renombrar tab |
| `[` | Scroll mode |
| `z` | **Toggle fullscreen** |
| `o` | Focus next pane |
| `d` | Detach |

---

## Globales (funcionan sin entrar a un modo)

| Atajo | Descripción |
|-------|-------------|
| `Alt hjkl` / flechas | Mover foco entre paneles (rápido, sin entrar a modo pane) |
| `Alt +` / `-` / `=` | Resize rápido |
| `Alt [` / `]` | Swap layout anterior / siguiente |
| `Alt f` | Toggle paneles flotantes |
| `Alt n` | Nuevo panel |
| `Alt i` / `o` | Mover tab a la izquierda / derecha |
| `Alt p` | Agregar panel al grupo |
| `Alt Shift p` | Toggle group marking |
| `Ctrl q` | Quit |

---

## Cheat sheet — lo más usado

- `Ctrl p` → `f` — **fullscreen on/off**
- `Ctrl g` — bloquear/desbloquear (para que `hjkl` no choque con nvim)
- `Alt hjkl` — moverte entre paneles sin entrar a modo
- `Ctrl p` → `n` / `d` / `r` — crear panel
- `Ctrl t` → `n` / `1-9` — nueva tab / saltar a tab N
- `Ctrl s` — scroll / buscar en el buffer
- `Ctrl o` → `w` — session manager
- `Ctrl q` — salir de zellij
