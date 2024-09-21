require("config.lazy")

vim.opt.number = true

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.autoindent = true
vim.opt.copyindent = true
vim.opt.expandtab = true
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.cursorline = true

local telescope_builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>t', telescope_builtin.find_files, {})
vim.keymap.set('n', '<leader>b', telescope_builtin.buffers, {})

vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])

vim.cmd('runtime! lua/local/*.lua')
