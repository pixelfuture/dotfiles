local remap = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }

-- mapleader
vim.g.mapleader = " "

-- general
remap('n', 'Q', 'gq', options)
remap('n', 'H', '^', options)
remap('n', 'L', '$', options)
remap('n', 'Y', 'y$', options)

-- better j/k
remap('n', 'j', 'gj', options)
remap('n', 'k', 'gk', options)

-- leader
remap('n', '<Leader>;', ':', { noremap = true })
remap('n', '<Leader>q', ':quit<CR>', { noremap = true })
remap('n', '<Leader>s', ':update<CR>', { noremap = true })
remap('n', '<Leader>r', ':source $MYVIMRC<CR>', { noremap = true })
remap('n', '<Leader>R', ':luafile %<CR>', { noremap = true })

-- edit
remap('n', '<Leader>ev', ':e ~/.config/nvim<CR>', { noremap = true })
remap('n', '<Leader>ep', ':e ~/standup.md<CR>', { noremap = true })
remap('n', '<Leader>ez', ':e ~/.zshrc<CR>', { noremap = true })

-- windows management
remap('n', '<M-h>', '<C-w>h', options)
remap('n', '<M-j>', '<C-w>j', options)
remap('n', '<M-k>', '<C-w>k', options)
remap('n', '<M-l>', '<C-w>l', options)
remap('n', '<Leader>ww', '<C-w>w', options)
remap('n', '<Leader>wh', '<C-w>h', options)
remap('n', '<Leader>wj', '<C-w>j', options)
remap('n', '<Leader>wk', '<C-w>k', options)
remap('n', '<Leader>wl', '<C-w>l', options)
remap('n', '<Leader>w=', '<C-w>=', options)
remap('n', '<Leader>wt', '<C-w>T', options)
remap('n', '<Leader>wv', '<C-w>v', options)
remap('n', '<Leader>ws', '<C-w>s', options)
remap('n', '<Leader>w<', '20<C-w><', options)
remap('n', '<Leader>w-', '20<C-w>>', options)
remap('n', '<Leader>w\\', '<C-w>|', options)

-- terminal (TODO: How do you map this in lua)
remap('t', '<Esc>', [[<C-\><C-n>]], options) 

