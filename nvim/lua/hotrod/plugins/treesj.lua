return {
	"Wansmer/treesj",
	enabled = false,
	keys = { "<space>m", "<space>j", "<space>s" },
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		require("treesj").setup()
	end,
}
