local vim = _G.vim
local cmd = vim.cmd
local fn = vim.fn

-- ES5Check for HHBuilder homeworks
cmd [[command! -bang ES5Check execute '20split | !npx es-check es5 "./index.js"']]

-- Start rebasing development branch
rebase_development = function()
  cmd("silent Git stash")
  cmd("silent Git chechout main")
  cmd("silent Git pull origin main")
  cmd("silent Git branch -D development")
  cmd("silent Git checkout development")
  cmd("silent Git rebase main -i")
end

cmd [[command! RebaseDev lua rebase_development{}]]

-- Navigate windows. Create one if not available
win_move = function(key)
  local curwin = fn.winnr()
  fn.execute("wincmd " .. key)
  -- create a new window
  if curwin == fn.winnr() then
    if key == "j" then
      fn.execute("wincmd s")
    elseif key == "k" then
      fn.execute("wincmd s")
      fn.execute("wincmd k")
    elseif key == "h" then
      fn.execute("wincmd v")
      fn.execute("wincmd h")
    else
      fn.execute("wincmd v")
    end
  end
end

-- Create Scratch file
create_scratch = function()
  cmd("60vnew")
  cmd("setlocal buftype=nofile bufhidden=hide noswapfile")
end

cmd [[command! Scratch lua create_scratch{}]]

-- Help in new tab
help_in_new_tab = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "help" then
    fn.execute("wincmd T")
  end
end
cmd("augroup helpInNewTab")
cmd("autocmd!")
cmd [[au BufEnter *.txt lua help_in_new_tab{}]]
cmd("augroup END")

-- prettier for javascript
cmd("augroup prettier")
cmd("autocmd!")
cmd [[au FileType javascript setlocal formatprg=prettier\ --stdin-filepath\ %]]
cmd("augroup END")

-- lua-fmt for lua
cmd("augroup luafmt")
cmd("autocmd!")
cmd [[au FileType lua setlocal formatprg=luafmt\ --indent-count\ 2\ --stdin\ %]]
cmd("augroup END")

-- statusline
cmd("augroup status")
cmd("autocmd!")
cmd [[au WinEnter,BufEnter * lua generate_statusline_active()]]
cmd [[au WinLeave,BufLeave * lua generate_statusline_inactive()]]
cmd("augroup END")

generate_statusline_active = function()
  local blank = " "
  local statusline = ""
  local bufferNumber = "%#DiffChange# %n "
  local filename = "%#StatusLine# %f"  
  local modified = "%#StatusLineNC#%m"
  local fugitive = " %{FugitiveHead()}"
  statusline = bufferNumber .. filename .. blank .. modified .. "%=%#DiffChange#" .. blank .. fugitive .. blank .. "%l:%c:%L" .. blank
  vim.wo.statusline = statusline
end

generate_statusline_inactive = function()
  local blank = " "
  local statusline = ""
  local bufferNumber = " %n "
  local filename = " %f"  
  local modified = "%m"
  local fugitive = " %{FugitiveHead()}"
  statusline = bufferNumber .. blank .. filename .. blank .. modified .. "%=" .. blank .. fugitive .. blank .. "%l:%c:%L" .. blank
  vim.wo.statusline = statusline
end

-- coc
cmd("augroup coc")
cmd("autocmd!")
cmd [[autocmd CursorHold * silent call CocActionAsync('highlight')]]
cmd [[autocmd Filetype javascript nnoremap [g <Plug>(coc-diagnostic-prev)]]
cmd [[autocmd Filetype javascript nnoremap ]g <Plug>(coc-diagnostic-next)]]
cmd("augroup END")

-- treesitter
cmd("augroup LuaFold")
cmd("autocmd!")
cmd [[autocmd Filetype javascript setl foldmethod=expr foldexpr=nvim_treesitter#foldexpr()]]
cmd("augroup END")

