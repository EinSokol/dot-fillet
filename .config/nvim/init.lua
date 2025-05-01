vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "<down>", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("n", "<up>", "gk")

require("config.lazy")

vim.cmd("colorscheme koalight")
--vim.cmd("highlight normal guibg=none")

vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

vim.cmd("set ic")
vim.cmd("set cursorline")
vim.cmd("set number")

vim.cmd("set smoothscroll")
