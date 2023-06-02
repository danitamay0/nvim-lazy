--Nvim APLI aliases

local cmd = vim.cmd
local exect = vim.api.nvim_exec
local fn = vim.fn
local g = vim.g
local opt = vim.opt

-- General

g.mapleader = " "


-- UI
opt.number = true
opt.mouse = "a"
opt.numberwidth=1
opt.clipboard="unnamed"
-- syntax enable
opt.showcmd = true
opt.encoding="utf-8"
opt.showmatch = true
opt.relativenumber = true
opt.laststatus=2
-- opt.noshowmode = true
-- opt.laststatus = true
