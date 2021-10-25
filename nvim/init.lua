local opt = vim.opt
vim.g.mapleader = " "

-- Essentials
opt.termguicolors = true

-- Behaviors
opt.number         = true                        -- show number on current line
opt.relativenumber = true                        -- relative numbers for easier navigation
opt.cursorline     = true                        -- highlight current line
opt.signcolumn     = 'yes'                       -- sign column always open
opt.completeopt     = 'menuone,noinsert,noselect' -- no preview Scratch window during completion
opt.swapfile        = false                       -- swap files annoy me
opt.inccommand      = 'split'                     -- preview %s commands in a split window as I type
opt.hidden          = true                        -- move away from unsaved buffers
opt.updatetime      = 100                         -- stop typing quickly
opt.undofile        = true                        -- keep track of my 'undo's between sessions
opt.mouse           = 'a'                         -- use mouse
opt.clipboard       = 'unnamed'                   -- use clipboard

-- Look and Feel
opt.scrolloff       = 3                           -- scroll offset
opt.sidescrolloff   = 15                          -- side scroll offset
opt.sidescrolloff   = 15                          -- side scroll offset
opt.fillchars       = 'vert:│'                    -- vertical line
opt.foldlevelstart  = 99                          -- all folds open
opt.splitright      = true                        -- vsplit to the right
opt.splitbelow      = true                        -- split to the bottom
opt.wrap            = false                       -- no wrap
opt.pumheight       = 10                          -- maximum 10 lines in popup menu
opt.pumblend        = 17                          -- transparent popup
opt.shiftwidth      = 2                           -- number of spaces to indent
opt.tabstop         = 2                           -- number of spaces to indent with <Tab>
opt.softtabstop     = 2                           -- number of spaces to indent with <Tab> or <BS>
opt.expandtab       = true                        -- use spaces (not tabs)
opt.shortmess       = 'aoOtTIc'                   -- customize shortmess

-- Searching
vim.cmd[[set path=src/**,tests/**]]                 -- search src and tests root folders
opt.suffixesadd     = '.js,.scss'                 -- help resolve gf command
opt.ignorecase      = true                        -- case insensitive search
opt.smartcase       = true                        -- case sensitivity on when caps used
opt.wildignore      = '*/node_modules/*,package-lock.json,*.snap,*/__snapshots__/*'
opt.wildmode = { "longest", "list", "full" }

-- ale configuration
vim.g.ale_fix_on_save = 1
vim.g.ale_fixers = {
  javascript = { 'prettier' },
  typescript = { 'eslint' },
}

require "plugins"
require'config.nightowl'
require'config.mappings'
require'config.statusline'
require"config.telescope"
require'config.treesitter'
require'config.autocmd'
require'config.indentline'
require'config.signify'

-- load autopairs
-- require('nvim-autopairs').setup({
--   disable_filetype = { "TelescopePrompt" , "vim" },
-- })
-- require'hotrod.npairs'
