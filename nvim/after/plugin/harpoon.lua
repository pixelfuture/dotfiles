local status, harpoon = pcall(require, "harpoon")
if not status then
	return
end

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>ha", mark.add_file, { desc = "[h]arpoon [a]dd file" })
vim.keymap.set("n", "<leader>hh", ui.toggle_quick_menu, { desc = "[h]arpoon show [h]ide quick menu" })

vim.keymap.set("n", "<leader>hj", function()
	ui.nav_file(1)
end, { desc = "[h]arpoon [j]avigate to first file" })
vim.keymap.set("n", "<leader>hk", function()
	ui.nav_file(2)
end, { desc = "[h]arpoon [k]avigate to second file" })
vim.keymap.set("n", "<leader>hl", function()
	ui.nav_file(3)
end, { desc = "[h]arpoon [l]avigate to third file" })
vim.keymap.set("n", "<leader>h;", function()
	ui.nav_file(4)
end, { desc = "[h]arpoon [;]avigate to fourth file" })
