local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	-- telescope
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use("kyazdani42/nvim-web-devicons") -- adds icons to telescope

	-- theme
	use({ "catppuccin/nvim", as = "catppuccin" })

	-- treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("nvim-treesitter/playground")
	use("JoosepAlviste/nvim-ts-context-commentstring") -- Change comment string (For React)
	use("nvim-treesitter/nvim-treesitter-textobjects") -- add additional text objects

	-- harpoon
	use("ThePrimeagen/harpoon")

	-- undotree
	use("mbbill/undotree")

	-- git
	use("tpope/vim-fugitive")
	-- use("lewis6991/gitsigns.nvim")

	-- lsp
	use({
		"williamboman/mason.nvim",
		requires = {
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "jose-elias-alvarez/typescript.nvim" },
		},
	})

	-- Autocompletion
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-cmdline" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },

			-- Snippets
			{ "L3MON4D3/LuaSnip", tag = "v1.2.1", run = "make install_jsregexp" },
			{ "rafamadriz/friendly-snippets" },

			-- Adds pictograms
			{ "onsails/lspkind.nvim" },
		},
	})

	-- formatter and linter
	use("jose-elias-alvarez/null-ls.nvim")

	-- Highlight under cursor
	use("RRethy/vim-illuminate")

	-- comments
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	-- motion plugin
	use("ggandor/leap.nvim")

	-- autopairs
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")

	-- surround
	use({
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	})

	-- statusline
	use("nvim-lualine/lualine.nvim")

	-- manages nohl in a smart way
	-- use("haya14busa/is.vim")

	-- improve search
	use("kevinhwang91/nvim-hlslens")

	-- ui enhancements to input and select
	use("stevearc/dressing.nvim")

	-- markdown preview with :Glow
	use({ "toppair/peek.nvim", run = "deno task --quiet build:fast" })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		print("==================================")
		print("    Plugins are being installed")
		print("    Wait until Packer completes,")
		print("       then restart nvim")
		print("==================================")
		require("packer").sync()
	end
end)
