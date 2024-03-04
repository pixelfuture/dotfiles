local status, cmp = pcall(require, "cmp")
if not status then
	return
end

local status2, lspkind = pcall(require, "lspkind")
if not status2 then
	return
end

local status3, luasnip = pcall(require, "luasnip")
if not status3 then
	return
end

local config = {
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	formatting = {
		format = lspkind.cmp_format({
			-- mode = "symbol_text",
			mode = "symbol",
			maxwidth = 50,
			menu = {
				buffer = "[Buf]",
				nvim_lsp = "[LSP]",
				luasnip = "[Snip]",
				nvim_lua = "[Lua]",
				path = "[Path]",
			},
			ellipsis_char = "...",
			preset = "codicons",
			symbol_map = {
				Text = "󰉿",
				Method = "󰆧",
				Function = "󰊕",
				Constructor = "",
				Field = "󰜢",
				Variable = "󰀫",
				Class = "󰠱",
				Interface = "",
				Module = "",
				Property = "󰜢",
				Unit = "󰑭",
				Value = "󰎠",
				Enum = "",
				Keyword = "󰌋",
				Snippet = "",
				Color = "󰏘",
				File = "󰈙",
				Reference = "󰈇",
				Folder = "󰉋",
				EnumMember = "",
				Constant = "󰏿",
				Struct = "󰙅",
				Event = "",
				Operator = "󰆕",
				TypeParameter = "",
			},
		}),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<Down>"] = cmp.mapping.select_next_item(),
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<Up>"] = cmp.mapping.select_next_item(),
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
	}, {
		{ name = "buffer" },
	}),
	view = {
		entries = { name = "custom", selection_order = "near_cursor" },
		-- entries = { name = 'native', selection_order = 'near_cursor' }, -- I don't notice a difference
		-- entries = { name = 'wildmenu', separator = ' | ' }, -- weird but it can work
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	experimental = {
		ghost_text = true, -- you can see the completion text before hitting enter
	},
}
cmp.setup(config)

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
