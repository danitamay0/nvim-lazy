local map = vim.keymap.set
vim.g.mapleader = " "

-- Save current file
map("n", "<leader>w", ":w<cr>", { desc = "Save file", remap = true })

-- move line
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Paste sin sobrescribir el registro
map("v", "p", '"_dP', { noremap = true })

-- ESC pressing jk
map("i", "jk", "<ESC>", { desc = "jk to esc", noremap = true })

-- Quit Neovim
map("n", "<leader>q", ":q<cr>", { desc = "Quit Neovim", remap = true })

-- Increment/decrement
map("n", "+", "<C-a>", { desc = "Increment numbers", noremap = true })
map("n", "-", "<C-x>", { desc = "Decrement numbers", noremap = true })

-- Select all
map("n", "<C-a>", "gg<S-v>G", { desc = "Select all", noremap = true })

-- Indenting
map("v", "<", "<gv", { desc = "Indenting", silent = true, noremap = true })
map("v", ">", ">gv", { desc = "Indenting", silent = true, noremap = true })

-- New tab
map("n", "te", ":tabedit")

-- Split window
map("n", "<leader>sh", ":split<Return><C-w>w", { desc = "splits horizontal", noremap = true })
map("n", "<leader>sv", ":vsplit<Return><C-w>w", { desc = "Split vertical", noremap = true })

-- Navigate vim panes better
map("n", "<A-k>", "<C-w>k", { desc = "Navigate up" })
map("n", "<A-j>", "<C-w>j", { desc = "Navigate down" })
map("n", "<A-h>", "<C-w>h", { desc = "Navigate left" })
map("n", "<A-l>", "<C-w>l", { desc = "Navigate right" })

-- Change 2 split windows from vertical to horizontal or vice versa
map("n", "<leader>th", "<C-w>t<C-w>H", { desc = "Change window splits to horizontal", noremap = true})
map("n", "<leader>tk", "<C-w>t<C-w>K", { desc = "Change window splits to vertical", noremap = true})

-- Resize window
map("n", "<A-S-h>", ":vertical resize -3<CR>", { desc = "Resize left" })
map("n", "<A-S-j>", ":resize +3<CR>", { desc = "Resize down" })
map("n", "<A-S-k>", ":resize -3<CR>", { desc = "Resize up" })
map("n", "<A-S-l>", ":vertical resize +3<CR>", { desc = "Resize right" })

-- Barbar
map("n", "<Tab>", ":BufferNext<CR>", { desc = "Move to next tab", noremap = true })
map("n", "<S-Tab>", ":BufferPrevious<CR>", { desc = "Move to previous tab", noremap = true })
map("n", "<leader>x", ":BufferClose<CR>", { desc = "Buffer close", noremap = true })
map("n", "<leader>X", ":BufferCloseAllButCurrent<CR>", { desc = "Close all buffers except current", noremap = true })
map("n", "<A-p>", ":BufferPin<CR>", { desc = "Pin buffer", noremap = true })
map("n", "<A-.>", ":BufferMoveNext<CR>", { desc = "Move buffer to the right", noremap = true })
map("n", "<A-,>", ":BufferMovePrevious<CR>", { desc = "Move buffer to the left", noremap = true })
map("n", "<A-S-Tab>", ":BufferLast<CR>", { desc = "Toggle last used buffer", noremap = true })
map("n", "<leader>bl", ":BufferCloseBuffersLeft<CR>", { desc = "Close buffers to the left", noremap = true })
map("n", "<leader>bp", ":BufferPick<CR>", { desc = "Pick buffer from menu", noremap = true })


-- Comments
map({"n", "v"}, "<leader>co", ":CommentToggle<cr>", { desc = "CommentToggle", noremap = true })

-- Neotree
map("n", "<leader>b", ":Neotree toggle<CR>", { desc = "Toggle Neotree", noremap = true })
map("n", "<leader>nb", ":Neotree buffers reveal float<CR>", { desc = "Neotree buffers reveal", noremap = true })
map("n", "<leader>e", ":Neotree focus<CR>", { desc = "Focus Neotree", noremap = true })
map("n", "<leader>o", ":wincmd p<CR>", { desc = "Focus current file", noremap = true })
map("n", "<leader>t", ":Neotree toggle<CR>:wincmd p<CR>", { desc = "Toggle Neotree focus", noremap = true })
map("n", "<A-e>", "<cmd>Neotree reveal<CR>", { desc = "Neo-tree: Focus/Reveal current file", silent = true })

-- Telescope
map("n", "<leader><leader>", "<cmd>Telescope find_files<cr>", { desc = "Telescope find_files", noremap = true })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Telescope live_grep", noremap = true })
map("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Telescope oldfiles", noremap = true })
map("n", "<C-p>", "<cmd>Telescope buffers<cr>", { desc = "Telescope buffers", noremap = true })
map("n", "<leader>ss", "<cmd>AutoSession save<cr>", { desc = "Save Session", noremap = true })
map("n", "<leader>sl", "<cmd>Telescope session-lens search_session<cr>", { desc = "List Sessions", noremap = true })
map("n", "<leader>sd", "<cmd>!rm -f ~/.local/share/nvim/sessions/*.vim<cr>", { desc = "Delete Sessions", noremap = true })-- para elminar la sesion presiono ctrl + d

-- Spectre
map('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', { desc = "Toggle Spectre", noremap = true })
map('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', { desc = "Spectre Search current word", noremap = true })
map('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', { desc = "Search current word", noremap = true })
map('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', { desc = "Search on current file", noremap = true})


-- Scratch buffer (temporal, toggle)
map("n", "<leader>sc", function()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.b[buf].is_scratch then
      vim.api.nvim_set_current_buf(buf)
      return
    end
  end
  vim.cmd("enew")
  vim.bo.buftype = "nofile"
  vim.bo.bufhidden = "hide"
  vim.bo.swapfile = false
  vim.bo.filetype = "markdown"
  vim.b.is_scratch = true
end, { desc = "Toggle scratch buffer", noremap = true })

-- Wrap lines con caracter personalizado
map("v", "<leader>ql", function()
  local char = vim.fn.input("Wrap con: ")
  if char == "" then return end
  local start_line = vim.fn.line("'<")
  local end_line = vim.fn.line("'>")
  for i = start_line, end_line do
    local line = vim.fn.getline(i)
    if line ~= "" then
      vim.fn.setline(i, char .. line .. char .. ",")
    end
  end
end, { desc = "Wrap lines with char", noremap = true })

map("n", "<leader>zc", "zc", { desc = "Collapse section", noremap = true })
map("n", "<leader>zo", "zo", { desc = "Expand section", noremap = true })
map("n", "<leader>zM", "zM", { desc = "Collapse all", noremap = true })
map("n", "<leader>zR", "zR", { desc = "Expand all", noremap = true })

