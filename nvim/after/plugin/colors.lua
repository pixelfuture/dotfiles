require("catppuccin").setup({
  transparent_background = true,
  term_colors = true,
})

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
