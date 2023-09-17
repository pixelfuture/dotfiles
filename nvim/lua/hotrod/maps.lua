local keymap = vim.keymap

keymap.set("n", "<Leader>q", ":quit<CR>", { desc = "quit file" })
keymap.set("n", "<Leader>s", ":update<CR>", { desc = "save file" })

-- move
keymap.set("n", "-", vim.cmd.Ex, { desc = "Access netrw" })
keymap.set("n", "H", "^", { desc = "move to the beginning of a line" })
keymap.set("n", "L", "$", { desc = "move to the end of a line" })
-- keymap.set("n", "J", "mzJ`z", { desc = "do not move cursor after J command" })
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "improve paging through file" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "improve paging through file" })
keymap.set("n", "n", "nzzzv", { desc = "improve n" })
keymap.set("n", "N", "Nzzzv", { desc = "improve N" })
keymap.set("n", "<Leader>rw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "replace word" })
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "move lines up in visual mode and autoindent" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "move lines down in visual mode and autoindent" })

-- Better indenting
keymap.set("v", "<", "<gv", { desc="improve indenting in visual mode", silent = true })
keymap.set("v", ">", ">gv", { desc="improve indenting in visual mode", silent = true })

-- no yanking when pasting in visual mode
keymap.set("v", "p", '"_dP', { desc = "improve pasting in visual mode" })

-- window management
-- local fn = vim.fn
-- local function win_move(key)
-- 	local curwin = fn.winnr()
-- 	fn.execute("wincmd " .. key)
-- 	if curwin == fn.winnr() then
-- 		if key == "j" then
-- 			fn.execute("wincmd s")
-- 		elseif key == "k" then
-- 			fn.execute("wincmd s")
-- 			fn.execute("wincmd k")
-- 		elseif key == "h" then
-- 			fn.execute("wincmd v")
-- 			fn.execute("wincmd h")
-- 		else
-- 			fn.execute("wincmd v")
-- 		end
-- 	end
-- end
-- keymap.set("n", "<M-h>", function()
-- 	win_move("h")
-- end, { desc = "move to left window" })
-- keymap.set("n", "<M-j>", function()
-- 	win_move("j")
-- end, { desc = "move to down window" })
-- keymap.set("n", "<M-k>", function()
-- 	win_move("k")
-- end, { desc = "move to top window" })
-- keymap.set("n", "<M-l>", function()
-- 	win_move("l")
-- end, { desc = "move to right window" })
keymap.set("n", "sw", "<C-w>w", { desc = "go to next window" })
keymap.set("n", "so", "<C-w>o", { desc = "close other windows" })
keymap.set("n", "sh", "<C-w>h", { desc = "move to left window" })
keymap.set("n", "sj", "<C-w>j", { desc = "move to down window" })
keymap.set("n", "sk", "<C-w>k", { desc = "move to top window" })
keymap.set("n", "sl", "<C-w>l", { desc = "move to right window" })
keymap.set("n", "st", "<C-w>T", { desc = "open window in new tab" })
keymap.set("n", "sv", "<C-w>v", { desc = "create window vsplit" })
keymap.set("n", "ss", "<C-w>s", { desc = "create window split" })
keymap.set("n", "s=", "<C-w>=", { desc = "make all windows same width" })
keymap.set("n", "s,", "20<C-w><", { desc = "decrease window width" })
keymap.set("n", "s.", "20<C-w>>", { desc = "increase window width" })
keymap.set("n", "s+", "10<C-w>+", { desc = "decrease window height" })
keymap.set("n", "s-", "10<C-w>-", { desc = "increase window height" })

-- terminal escape
keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "terminal escape" })

keymap.set("n", "Q", "<nop>", { desc = "Q sucks" })
keymap.set("n", "<Leader>ez", ":e ~/.zshrc", { desc = "edit zshrc file" })

-- console.log
keymap.set("n", "<Leader>cl", function()
  local word = vim.fn.expand "<cword>"
  vim.cmd "norm! oconsole.log({ "
  vim.cmd(string.format("norm! a%s })", word))
end, { desc = "[C]onsole [L]og" })
