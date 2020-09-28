local M = {}

function M.current_file_cwd()
  local my_var = 'sup'
  print(my_var)
  return vim.fn.expand("%:h")
end

print(M.current_file_cwd())

return M
