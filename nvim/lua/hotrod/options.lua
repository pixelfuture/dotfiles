-- Overrides
vim.opt.number = true -- show number on current line
vim.opt.relativenumber = true -- relative numbers for easier navigation

vim.opt.clipboard = "unnamedplus" -- access system clipboard

vim.opt.shiftwidth = 2 -- number of spaces to indent
vim.opt.tabstop = 2 -- number of spaces to indent with <Tab>
vim.opt.softtabstop = 2 -- number of spaces to indent with <Tab> or <BS>
vim.opt.expandtab = true -- use spaces (not tabs)
vim.opt.updatetime = 100 -- faster updatetime

vim.opt.swapfile = false -- swap files annoy me
vim.opt.undofile = true -- keep track of my 'undo's between sessions

vim.opt.ignorecase = true -- case insensitive search
vim.opt.smartcase = true -- case sensitivity on when caps used

vim.opt.signcolumn = "yes" -- sign column always open

vim.opt.splitright = true -- vsplit to the right
vim.opt.splitbelow = true -- split to the bottom

vim.opt.foldlevelstart = 99 -- all folds open

vim.opt.cursorline = true -- highlight current line

vim.opt.laststatus = 3 -- global statusline

vim.opt.path = "src/**,tests/**" -- search src and tests root folders

vim.opt.wrap = false -- no wrap
vim.opt.scrolloff = 3 -- scroll offset
vim.opt.sidescrolloff = 8 -- side scroll offset

-- New
vim.opt.title = true -- the title of the window will be set to the value of 'titlestring'
vim.opt.inccommand = "split" -- split while running :substitute
vim.opt.showmatch = true -- when a bracket is inserted, briefly jump to the matching one
-- vim.opt.pumblend = 10

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])
-- will not work in iTerm 2

-- NVIM Plugin set zone
-- netrw config
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_silent = 1
vim.g.netrw_fastbrowse = 0

-- Currently disabled. Maybe they will make a comeback
-- For more options go to :help options
-- vim.opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
-- vim.opt.updatetime = 100 -- faster updatetime

