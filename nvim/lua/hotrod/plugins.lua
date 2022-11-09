vim.cmd [[packadd packer.nvim]]
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim' -- useful lua functions
  use 'haya14busa/is.vim' -- manages nohl in a smart way
  use 'lukas-reineke/indent-blankline.nvim' -- display vertical lines at each indentation
  use 'tpope/vim-eunuch' -- Move, Delete, Rename, Mkdir, Chmod, SudoWrite
  use 'tpope/vim-unimpaired' -- easy navigation pairs like [q for quickfix window
  use 'tpope/vim-repeat' -- helps repeat actions for stuff (not sure if I need this)
  use 'kylechui/nvim-surround' -- surround selections stylishly
  use 'justinmk/vim-dirvish' -- navigation
  use "karb94/neoscroll.nvim"

  -- colorschemes
  use 'haishanh/night-owl.vim'
  use 'folke/tokyonight.nvim'
  use 'catppuccin/nvim'

  -- completion
  use "hrsh7th/nvim-cmp"
  use	"hrsh7th/cmp-path"
	use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-cmdline"
  use	"hrsh7th/cmp-nvim-lua"
  use "saadparwaiz1/cmp_luasnip"
  use "onsails/lspkind-nvim"

  -- luasnip
  use "L3MON4D3/LuaSnip"
	use	"rafamadriz/friendly-snippets"

  -- Language Server Manager
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"

  -- LSP
  use "neovim/nvim-lspconfig"
  use "hrsh7th/cmp-nvim-lsp" -- allows nvim-cmp to use lsp
  use "jose-elias-alvarez/null-ls.nvim" --formatters and linters
  use { "glepnir/lspsaga.nvim", branch = "main" } --formatters and linters
  use "j-hui/fidget.nvim" -- lsp status in floating window
  use "antoinemadec/FixCursorHold.nvim" -- fix recommended by nvim-lightbulb

  -- Highlight under cursor
  use "RRethy/vim-illuminate"

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use "kyazdani42/nvim-web-devicons" -- adds icons to telescope

  -- Treesitter
  use "nvim-treesitter/nvim-treesitter"
  use {"nvim-telescope/telescope-fzf-native.nvim", run = "make" }
  use 'JoosepAlviste/nvim-ts-context-commentstring' -- Change comment string (For React)
  use "SmiteshP/nvim-navic" -- lsp statusline/winbar

  -- comment
  use "numToStr/Comment.nvim"
  use "Djancyp/better-comments.nvim"

  -- autopairs
  use "windwp/nvim-autopairs"
  use "windwp/nvim-ts-autotag"

  -- git
  use 'tpope/vim-fugitive' -- git commands in nvim
  use 'tpope/vim-rhubarb' -- Gbrowse opens Github URLs
  use "lewis6991/gitsigns.nvim" -- show git status in gutter

  -- maximize current window with Leader-z
  use "declancm/maximize.nvim"

  -- color highlighter
  use "NvChad/nvim-colorizer.lua"

  -- statusline
  use "feline-nvim/feline.nvim"

  -- motion plugin
  use "ggandor/leap.nvim"

  -- rerize windows
  use 'dimfred/resize-mode.nvim'

  -- greeter screen | has potential. have to learn how to customize it
  -- use "goolord/alpha-nvim"
end)
