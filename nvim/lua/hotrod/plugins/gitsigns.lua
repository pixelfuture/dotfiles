return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"tpope/vim-fugitive",
	},
	opts = {
		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns

			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			-- navigation
			map("n", "]c", function()
				if vim.wo.diff then
					return "]c"
				end
				vim.schedule(function()
					gs.next_hunk()
				end)
				return "<Ignore>"
			end, { expr = true })

			map("n", "[c", function()
				if vim.wo.diff then
					return "[c"
				end
				vim.schedule(function()
					gs.prev_hunk()
				end)
				return "<Ignore>"
			end, { expr = true })

			-- actions
			map("n", "<Leader>hs", gs.stage_hunk, { desc = "[H]unk [S]tage" })
			map("n", "<Leader>hu", gs.undo_stage_hunk, { desc = "[H]unk stage [U]ndo" })
			map("n", "<Leader>hr", gs.reset_hunk, { desc = "[H]unk [R]eset" })
			map("v", "<Leader>hs", function()
				gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, { desc = "[H]unk [S]tage" })
			map("v", "<Leader>hr", function()
				gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, { desc = "[H]unk [R]eset" })
			map("n", "<Leader>hS", gs.stage_buffer, { desc = "[H]unk [S]tage buffer" })
			map("n", "<Leader>hR", gs.reset_buffer, { desc = "[H]unk [R]eset buffer" })
			map("n", "<Leader>hp", gs.preview_hunk, { desc = "[H]unk [P]review" })
			map("n", "<Leader>hb", function()
				gs.blame_line({ full = true })
			end, { desc = "[H]unk [B]lame line" })
			map("n", "<Leader>tb", gs.toggle_current_line_blame, { desc = "[T]oggle [B]lame" })
			map("n", "<Leader>hd", gs.diffthis, { desc = "[H]unk [D]iff" })
			map("n", "<Leader>hD", function()
				gs.diffthis("~")
			end, { desc = "[H]unk [D]iff last commit" })
			map("n", "<Leader>td", gs.toggle_deleted, { desc = "[T]oggle [D]eleted" })

			-- text object
			map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Apply to current hunk" })
		end,
	},
}
