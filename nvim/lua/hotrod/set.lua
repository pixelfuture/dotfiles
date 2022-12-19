vim.opt.number = true -- show number on current line
vim.opt.relativenumber = true -- relative numbers for easier navigation

vim.opt.shiftwidth = 2 -- number of spaces to indent
vim.opt.tabstop = 2 -- number of spaces to indent with <Tab>
vim.opt.softtabstop = 2 -- number of spaces to indent with <Tab> or <BS>
vim.opt.expandtab = true -- use spaces (not tabs)

vim.opt.wrap = false -- no wrap

vim.opt.swapfile = false -- swap files annoy me
vim.opt.undofile = true -- keep track of my 'undo's between sessions

vim.opt.ignorecase = true -- case insensitive search
vim.opt.smartcase = true -- case sensitivity on when caps used

vim.opt.clipboard = "unnamedplus" -- access system clipboard

vim.opt.signcolumn = "yes" -- sign column always open

vim.opt.splitright = true -- vsplit to the right
vim.opt.splitbelow = true -- split to the bottom

vim.opt.scrolloff = 3 -- scroll offset
vim.opt.sidescrolloff = 8 -- side scroll offset

vim.opt.foldlevelstart = 99 -- all folds open

vim.opt.cursorline = true -- highlight current line

vim.opt.cmdheight = 0 -- number of screenlines to use for command line
vim.opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
vim.opt.laststatus = 3 -- global statusline

vim.opt.updatetime = 100 -- faster updatetime
