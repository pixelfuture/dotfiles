local status, telescope = pcall(require, "telescope")
if not status then return end

local builtin = require("telescope.builtin")
local themes = require("telescope.themes")

-- load fzf extension
telescope.load_extension("fzf")

telescope.setup({
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = false, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
	},
})

-- find
vim.keymap.set("n", "<Leader>ff", function()
	-- ignore snapshots, tests, and python files
	builtin.find_files({
		find_command = {
			"fd",
			"--exclude",
			"__snapshots__",
			"--exclude",
			"tests",
			"-E",
			"*.test.js",
			"-E",
			"*.py",
			"--type",
			"f",
		},
	})
end, { desc = "[F]ind [F]iles" })
vim.keymap.set("n", "<Leader>ft", builtin.fd, { desc = "[F]ind files including [T]est files" })
vim.keymap.set("n", "<Leader>fb", builtin.buffers, { desc = "[F]ind [B]uffers" })
vim.keymap.set("n", "<Leader>fw", builtin.grep_string, { desc = "[F]ind [W]ord" })
vim.keymap.set("n", "<Leader>fa", builtin.live_grep, { desc = "[F]ind [A]ll with grep" })
vim.keymap.set("n", "<Leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp" })
vim.keymap.set("n", "<Leader>fo", builtin.oldfiles, { desc = "[F]ind [O]ldfiles" })
vim.keymap.set("n", "<Leader>fq", builtin.quickfix, { desc = "[F]ind [Q]uickfix" })
vim.keymap.set("n", "<Leader>fr", builtin.registers, { desc = "[F]ind [R]egisters" })
vim.keymap.set("n", "<Leader>fj", builtin.jumplist, { desc = "[F]ind [J]umplist" })
vim.keymap.set("n", "<Leader>fz", builtin.current_buffer_fuzzy_find, { desc = "[F]ind Fuz[Z]yfiles" })
vim.keymap.set("n", "<Leader>fm", builtin.keymaps, { desc = "[F]ind Key[M]aps" })

-- git
vim.keymap.set("n", "<Leader>gs", builtin.git_status, { desc = "[G]it [S]tatus" })
vim.keymap.set("n", "<Leader>gc", builtin.git_bcommits, { desc = "[G]it buffer [C]ommits" })
vim.keymap.set("n", "<Leader>gC", builtin.git_commits, { desc = "[G]it [C]ommits" })
vim.keymap.set("n", "<Leader>gb", function()
	builtin.git_branches(themes.get_dropdown({}))
end, { desc = "[G]it [B]ranches" })
vim.keymap.set("n", "<Leader>gm", function()
	local cmd = {
		"git",
		"diff",
		"--name-only",
		"--diff-filter=U",
		"--relative",
	}
	local opts = {
		prompt_title = "Merge Conflicts",
	}
	opts.git_command = cmd
	builtin.git_files(opts)
end, { desc = "[G]it [M]erge Conflicts" })

-- lsp
vim.keymap.set("n", "<Leader>fd", builtin.diagnostics, { desc = "[F]ind LSP [D]iagnostics" })
vim.keymap.set("n", "<Leader>ls", builtin.lsp_document_symbols, { desc = "[L]sp Document [S]ymbols" })

-- custom
vim.keymap.set("n", "<Leader>en", function()
	builtin.find_files(themes.get_dropdown({
		prompt_title = "Dotfiles",
		cwd = "~/.config/nvim",
	}))
end, { desc = "[E]dit [N]eovim" })

vim.keymap.set("n", "<Leader>es", function()
	builtin.find_files({
		prompt_title = "Scripts",
		shorten_path = false,
		cwd = "~/.scripts",
		layout_options = {
			preview_width = 0.75,
		},
	})
end, { desc = "[E]dit [S]cripts" })
