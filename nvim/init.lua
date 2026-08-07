-- enable faster startup by caching compiled Lua modules
vim.loader.enable()
vim.g.mapleader = ' '
vim.g.localloader = ' '
require 'options'
require 'keymaps'
require 'plugins'
require 'statusline'
