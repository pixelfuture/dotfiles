return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local keymap = vim.keymap
		local builtin = require("telescope.builtin")
		local border = {
			{ "╭", "FloatBorder" },
			{ "─", "FloatBorder" },
			{ "╮", "FloatBorder" },
			{ "│", "FloatBorder" },
			{ "╯", "FloatBorder" },
			{ "─", "FloatBorder" },
			{ "╰", "FloatBorder" },
			{ "│", "FloatBorder" },
		}
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				vim.api.nvim_buf_create_user_command(ev.buf, "Format", function(_)
					vim.lsp.buf.format()
				end, { desc = "Format current buffer with LSP" })
				local imap = function(keys, func, desc)
					if desc then
						desc = "LSP: " .. desc
					end
					keymap.set("i", keys, func, { buffer = ev.buf, desc = desc })
				end
				local nmap = function(keys, func, desc)
					if desc then
						desc = "LSP: " .. desc
					end
					keymap.set("n", keys, func, { buffer = ev.buf, desc = desc })
				end
				nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
				-- nmap("gi", builtin.lsp_implementations, "[G]oto [I]mplementation")
				nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Help")
				imap("<C-k>", vim.lsp.buf.signature_help, "Signature Help")
				nmap("gD", function()
					vim.fn.searchdecl(vim.fn.expand("<cword>"))
				end, "[G]oto local [D]eclaration")
				nmap("<Leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
				nmap("<Leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
				nmap("gr", builtin.lsp_references, "[G]oto [R]eferences")
				nmap("<Leader>i", function()
					vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
				end, "Enable [i]nlay hints")
				local client = vim.lsp.get_client_by_id(ev.data.client_id)
				if client.server_capabilities.documentHighlightProvider then
					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						buffer = ev.buf,
						callback = vim.lsp.buf.document_highlight,
					})
					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						buffer = ev.buf,
						callback = vim.lsp.buf.clear_references,
					})
				end
			end,
		})

		local capabilities = cmp_nvim_lsp.default_capabilities()
		local handlers = {
			["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
			["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
		}
		local on_attach = function(client, bufnr)
			-- if client.server_capabilities.inlayHintProvider then
			-- vim.lsp.inlay_hint.enable(true)
			-- end
		end

		lspconfig.tsserver.setup({
			handlers = handlers,
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				typescript = {
					inlayHints = {
						includeInlayParameterNameHints = "all",
						includeInlayParameterNameHintsWhenArgumentMatchesName = true,
						includeInlayFunctionParameterTypeHints = true,
						includeInlayVariableTypeHints = true,
						includeInlayVariableTypeHintsWhenTypeMatchesName = true,
						includeInlayPropertyDeclarationTypeHints = true,
						includeInlayFunctionLikeReturnTypeHints = true,
						includeInlayEnumMemberValueHints = true,
					},
				},
				javascript = {
					inlayHints = {
						includeInlayParameterNameHints = "all",
						includeInlayParameterNameHintsWhenArgumentMatchesName = true,
						includeInlayFunctionParameterTypeHints = true,
						includeInlayVariableTypeHints = true,
						includeInlayVariableTypeHintsWhenTypeMatchesName = true,
						includeInlayPropertyDeclarationTypeHints = true,
						includeInlayFunctionLikeReturnTypeHints = true,
						includeInlayEnumMemberValueHints = true,
					},
				},
			},
		})

		lspconfig.cssls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig.html.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig.jsonls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig.rust_analyzer.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig.eslint.setup({
			capabilities = capabilities,
			on_attach = function(client, bufnr)
				vim.api.nvim_create_autocmd("BufWritePre", {
					buffer = bufnr,
					command = "EslintFixAll",
				})
			end,
		})

		-- lspconfig.lua_ls.setup({
		-- 	capabilities = capabilities,
		-- 	on_attach = on_attach,
		-- 	on_init = function(client)
		-- 		client.config.settings = vim.tbl_deep_extend("force", client.config.settings, {
		-- 			Lua = {
		-- 				runtime = {
		-- 					-- Tell the language server which version of Lua you're using
		-- 					-- (most likely LuaJIT in the case of Neovim)
		-- 					version = "LuaJIT",
		-- 				},
		-- 				-- Make the server aware of Neovim runtime files
		-- 				workspace = {
		-- 					checkThirdParty = false,
		-- 					library = {
		-- 						vim.env.VIMRUNTIME,
		-- 						-- "${3rd}/luv/library"
		-- 						-- "${3rd}/busted/library",
		-- 					},
		-- 					-- or pull in all of 'runtimepath'. NOTE: this is a lot slower
		-- 					-- library = vim.api.nvim_get_runtime_file("", true)
		-- 				},
		-- 			},
		-- 		})
		--
		-- 		client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
		-- 		return true
		-- 	end,
		-- })
	end,
}
