-- https://github.com/nvim-telescope/telescope-github.nvim
-- Telescope gh pull_request
-- <cr> checkout pull request
-- <c-t> open web
-- <c-e> toggle to view detail or diff
-- <c-r> merge request
-- <c-a> approve pull request
-- <c-f> browse modified files
return {
	"nvim-telescope/telescope-github.nvim",
	enabled = false,
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope-github.nvim" },
	},
	config = function()
		require("telescope").load_extension("gh")
		vim.keymap.set(
			"n",
			"<Leader>gp",
			require("telescope").extensions.gh.pull_request,
			{ desc = "List [G]ithub [P]ull Requests" }
		)
	end,
}
