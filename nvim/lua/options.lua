local o = vim.o

-- Display line numbers
o.number = true
-- o.relativenumber = true

-- Use mouse
o.mouse = 'a'

-- Indent by 2 spaces
o.shiftwidth = 2
o.tabstop = 2
o.softtabstop = 2
o.expandtab = true

-- Don't show the mode, since status line already takes care of that
o.showmode = false

-- Enable OS clipboard
vim.schedule(function() o.clipboard = 'unnamedplus' end)

-- Disables swap file
o.swapfile = false

-- Enables undo/redo even after file is closed
o.undofile = true

-- Set case-insensitive search UNLESS \C or one or more captial letter in the search term
o.ignorecase = true
o.smartcase = true

-- Keep signcolumn on by default
o.signcolumn = 'yes'

-- :help updatetime
o.updatetime = 100

-- Decrease mapped sequence wait time
o.timeoutlen = 300

-- Configure how new splits should be opened
o.splitright = true
o.splitbelow = true

-- Display whitespace characters in the editor
o.list = true
vim.opt.listchars = {
  tab = '│ ',
  trail = '·',
  nbsp = '␣',
}

-- Preview substitutions live, as you type
o.inccommand = 'split'

-- Show which line your cursor is on
o.cursorline = true

-- Raise a dialog box asking if you wish to save the current file(s) when closing
o.confirm = true

-- Title of window set to value of 'titlestring'
o.title = true

-- No wrap
o.wrap = false

-- rounded borders
o.winborder = 'rounded'

o.cmdheight = 0

-- new autocomplete
o.autocomplete = true
o.pumborder = 'rounded'
o.pummaxwidth = 40
o.completeopt = 'menu,menuone,noselect'

-- Previous settings
-- o.scrolloff = 2
-- o.sidescrolloff = 8
-- o.background = dark
-- undercurl
-- vim.cmd([[let &t_Cs = "\e[4:3m"]])
-- vim.cmd([[let &t_Ce = "\e[4:0m"]])
-- o.path = "src/**,tests/**"
