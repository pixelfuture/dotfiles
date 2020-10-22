local remap = vim.api.nvim_set_keymap
local options = {noremap = true}

vim.schedule(
  function()
    -- change signify symbol
    vim.g.signify_sign_change = "│"

    -- mappings
    remap("n", "<Leader>gd", ":SignifyDiff<cr>", options)
    remap("n", "<Leader>gh", ":SignifyHunkDiff<cr>", options)
    remap("n", "<Leader>gu", ":SignifyHunkUndo<cr>", options)

    -- hunk jumping
    remap("n", "<Leader>gj", "<plug>(signify-next-hunk)", options)
    remap("n", "<Leader>gk", "<plug>(signify-prev-hunk)", options)

    -- hunk text object
    remap("o", "ic", "<plug>(signify-motion-inner-pending)", {})
    remap("x", "ic", "<plug>(signify-motion-inner-visual)", {})
  end
)
