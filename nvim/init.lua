local cmd = vim.cmd
local fn = vim.fn

-- Load options
require'options'

-- Load mappings
require'mappings'.setup()

-- Load autocmd
require'autocmd'.setup()

-- Plugins
cmd 'packadd paq-nvim'
local paq = require('paq-nvim').paq
paq{'savq/paq-nvim', opt=true}
paq {'justinmk/vim-dirvish'}
paq {'tpope/vim-fugitive'}
paq {'tpope/vim-rhubarb'}
paq {'tpope/vim-eunuch'}
paq {'tpope/vim-commentary'}
paq {'tpope/vim-unimpaired'}
paq {'tpope/vim-repeat'}
paq {'tpope/vim-surround'}
paq {'suy/vim-context-commentstring'}
paq {'mhinz/vim-signify'}
paq {'haishanh/night-owl.vim'}
paq {'Yggdroot/indentline'}
paq {'nvim-treesitter/nvim-treesitter', hook = ':TSUpdate'}
paq {'neovim/nvim-lspconfig'}
paq {'nvim-lua/completion-nvim'}
paq {'styled-components/vim-styled-components', branch = 'main'}
paq {'norcalli/nvim-colorizer.lua'}
paq {'junegunn/fzf', hook = fn['fzf#install']}
paq {'junegunn/fzf.vim'}
paq {'unblevable/quick-scope'}

-- Plugins Setup
require'plugins/colorizer'
require'plugins/fzf'
require'plugins/indentline'
require'plugins/help' -- opens help in new tab
require'plugins/lspconfig'
require'plugins/nightowl'
require'plugins/signify'
require'plugins/statusline'
require'plugins/terminal'
require'plugins/treesitter'
require'plugins/yankhighlight'

