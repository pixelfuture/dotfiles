local api = vim.api
local g = vim.g

g.signify_sign_change = "│"

-- mappings
api.nvim_set_keymap('n', '<Leader>gd', '<cmd>SignifyDiff<CR>', {noremap = true, silent = false})
api.nvim_set_keymap('n', '<Leader>gh', '<cmd>SignifyHunkDiff<CR>', {noremap = true, silent = false})
api.nvim_set_keymap('n', '<Leader>gu', '<cmd>SignifyHunkUndo<CR>', {noremap = true, silent = false})

-- hunk jumping
api.nvim_set_keymap('n', '<Leader>gj', '<plug>(signify-next-hunk)', {noremap = true, silent = false})
api.nvim_set_keymap('n', '<Leader>gk', '<plug>(signify-prev-hunk)', {noremap = true, silent = false})

-- hunk text object
api.nvim_set_keymap('o', 'ic', '<plug>(signify-motion-inner-pending)', {noremap = true, silent = false})
api.nvim_set_keymap('x', 'ic', '<plug>(signify-motion-inner-visual)', {noremap = true, silent = false})
