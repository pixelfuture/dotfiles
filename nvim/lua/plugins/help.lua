local api = vim.api
local fn = vim.fn
local cmd = vim.cmd

-- Help in new tab
help_in_new_tab = function()
  if api.nvim_buf_get_option(0, "buftype") == "help" then
    fn.execute("wincmd T")
  end
end

cmd("augroup helpInNewTab")
cmd("autocmd!")
cmd [[au BufEnter *.txt lua help_in_new_tab{}]]
cmd("augroup END")
