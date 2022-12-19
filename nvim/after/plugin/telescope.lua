local builtin = require('telescope.builtin')
local themes = require("telescope.themes")

-- load fzf extension
require('telescope').load_extension('fzf')

require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = false, -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}

-- find
vim.keymap.set('n', '<leader>ff', function()
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
end, { desc = '[F]ind [F]iles' })
vim.keymap.set('n', '<leader>ft', builtin.fd, { desc = '[F]ind files including [T]est files' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = '[F]ind [B]uffers' })
vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = '[F]ind [W]ord' })
vim.keymap.set('n', '<leader>fa', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, { desc = '[F]ind [A]ll via grep' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })
vim.keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = '[F]ind [O]ldfiles' })
vim.keymap.set('n', '<leader>fq', builtin.quickfix, { desc = '[F]ind [Q]uickfix' })
-- vim.keymap.set('n', '<leader>fz', function()
--   builtin.current_buffer_fuzzy_find({
--     sorting_strategy = 'ascending',
--     scroll_strategy = 'cycle',
--     previewer = false
--   })
-- end, { desc = '[F]ind Fuz[Z]yfiles' })
vim.keymap.set('n', '<leader>fm', builtin.keymaps, { desc = '[F]ind Key[m]aps' })

-- git
vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = '[G]it [S]tatus' })
vim.keymap.set('n', '<leader>gc', builtin.git_bcommits, { desc = '[G]it buffer [C]ommits' })
vim.keymap.set('n', '<leader>gC', builtin.git_commits, { desc = '[G]it [C]ommits' })
vim.keymap.set('n', '<leader>gb', function ()
  builtin.git_branches(themes.get_dropdown({}))
end, { desc = '[G]it [B]ranches' })

-- lsp
vim.keymap.set('n', '<leader>ld', builtin.diagnostics, { desc = '[L]sp [D]iagnostics' })
vim.keymap.set('n', '<leader>lr', builtin.lsp_references, { desc = '[L]sp [R]eferences' })
vim.keymap.set('n', '<leader>ls', builtin.lsp_document_symbols, { desc = '[L]sp Document [S]ymbols' })

-- custom
vim.keymap.set('n', '<leader>en', function()
  builtin.find_files(themes.get_dropdown({
    prompt_title = "Dotfiles",
    cwd = "~/.config/nvim",
  }))
end, { desc = '[E]dit [N]eovim' })

vim.keymap.set('n', '<leader>es', function()
	builtin.find_files {
	    prompt_title = "Scripts",
	    shorten_path = false,
	    cwd = "~/.scripts",
      layout_options = {
        preview_width = 0.75,
      },
	}
end, { desc = '[E]dit [S]cripts' })

