local map_options = {
  noremap = true,
  silent = true
}
local map = function(lhs, rhs)
  vim.api.nvim_set_keymap('n', lhs, rhs, map_options)
end

-- dotfiles
map("<leader>en", "<cmd>lua require'hotrod.telescope'.edit_neovim()<cr>")
map("<leader>es", "<cmd>lua require'hotrod.telescope'.edit_scripts()<cr>")

-- files
map("<leader>ff", "<cmd>lua require('hotrod.telescope').find_files()<cr>")
map("<leader>ft", "<cmd>lua require('hotrod.telescope').fd()<cr>")
map("<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>")
map("<leader>fw", "<cmd>lua require('telescope.builtin').grep_string()<cr>")
map("<leader>fo", "<cmd>lua require('telescope.builtin').oldfiles()<cr>")
map("<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>")
map("<leader>fa", "<cmd>lua require('telescope.builtin').live_grep()<cr>")
map("<leader>fz", "<cmd>lua require('hotrod.telescope').current_buffer_fuzzy_find()<cr>")
map("<leader>fc", "<cmd>lua require('telescope.builtin').command_history()<cr>")
map("<leader>f/", "<cmd>lua require('telescope.builtin').search_history()<cr>")
map("<leader>f'", "<cmd>lua require('telescope.builtin').marks()<cr>")
map("<leader>fm", "<cmd>lua require('telescope.builtin').keymaps()<cr>")
map("<leader>fH", "<cmd>lua require('telescope.builtin').highlights()<cr>")
map("<leader>fe", "<cmd>lua require('hotrod.telescope').file_browser()<cr>")

-- Git
map("<leader>gs", "<cmd>lua require('telescope.builtin').git_status()<cr>")
map("<leader>gc", "<cmd>lua require('telescope.builtin').git_bcommits()<cr>")
map("<leader>gC", "<cmd>lua require('telescope.builtin').git_commits()<cr>")
map("<leader>gb", "<cmd>lua require('telescope.builtin').git_branches()<cr>")

-- LSP
map("<leader>lc", "<cmd>lua require('telescope.builtin').lsp_code_actions()<cr>")
map("<leader>ld", "<cmd>lua require('telescope.builtin').lsp_document_diagnostics()<cr>")
map("<leader>lr", "<cmd>lua require('telescope.builtin').lsp_references()<cr>")
map("<leader>ls", "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>")
