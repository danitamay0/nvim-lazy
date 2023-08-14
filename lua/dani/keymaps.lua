-- Alieses

local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}
local cmd = vim.cmd


map('', '<up>', '<nop>', {noremap = true})
map('', '<down>', '<nop>', {noremap = true})
map('', '<left>', '<nop>', {noremap = true})
map('', '<right>', '<nop>', {noremap = true})


map('i', '<C-h>', '<left>', default_opts)
map('i', '<C-j>', '<down>', default_opts)
map('i', '<C-k>', '<up>', default_opts)
map('i', '<C-l>', '<right>', default_opts)


map("n", "<leader>w", ":w<CR>", default_opts)
map("n", "<leader>wa", ":wa<CR>", default_opts)
map("n", "<leader>q", ":q<CR>", default_opts)
-- nmap <Leader>wa :wa<CR>
-- nmap <Leader>w :wa<CR>
-- nmap <Leader>q :q<CR>
-- nmap <Leader>tr :tabnew<CR>
--


map('n', '<leader>rt', ':botright vertical terminal<CR>', default_opts)
map('t', '<Esc>', '<C-\\><C-n>', {})
map('n', '<C-j>', '<C-w>j', {noremap = true})
map('n', '<C-k>', '<C-w>k', {noremap = true})
map('n', '<C-h>', '<C-w>h', {noremap = true})
map('n', '<C-l>', '<C-w>l', {noremap = true})
