print("Hello from init.lua!")

vim.cmd("set expandtab")
vim.cmd("set tabstop=1")
vim.cmd("set softtabstop=1")
vim.cmd("set shiftwidth=1")
vim.g.mapleader = " "

require("config.lazy")
