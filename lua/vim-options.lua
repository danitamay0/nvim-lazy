local opt = vim.opt -- for conciseness

-- Line numbering
opt.relativenumber = true
opt.number = true
opt.showtabline = 2

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- Line wrapping
opt.wrap = true
--opt.colorcolumn = "80"

-- Search setting
opt.ignorecase = true
opt.smartcase = true

-- Cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
--opt.background = "dark"
opt.signcolumn = "yes"

-- Backspace
opt.backspace = "indent,eol,start"

-- Clipboard
opt.clipboard:append("unnamedplus")

-- Splitt Windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")

-- Treesitter folding
opt.foldmethod = "expr"       -- Usa 'expr' para el plegado basado en Treesitter
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldenable = true         -- Habilita el plegado por defecto
opt.foldlevel = 99            -- Evita que todo el código se colapse al abrir Neovim
opt.foldlevelstart = 99 -- test autoread

-- Auto-reload files changed outside nvim
opt.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  pattern = "*",
  callback = function()
    if vim.fn.mode() ~= "c" then
      vim.cmd("checktime")
    end
  end,
})
