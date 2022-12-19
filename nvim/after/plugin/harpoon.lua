local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>ha", mark.add_file, { desc = "[h]arpoon [a]dd file" })
vim.keymap.set("n", "<leader>hh", ui.toggle_quick_menu, { desc = "[h]arpoon show [h]ide quick menu" })

vim.keymap.set("n", "<leader>hn", function() ui.nav_file(1) end, { desc = "[h]arpoon [n]avigate to first file" })
vim.keymap.set("n", "<leader>he", function() ui.nav_file(2) end, { desc = "[h]arpoon [n]avigate to second file" })
vim.keymap.set("n", "<leader>hi", function() ui.nav_file(3) end, { desc = "[h]arpoon [n]avigate to third file" })
vim.keymap.set("n", "<leader>ho", function() ui.nav_file(4) end, { desc = "[h]arpoon [n]avigate to fourth file" })
