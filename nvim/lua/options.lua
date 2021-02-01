local g = vim.g
local o = vim.o
local wo = vim.wo
local cmd = vim.cmd

-- Essentials
o.termguicolors = true

-- Behaviors
wo.number         = true                        -- show number on current line
wo.relativenumber = true                        -- relative numbers for easier navigation
wo.cursorline     = true                        -- highlight current line
wo.signcolumn     = 'yes'                       -- sign column always open
o.completeopt     = 'menuone,noinsert,noselect' -- no preview Scratch window during completion
o.swapfile        = false                       -- swap files annoy me
o.inccommand      = 'split'                     -- preview %s commands in a split window as I type
o.hidden          = true                        -- move away from unsaved buffers
o.updatetime      = 100                         -- stop typing quickly
o.undofile        = true                        -- keep track of my 'undo's between sessions
o.mouse           = 'a'                         -- use mouse
o.clipboard       = 'unnamed'                   -- use clipboard

-- Look and Feel
o.scrolloff       = 3                           -- scroll offset
o.sidescrolloff   = 15                          -- side scroll offset
o.sidescrolloff   = 15                          -- side scroll offset
o.fillchars       = 'vert:│'                    -- vertical line
o.foldlevelstart  = 99                          -- all folds open
o.splitright      = true                        -- vsplit to the right
o.splitbelow      = true                        -- split to the bottom
wo.wrap           = false                       -- no wrap
o.pumheight       = 10                          -- maximum 10 lines in popup menu
o.shiftwidth      = 2                           -- number of spaces to indent
o.tabstop         = 2                           -- number of spaces to indent with <Tab>
o.softtabstop     = 2                           -- number of spaces to indent with <Tab> or <BS>
o.smartindent     = true                        -- better indentation
o.expandtab       = true                        -- use spaces (not tabs)
o.shortmess       = 'aoOtTIc'                   -- customize shortmess

-- Searching
cmd[[set path=src/**,tests/**]]                 -- search src and tests root folders
o.suffixesadd     = '.js,.scss'                 -- help resolve gf command
o.ignorecase      = true                        -- case insensitive search
o.smartcase       = true                        -- case sensitivity on when caps used
o.wildignore      = '*/node_modules/*,package-lock.json,*.snap,*/__snapshots__/*'
