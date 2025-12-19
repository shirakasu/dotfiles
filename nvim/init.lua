-- Set the leader key
vim.g.mapleader = ' '

-- Enable line numbers
vim.wo.number = true
vim.o.relativenumber = true

-- Basic settings
vim.o.syntax = 'on'

-- Sync Register and System Clipboard
vim.opt.clipboard:append({ "unnamedplus" })

require("config.lazy")
require("config.lsp")

-- setup key bindings
local key = vim.api.nvim_set_keymap

key('i', 'jj', '<ESC>', { noremap = true, silent = true })

key('n', '<S-k>', '10k', { noremap = true, silent = true })
key('n', '<S-j>', '10j', { noremap = true, silent = true })
key('n', '<S-h>', '^', { noremap = true, silent = true })
key('n', '<S-l>', '$', { noremap = true, silent = true })

key('n', '<Leader>h', '<C-w>s', { noremap = true, silent = true })
key('n', '<Leader>v', '<C-w>v', { noremap = true, silent = true })

key('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
key('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
key('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
key('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

key('n', ';', ':', { noremap = true, silent = true })

key('', '<up>', '<nop>', { noremap = true, silent = true })
key('', '<down>', '<nop>', { noremap = true, silent = true })
key('', '<left>', '<nop>', { noremap = true, silent = true })
key('', '<right>', '<nop>', { noremap = true, silent = true })

key('n', '<Leader>s', ':w<CR>', { noremap = true, silent = true })
key('n', '<Leader>q', ':q!<CR>', { noremap = true, silent = true })

-- NvimTree
key('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
key('n', '<Leader>f', ':NvimTreeRefresh<CR>', { noremap = true, silent = true })
key('n', '<Leader>n', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
