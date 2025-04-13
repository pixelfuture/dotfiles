return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-fzy-native.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
	},
	enabled = false,
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")
		local themes = require("telescope.themes")

		telescope.load_extension("fzy_native")
		telescope.load_extension("ui-select")
		telescope.setup({
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})

		local keymap = vim.keymap

		-- find
		-- keymap.set("n", "<Leader>ff", function()
		-- 	-- ignore snapshots, tests, and python files
		-- 	builtin.find_files({
		-- 		find_command = {
		-- 			"fd",
		-- 			"--exclude",
		-- 			"__snapshots__",
		-- 			"--exclude",
		-- 			"tests",
		-- 			"-E",
		-- 			"*.test.js",
		-- 			"-E",
		-- 			"*.py",
		-- 			"--type",
		-- 			"f",
		-- 		},
		-- 	})
		-- end, { desc = "[F]ind [F]iles" })
		keymap.set("n", "<Leader>ft", builtin.fd, { desc = "[F]ind files including [T]est files" })
		-- keymap.set("n", "<Leader>b", builtin.buffers, { desc = "Find [B]uffers" })
		-- keymap.set("n", "<Leader>fw", builtin.grep_string, { desc = "Find [W]ord" })
		-- keymap.set("n", "<Leader>fa", builtin.live_grep, { desc = "[F]ind [A]ll with grep" })
		-- keymap.set("n", "<Leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp" })
		-- keymap.set("n", "<Leader>fo", builtin.oldfiles, { desc = "[F]ind [O]ldfiles" })
		-- keymap.set("n", "<Leader>fq", builtin.quickfix, { desc = "[F]ind [Q]uickfix" })
		-- keymap.set("n", "<Leader>fr", builtin.registers, { desc = "[F]ind [R]egisters" })
		-- keymap.set("n", "<Leader>fj", builtin.jumplist, { desc = "[F]ind [J]umplist" })
		-- keymap.set("n", "<Leader>fz", builtin.current_buffer_fuzzy_find, { desc = "[F]ind Fuz[Z]yfiles" })
		-- keymap.set("n", "<Leader>fm", builtin.keymaps, { desc = "[F]ind Key[M]aps" })

		-- git
		-- keymap.set("n", "<Leader>gs", builtin.git_status, { desc = "[G]it [S]tatus" })
		-- keymap.set("n", "<Leader>gc", builtin.git_bcommits, { desc = "[G]it buffer [C]ommits" })
		-- keymap.set("n", "<Leader>gC", builtin.git_commits, { desc = "[G]it [C]ommits" })
		-- keymap.set("n", "<Leader>gb", function()
		-- 	builtin.git_branches(themes.get_dropdown({}))
		-- end, { desc = "[G]it [B]ranches" })
		-- keymap.set("n", "<Leader>gm", function()
		-- 	local cmd = {
		-- 		"git",
		-- 		"diff",
		-- 		"--name-only",
		-- 		"--diff-filter=U",
		-- 		"--relative",
		-- 	}
		-- 	local opts = {
		-- 		prompt_title = "Merge Conflicts",
		-- 	}
		-- 	opts.git_command = cmd
		-- 	builtin.git_files(opts)
		-- end, { desc = "[G]it [M]erge Conflicts" })

		-- lsp
		-- keymap.set("n", "<Leader>fd", builtin.diagnostics, { desc = "[F]ind LSP [D]iagnostics" })

		-- custom
		-- keymap.set("n", "<Leader>en", function()
		-- 	builtin.find_files(themes.get_dropdown({
		-- 		prompt_title = "Dotfiles",
		-- 		cwd = "~/.config/nvim",
		-- 	}))
		-- end, { desc = "[E]dit [N]eovim" })

		-- keymap.set("n", "<Leader>es", function()
		-- 	builtin.find_files({
		-- 		prompt_title = "Scripts",
		-- 		shorten_path = false,
		-- 		cwd = "~/.scripts",
		-- 		layout_options = {
		-- 			preview_width = 0.75,
		-- 		},
		-- 	})
		-- end, { desc = "[E]dit [S]cripts" })
	end,
}
