local group = vim.api.nvim_create_augroup("GeneralSettings", { clear = true })
-- highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = group,
	callback = function()
		vim.highlight.on_yank({ higroup = "Search", timeout = 150, on_visual = false })
	end,
})

-- terminal - no numbers, automatically in insert mode
vim.api.nvim_create_autocmd("TermOpen", { group = group, command = "setlocal norelativenumber nonumber" })
vim.api.nvim_create_autocmd("TermOpen", { group = group, command = "startinsert" })

-- prevents comments on a new line
vim.api.nvim_create_autocmd(
	"BufEnter",
	{ group = group, command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o" }
)

-- opens help in new tab
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { "*.txt" },
	group = group,
	callback = function()
		if vim.api.nvim_buf_get_option(0, "buftype") == "help" then
			vim.fn.execute("wincmd T")
		end
	end,
})

-- git prefix for qppfe branch commit messages
local git_group = vim.api.nvim_create_augroup("GitSettings", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { "*.git/COMMIT_EDITMSG" },
	group = git_group,
	callback = function()
		if vim.fn.isdirectory(".git") ~= 0 then
			local branch = vim.fn.system("git branch --show-current | tr -d '\n'")
			if string.find(branch, "qppfe%-%d%d%d%d") then
				local prefix = string.match(branch, "qppfe%-%d%d%d%d")
				if prefix then
					vim.api.nvim_command("normal i" .. string.upper(prefix) .. ": ")
				end
			end
		end
	end,
})
