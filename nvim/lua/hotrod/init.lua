require("hotrod.keymap")
require("hotrod.options")

-- install lazy if it does not exist
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	print("here")
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- install all plugins
local status, lazy = pcall(require, "lazy")
if not status then
	return
end

lazy.setup({
	{
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({
				window = {
					border = "single",
				},
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section: https://github.com/folke/which-key.nvim
			})
		end,
	},
	{ "folke/neoconf.nvim", cmd = "Neoconf", lazy = false },
	"folke/neodev.nvim",

	-- theme
	{ "catppuccin/nvim", name = "catppuccin" },

	-- used by many plugins
	"nvim-lua/plenary.nvim",

	-- telescope
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
	},
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	"kyazdani42/nvim-web-devicons",

	-- treesitter
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	"nvim-treesitter/playground",
	"JoosepAlviste/nvim-ts-context-commentstring", -- Change comment string (For React)
	"nvim-treesitter/nvim-treesitter-textobjects", -- add additional text objects

	-- harpoon
	"ThePrimeagen/harpoon",

	-- undotree
	"mbbill/undotree",

	-- git
	"tpope/vim-fugitive",
	"lewis6991/gitsigns.nvim",

	-- lsp
	{
		"williamboman/mason.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"williamboman/mason-lspconfig.nvim",
			"jose-elias-alvarez/typescript.nvim",
		},
	},

	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",

			-- Snippets
			{ "L3MON4D3/LuaSnip", tag = "v1.2.1", build = "make install_jsregexp" },
			"rafamadriz/friendly-snippets",

			-- Adds pictograms
			"onsails/lspkind.nvim",
		},
	},

	-- formatter and linter
	"jose-elias-alvarez/null-ls.nvim",

	-- Highlight under cursor
	"RRethy/vim-illuminate",

	-- comments
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},

	-- motion plugin
	"ggandor/leap.nvim",

	-- autopairs
	"windwp/nvim-autopairs",
	"windwp/nvim-ts-autotag",

	-- surround
	{
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},

	-- statusline
	"nvim-lualine/lualine.nvim",

	-- manages nohl in a smart way
	-- use("haya14busa/is.vim")

	-- improve search
	"kevinhwang91/nvim-hlslens",

	-- ui enhancements to input and select
	"stevearc/dressing.nvim",

	-- markdown preview with :Glow
	{ "toppair/peek.nvim", build = "deno task --quiet build:fast" },

	-- tmux configuration
	"christoomey/vim-tmux-navigator",
	"alanfortlink/blackjack.nvim",
})

require("hotrod.lsp")
