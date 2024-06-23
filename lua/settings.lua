vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.swapfile = false
opt.ignorecase = true
opt.cursorline = true
opt.termguicolors = true
opt.tabstop = 2
opt.expandtab = true
opt.shiftwidth = 2
opt.guicursor = "a:ver100"
opt.clipboard = "unnamedplus"

vim.wo.relativenumber = true
vim.g.mapleader = " "


