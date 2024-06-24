-- highlight on yank 😁
vim.api.nvim_create_autocmd("TextYankPost", {
	group = group,
	callback = function()
		vim.highlight.on_yank({ higroup = "Search", timeout = 150, on_visual = false })
	end,
})
