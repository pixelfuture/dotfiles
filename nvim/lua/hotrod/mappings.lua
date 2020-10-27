local vim = _G.vim
local remap = vim.api.nvim_set_keymap
local options = {noremap = true, silent = true}

-- mapleader
vim.g.mapleader = " "

-- general
remap("n", "Q", "gq", options)
remap("n", "H", "^", options)
remap("n", "L", "$", options)
remap("n", "Y", "y$", options)

-- better j/k
remap("n", "j", "gj", options)
remap("n", "k", "gk", options)

-- leader
remap("n", "<Leader>;", ":", {noremap = true})
remap("n", "<Leader>q", ":quit<CR>", {noremap = true})
remap("n", "<Leader>s", ":update<CR>", {noremap = true})
remap("n", "<Leader>r", ":source $MYVIMRC<CR>", {noremap = true})
remap("n", "<Leader>R", ":luafile %<CR>", {noremap = true})

-- edit
remap("n", "<Leader>ev", ":e ~/.config/nvim<CR>", {noremap = true})
remap("n", "<Leader>ep", ":e ~/standup.md<CR>", {noremap = true})
remap("n", "<Leader>ez", ":e ~/.zshrc<CR>", {noremap = true})

-- window management
remap("n", "<M-h>", "<cmd>lua win_move('h')<CR>", options)
remap("n", "<M-j>", "<cmd>lua win_move('j')<CR>", options)
remap("n", "<M-k>", "<cmd>lua win_move('k')<CR>", options)
remap("n", "<M-l>", "<cmd>lua win_move('l')<CR>", options)
remap("n", "<Leader>ww", "<C-w>w", options)
remap("n", "<Leader>wo", "<C-w>o", options)
remap("n", "<Leader>wh", "<C-w>h", options)
remap("n", "<Leader>wj", "<C-w>j", options)
remap("n", "<Leader>wk", "<C-w>k", options)
remap("n", "<Leader>wl", "<C-w>l", options)
remap("n", "<Leader>w=", "<C-w>=", options)
remap("n", "<Leader>wt", "<C-w>T", options)
remap("n", "<Leader>wv", "<C-w>v", options)
remap("n", "<Leader>ws", "<C-w>s", options)
remap("n", "<Leader>w,", "20<C-w><", options)
remap("n", "<Leader>w.", "20<C-w>>", options)
remap("n", "<Leader>w\\", "<C-w>|", options)

-- terminal 
remap("t", "<Esc>", [[<C-\><C-n>]], options)

-- format buffer
remap("n", "<F5>", "mzgggqG`z", {noremap = true})

-- FZF
remap("n", "<Leader>ff", ":Files<CR>", {noremap = true}) -- search files
remap("n", "<Leader>fb", ":Buffers<CR>", {noremap = true}) -- search for buffer
remap("n", "<Leader>fz", ":BLines<CR>", {noremap = true}) -- search current buffer lines
remap("n", "<Leader>fl", ":Lines<CR>", {noremap = true}) -- search all buffer lines
remap("n", "<Leader>fw", ":Rg<Space><C-r><C-w><CR>", {noremap = true}) -- grep work under cursor
remap("n", "<Leader>fa", ":Rg<Space>", {noremap = true}) -- grep project
remap("n", "<Leader>f'", ":Marks<CR>", {noremap = true}) -- list marks
remap("n", "<Leader>fh", ":Helptags!<CR>", {noremap = true}) -- searches all help docs
remap("n", "<Leader>fc", ":Colors<CR>", {noremap = true}) -- color schemes
remap("n", "<Leader>fC", ":Commands<CR>", {noremap = true}) -- search commands
remap("n", "<Leader>fM", ":Maps<CR>", {noremap = true}) -- normal mode mappings
remap("n", "<Leader>ft", ":Tags<CR>", {noremap = true}) -- normal mode mappings
remap("n", "<Leader>gs", ":GFiles?<CR>", {noremap = true}) -- git modified files
remap("n", "<Leader>gb", ":GBranch<CR>", {noremap = true}) -- git modified files
remap("n", "<Leader>gc", ":BCommits<CR>", {noremap = true}) -- git commits for current buffer
remap("n", "<Leader>gC", ":Commits<CR>", {noremap = true}) -- git commits
remap("n", "<Leader>fo", ":History<CR>", {noremap = true}) -- search oldfiles and open buffers
remap("n", "<Leader>fH", ":History:<CR>", {noremap = true}) -- search command history
remap("n", "<Leader>en", "<cmd>EditNeovim<CR>", {noremap = true}) -- search neovim config
remap("n", "<Leader>es", "<cmd>EditScripts<CR>", {noremap = true}) -- search scripts dir

-- COC
remap("n", "[g", "<Plug>(coc-diagnostic-prev)", {noremap = true}) -- search neovim config
remap("n", "]g", "<Plug>(coc-diagnostic-next)", {noremap = true}) -- search scripts dir
