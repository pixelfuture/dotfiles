-- clone packer if missing
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.api.nvim_exec(
  [[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]],
  false
)

local use = require('packer').use
require('packer').startup(function()
  -- LSP
	use({
		-- Autocomplete
		"hrsh7th/nvim-cmp",
		requires = {
			"neovim/nvim-lspconfig",
			"nvim-lua/lsp-status.nvim",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"ray-x/lsp_signature.nvim",
			"williamboman/nvim-lsp-installer",
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
			"onsails/lspkind-nvim",
			"kosayoda/nvim-lightbulb",
			"weilbith/nvim-code-action-menu",
      "RRethy/vim-illuminate",
		},
		config = function()
			require("config.lsp")
			require("config.lsp_cmp")
			vim.cmd([[autocmd CursorHold,CursorHoldI * lua require("nvim-lightbulb").update_lightbulb()]])
		end,
	})
  use 'dense-analysis/ale' -- prettier
  use 'ggandor/lightspeed.nvim' -- sneak-like navigation
  use 'wbthomason/packer.nvim' -- package manager
  use 'haishanh/night-owl.vim' -- night owl theme
  use 'justinmk/vim-dirvish' -- navigation
  use 'mhinz/vim-signify' -- git diff sybmols in the gutter
  use 'lukas-reineke/indent-blankline.nvim' -- display vertical lines at each indentation
  use 'tpope/vim-fugitive' -- git commands in nvim
  use 'tpope/vim-rhubarb' -- Gbrowse opens Github URLs
  use 'tpope/vim-commentary' -- "gc" to comment visual regions/lines
  use 'tpope/vim-eunuch' -- Move, Delete, Rename, Mkdir, Chmod, SudoWrite
  use 'tpope/vim-unimpaired' -- easy navigation pairs like [q for quickfix window
  use 'tpope/vim-repeat' -- helps repeat actions for stuff (not sure if I need this)
  use 'tpope/vim-surround' -- replace HTML tags, surround items with brackets, braces other tags
  use 'nvim-treesitter/nvim-treesitter' -- treesitter
  use 'nvim-treesitter/nvim-treesitter-textobjects' -- Additional textobjects for treesitter
  use 'JoosepAlviste/nvim-ts-context-commentstring' -- Change comment string (For React)
  use({
		-- Auto close brackets etc (with treesitter support)
		"windwp/nvim-autopairs",
		after = { "nvim-cmp" },
		config = function()
			require("nvim-autopairs").setup({ check_ts = true })
			require("nvim-autopairs.completion.cmp").setup({
				map_cr = true,
				map_complete = true,
				auto_select = false,
			})
		end,
	})
  -- colors for CSS hashes
  use {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require'colorizer'.setup()
    end
  }
  -- Smooth scrolling
  use {
    "karb94/neoscroll.nvim",
    config = function()
      require('neoscroll').setup()
    end
  }
  -- highlights unique characters in a line to use "f" or "F" commands
  -- use 'unblevable/quick-scope'
  -- UI to select things (files, grep results, open buffers...)
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons',
    },
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  -- which key
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup{}
    end
  }
end)
