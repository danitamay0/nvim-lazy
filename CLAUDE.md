# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Layout

```
init.lua               # Bootstrap: loads lazy.nvim, requires vim-options & keymaps
lua/
  vim-options.lua      # Core Vim settings (tabs=2, relativenumber, folding, etc.)
  keymaps.lua          # All global keybindings (leader = Space)
  plugins/             # One file per plugin — auto-discovered by Lazy.nvim
lazy-lock.json         # Locked plugin versions (commit after intentional upgrades)
KEYMAPS.md             # Human-readable keymap reference — keep in sync with keymaps.lua
```

## Plugin Architecture

**Manager**: [Lazy.nvim](https://github.com/folke/lazy.nvim), bootstrapped in `init.lua`. Every `lua/plugins/*.lua` file is auto-loaded as a plugin spec — no manual registration needed.

**Standard plugin file shape**:
```lua
return {
  "author/plugin-name",
  dependencies = { ... },
  event = "VeryLazy",   -- or cmd = "...", keys = {...}
  opts = { ... },       -- preferred over config = function() when setup args are simple
  config = function()
    require("plugin").setup({ ... })
  end,
}
```

**Load strategy**: Default `lazy = false` (eager). Use `event`, `cmd`, or `keys` to defer heavy plugins.

## Adding / Modifying Plugins

1. Create `lua/plugins/<feature>.lua` with a valid Lazy spec.
2. If the plugin adds keymaps, define them inside the spec's `config` (co-located) **or** in `keymaps.lua` for global bindings.
3. Update `KEYMAPS.md` whenever keybindings change.

## LSP Setup

LSP is configured with Neovim's **native LSP API** (not the deprecated `lspconfig` style). Mason manages server installation. Python LSP auto-detects virtual environments (`.venv`, `venv`, `env`). See `lua/plugins/lsp-config.lua`.

## Active Colorscheme

Dracula (transparent background, italic comments/keywords). Other themes are configured but commented out in `lua/plugins/colorscheme.lua`.

## Key Conventions

- **Leader key**: `<Space>`
- **Tab width**: 2 spaces (expandtab)
- **Folding**: Treesitter-based (`foldmethod=expr`)
- **Formatting**: Conform.nvim (Black → Python, Prettier → JS/TS/CSS, Stylua → Lua)
- Treesitter languages: lua, python, javascript, typescript, go, rust, php, bash, html, css, json, yaml, markdown
