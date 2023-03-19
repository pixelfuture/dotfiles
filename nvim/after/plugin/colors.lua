require("catppuccin").setup({
	transparent_background = true,
	term_colors = true,
})

-- setup must be called before loading
vim.cmd.colorscheme("catppuccin")
vim.api.nvim_set_hl(0, "CursorLine", { bg = "#2e2e3f" })
-- vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
