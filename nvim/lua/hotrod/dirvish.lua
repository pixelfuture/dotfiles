local keymap = vim.keymap
local group = vim.api.nvim_create_augroup("DirvishEnhancements", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "Dirvish" },
  group = group,
  callback = function ()
    vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>a', ':e %', { noremap = true })
    vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>d', ':Mkdir %', { noremap = true })
    vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>D', 'yy:!rm -rf <C-r><C-o>"', { noremap = true })
  end
})

