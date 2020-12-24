local M = {}

-- run sh scripts and output results to buffer
function M.Exec()
  lines = vim.fn.getline(1, '$')
  command = ''
  for key, val in pairs(lines) do
    command = command .. val
  end
  output = vim.fn.systemlist(command)
  vim.api.nvim_command('rightbelow new')
  buf = vim.api.nvim_get_current_buf() 
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, output)
end

return M
