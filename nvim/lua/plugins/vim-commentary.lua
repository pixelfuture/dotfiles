local cmd = vim.cmd

local function trim(s)
  return s:gsub("^%s*(.-)%s*$", "%1")
end

local function is_jsx(s)
  if s:find("^<") or s:find("^{") then
    return true
  end
  return false
end

function set_js_commentstring()
  local currentline = vim.api.nvim_get_current_line()
  local line_length = currentline:len()
  if line_length > 0 then
    local trimmed = trim(currentline)
    if is_jsx(trimmed) == true then
      cmd("setlocal commentstring={/*%s*/}")
    else
      cmd("setlocal commentstring=//%s")
    end
  end
end

cmd("augroup jsx_comment")
cmd("autocmd!")
cmd [[autocmd CursorMoved *.js lua set_js_commentstring()]]
cmd("augroup end")
