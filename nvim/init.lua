-- Leader key -> " "  spacebar
--
-- In general, it's a good idea to set this early in your config, because otherwise
-- if you have any mappings you set BEFORE doing this, they will be set to the OLD
-- leader.
-- vim.g.mapleader = "<space>"
vim.g.mapleader = " "

-- load plugins
require "hotrod.plugins"

-- Neovim options
require'hotrod.options'

-- LSP config
require'hotrod.lsp'

-- Telescope config
require'hotrod.telescope'
require'hotrod.telescope.mappings'

-- Treesitter config
require'hotrod.treesitter'

-- Apply mappings
require'hotrod.mappings'.setup()

-- Run autocmds
require'hotrod.autocmd'.setup()

-- Create statusline
require'hotrod.statusline'

-- Load Colorizer
require'colorizer'.setup()

-- Configure indentline
require'hotrod.indentline'

-- Add theme and highlights
require'hotrod.nightowl'

-- Configure signify
require'hotrod.signify'

-- Configure emmet
require'hotrod.emmet'

-- Load Smooth Scroll
require('neoscroll').setup()

-- configure harpoon
require'hotrod.harpoon'

-- configure git-worktree
require'hotrod.git-worktree'

-- load autopairs
require('nvim-autopairs').setup({
  disable_filetype = { "TelescopePrompt" , "vim" },
})
require'hotrod.npairs'
