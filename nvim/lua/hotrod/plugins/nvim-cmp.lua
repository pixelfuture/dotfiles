return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer", -- buffer word completion
		"hrsh7th/cmp-nvim-lsp", -- LSP completion
		"hrsh7th/cmp-cmdline", -- adds completion to command line and search
		"hrsh7th/cmp-path", -- adds path completion

		-- Snippets
		"saadparwaiz1/cmp_luasnip",
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			build = "make install_jsregexp",
		},
		"rafamadriz/friendly-snippets",

		-- Adds pictograms
		"onsails/lspkind.nvim",
		"kyazdani42/nvim-web-devicons",
	},
	config = function()
		local cmp = require("cmp")
		local lspkind = require("lspkind")
		local luasnip = require("luasnip")

		-- load snippets
		require("luasnip.loaders.from_vscode").lazy_load()
		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			formatting = {
				format = lspkind.cmp_format({
					maxwidth = 50,
					menu = {
						buffer = "[Buf]",
						nvim_lsp = "[LSP]",
						luasnip = "[Snip]",
						nvim_lua = "[Lua]",
						path = "[Path]",
					},
					ellipsis_char = "...",
					-- before = function (_, vim_item)
					--   return vim_item
					-- end
				}),
			},
			mapping = cmp.mapping.preset.insert({
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<C-d>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_locally_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{
					name = "luasnip",
					entry_filter = function()
						local context = require("cmp.config.context")
						return not context.in_treesitter_capture("string") and not context.in_syntax_group("String")
					end,
				},
				{ name = "emoji" },
			}, {
				{ name = "buffer" },
			}),
			view = {
				entries = { name = "custom", selection_order = "near_cursor" },
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			experimental = {
				ghost_text = true, -- you can see the completion text before hitting enter
			},
		})
		local cmdline_config_search = {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		}
		cmp.setup.cmdline({ "/", "?" }, cmdline_config_search)

		local cmdline_config_command = {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),
		}
		cmp.setup.cmdline(":", cmdline_config_command)
	end,
}
