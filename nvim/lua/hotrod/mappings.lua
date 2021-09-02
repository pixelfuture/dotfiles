local fn = vim.fn
local mappings = {}
local nmap = function(lhs, rhs)
  vim.api.nvim_set_keymap('n', lhs, rhs, {noremap = true, silent = false})
end
local vmap = function(lhs, rhs)
  vim.api.nvim_set_keymap('v', lhs, rhs, {noremap = true, silent = false})
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
  nmap('<Leader>;', ':')
  nmap('<Leader>q', ':quit<CR>')
  nmap('<Leader>s', ':update<CR>')
  -- nmap('<Leader>r', ':luafile %<CR>')
  -- TODO: move configurations to hotrod.lua to be able to easily reload configuration with <F4>
  -- nmap('<F4>', ':lua package.loaded.plugins = nil<cr> :luafile ~/.config/nvim/init.lua<cr>')

  -- general
  nmap('Q', 'gq')
  nmap('H', '^')
  nmap('L', '$')
  nmap('Y', 'y$')

  -- move lines
  vmap('J', [[:m '>+1<CR>gv=gv]])
  vmap('K', [[:m '<-2<CR>gv=gv]])

  -- special copy/yank commands
  vmap('<Leader>p', '"_dP')

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
  nmap('<Leader>fp', [[:lua require("harpoon.term").sendCommand(1, "tmux2.sh\n"); require("harpoon.term").gotoTerminal(1)<CR>]])

  -- terminal escape
  vim.api.nvim_set_keymap('t', '<Esc>', [[<C-\><C-n>]], {noremap = true, silent = false})
end

return mappings
