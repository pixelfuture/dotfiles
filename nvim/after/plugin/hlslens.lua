local status, hlslens = pcall(require, "hlslens")
if not status then
  return
end

hlslens.setup({
	auto_enable = {
		description = [[Enable nvim-hlslens automatically]],
		default = true,
	},
	enable_incsearch = {
		description = [[When `incsearch` option is on and enable_incsearch is true, add lens
            for the current matched instance]],
		default = true,
	},
	calm_down = {
		description = [[If calm_down is true, clear all lens and highlighting When the cursor is
            out of the position range of the matched instance or any texts are changed]],
		default = false,
	},
	nearest_only = {
		description = [[Only add lens for the nearest matched instance and ignore others]],
		default = true,
	},
	nearest_float_when = {
		description = [[When to open the floating window for the nearest lens.
            'auto': floating window will be opened if room isn't enough for virtual text;
            'always': always use floating window instead of virtual text;
            'never': never use floating window for the nearest lens]],
		default = "auto",
	},
})

local keymap = vim.keymap

keymap.set(
	"n",
	"n",
	[[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
	{ desc = "improve n" }
)
keymap.set(
	"n",
	"N",
	[[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
	{ desc = "improve N" }
)

keymap.set("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]], { desc = "improve *" })
keymap.set("n", "#", [[#<Cmd>lua require('hlslens').start()<CR>]], { desc = "improve *" })

keymap.set("n", "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], { desc = "improve *" })
keymap.set("n", "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]], { desc = "improve *" })

keymap.set("n", "<Leader>l", "<Cmd>noh<CR>", { desc = "improve *" })
