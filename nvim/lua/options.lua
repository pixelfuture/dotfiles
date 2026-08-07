-- Display line numbers
vim.o.number = true
-- o.relativenumber = true

-- Use mouse
vim.o.mouse = 'a'

-- The status line already shows the mode
vim.o.showmode = false

-- Enable OS clipboard
vim.schedule(function() vim.o.clipboard = 'unnamedplus' end)

-- Enable break indent
vim.o.breakindent = true

-- Enables undo/redo even after file is closed
vim.o.undofile = true

-- Set case-insensitive search UNLESS \C or one or more captial letter in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'

-- :help updatetime
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Display whitespace characters in the editor
vim.o.list = true
vim.opt.listchars = {
  tab = '│ ',
  trail = '·',
  nbsp = '␣',
}

-- Preview substitutions live, as you type
vim.o.inccommand = 'split'

-- Show which line your cursor is on
vim.o.cursorline = true

-- Raise a dialog box asking if you wish to save the current file(s) when closing
vim.o.confirm = true

-- Title of window set to value of 'titlestring'
vim.o.title = true

-- No wrap
vim.o.wrap = false

-- rounded borders
vim.o.winborder = 'rounded'

vim.o.cmdheight = 0

-- Indent by 2 spaces
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.expandtab = true

-- Disables swap file
vim.o.swapfile = false
