local g = vim.g
local api = vim.api
local fn = vim.fn
local mappings = {}
local nmap = function(lhs, rhs)
  api.nvim_set_keymap('n', lhs, rhs, {noremap = true, silent = false})
end

function win_move(key)
  local curwin = fn.winnr()
  fn.execute("wincmd " .. key)
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

function mappings.setup()
  -- leader
  g.mapleader = " "
  nmap('<Leader>;', ':')
  nmap('<Leader>q', ':quit<CR>')
  nmap('<Leader>s', ':update<CR>')
  nmap('<Leader>r', ':luafile %<CR>')

  -- general
  nmap('Q', 'gq')
  nmap('H', '^')
  nmap('L', '$')
  nmap('Y', 'y$')

  -- edit file
  nmap('<Leader>ez', ':e ~/.zshrc')

  -- window management
  nmap('<M-h>', '<cmd>lua win_move("h")<CR>')
  nmap('<M-j>', '<cmd>lua win_move("j")<CR>')
  nmap('<M-k>', '<cmd>lua win_move("k")<CR>')
  nmap('<M-l>', '<cmd>lua win_move("l")<CR>')
  nmap('<Leader>ww', '<C-w>w')
  nmap('<Leader>wo', '<C-w>o')
  nmap('<Leader>wh', '<C-w>h')
  nmap('<Leader>wj', '<C-w>j')
  nmap('<Leader>wk', '<C-w>k')
  nmap('<Leader>wl', '<C-w>l')
  nmap('<Leader>w=', '<C-w>=')
  nmap('<Leader>wt', '<C-w>T')
  nmap('<Leader>wv', '<C-w>v')
  nmap('<Leader>ws', '<C-w>s')
  nmap('<Leader>w,', '20<C-w><')
  nmap('<Leader>w.', '20<C-w>>')
end

return mappings
