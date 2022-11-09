local keymap = vim.keymap
local fn = vim.fn

keymap.set("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap.set('n', '<Leader>;', ':')
-- keymap.set('n', '<Leader>r', ':so %<CR>')
keymap.set('n', '<Leader>q', ':quit<CR>')
keymap.set('n', '<Leader>s', ':update<CR>')
keymap.set('n', 'Q', 'gq')
keymap.set('n', 'H', '^')
keymap.set('n', 'L', '$')

-- move lines
keymap.set('v', 'J', [[:m '>+1<CR>gv=gv]])
keymap.set('v', 'K', [[:m '<-2<CR>gv=gv]])

-- no yanking when pasting in visual mode
keymap.set('v', 'p', '"_dP')

-- edit zshrc file
keymap.set('n', '<Leader>ez', ':e ~/.zshrc')

-- window management
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
keymap.set('n', '<M-h>', function() win_move("h") end)
keymap.set('n', '<M-j>', function() win_move("j") end) 
keymap.set('n', '<M-k>', function() win_move("k") end) 
keymap.set('n', '<M-l>', function() win_move("l") end) 
keymap.set('n', '<Leader>ww', '<C-w>w')
keymap.set('n', '<Leader>wo', '<C-w>o')
keymap.set('n', '<Leader>wh', '<C-w>h')
keymap.set('n', '<Leader>wj', '<C-w>j')
keymap.set('n', '<Leader>wk', '<C-w>k')
keymap.set('n', '<Leader>wl', '<C-w>l')
keymap.set('n', '<Leader>w=', '<C-w>=')
keymap.set('n', '<Leader>wt', '<C-w>T')
keymap.set('n', '<Leader>wv', '<C-w>v')
keymap.set('n', '<Leader>ws', '<C-w>s')
keymap.set('n', '<Leader>w,', '20<C-w><')
keymap.set('n', '<Leader>w.', '20<C-w>>')

-- terminal escape
keymap.set('t', '<Esc>', [[<C-\><C-n>]])

-- markdown
--nmap('gm', '<cmd>LivedownToggle<CR>')
