local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
	return
end

vim.api.nvim_create_user_command("LuaSnipEdit", require("luasnip.loaders").edit_snippet_files, {})
