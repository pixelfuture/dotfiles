local o = vim.opt
-- relative numbers
o.number = true
o.relativenumber = true

-- clipboard
o.clipboard = "unnamedplus"

-- indent
o.shiftwidth = 2
o.tabstop = 2
o.softtabstop = 2
o.expandtab = true

-- swap and undo files
o.swapfile = false
o.undofile = true

-- search config
o.ignorecase = true
o.smartcase = true
o.path = "src/**,tests/**"

-- always show sign column. less jerking
o.signcolumn = "yes"

-- splits setting
o.splitright = true
o.splitbelow = true

-- folding https://www.jackfranklin.co.uk/blog/code-folding-in-vim-neovim/
o.foldlevel = 99
o.foldnestmax = 4
-- o.foldlevelstart = 1
o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
o.foldtext = "" -- uses treesitter to highlight folded text
o.foldmethod = "expr"

-- highlight current line
o.cursorline = true

-- global status line across all splits
o.laststatus = 3

-- global status line across all splits
o.wrap = false

-- scroll offset
o.scrolloff = 2
o.sidescrolloff = 8

-- title of window set to value of 'titlestring'
o.title = true

-- substitute command shows a split
o.inccommand = "split"

-- increase update time
o.updatetime = 100

o.background = "dark"

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- netrw config
local g = vim.g
g.netrw_browse_split = 0
g.netrw_banner = 0
g.netrw_silent = 1
g.netrw_fastbrowse = 0
