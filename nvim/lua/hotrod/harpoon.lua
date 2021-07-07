local map_options = {
  noremap = true,
  silent = true
}
local map = function(lhs, rhs)
  vim.api.nvim_set_keymap('n', lhs, rhs, map_options)
end

-- mappings
map("<leader>hh", "<cmd>lua require'harpoon.ui'.toggle_quick_menu()<cr>")
map("<leader>ha", "<cmd>lua require'harpoon.mark'.add_file()<cr>")
map("<leader>ht", "<cmd>lua require'harpoon.term'.gotoTerminal(1)<cr>")
map("<leader>hj", "<cmd>lua require'harpoon.ui'.nav_file(1)<cr>")
map("<leader>hk", "<cmd>lua require'harpoon.ui'.nav_file(2)<cr>")
map("<leader>hl", "<cmd>lua require'harpoon.ui'.nav_file(3)<cr>")
map("<leader>h;", "<cmd>lua require'harpoon.ui'.nav_file(4)<cr>")

