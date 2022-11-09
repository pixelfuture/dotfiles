local action_state = require "telescope.actions.state"

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

local M = {}

function M.edit_neovim()
  require("telescope.builtin").find_files {
    prompt_title = "~ dotfiles ~",
    shorten_path = false,
    cwd = "~/.config/nvim",

    layout_strategy = "flex",
    layout_config = {
      width = 0.9,
      height = 0.8,

      horizontal = {
        width = { padding = 0.2 },
      },
      vertical = {
        preview_height = 0.75,
      },
    },
  }
end

function M.edit_scripts()
  require("telescope.builtin").find_files {
    prompt_title = "~ scripts ~",
    shorten_path = false,
    cwd = "~/.scripts",

    layout_strategy = "flex",
    layout_config = {
      width = 0.9,
      height = 0.8,

      horizontal = {
        width = { padding = 0.2 },
      },
      vertical = {
        preview_height = 0.75,
      },
    },
  }
end

-- excludes test files, python files, and snapshots
function M.find_files()
  require("telescope.builtin").find_files {
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
  }
end

function M.fd()
  require("telescope.builtin").fd()
end

function M.current_buffer_fuzzy_find()
  require("telescope.builtin").current_buffer_fuzzy_find({
    sorting_strategy = 'ascending',
    prompt_position = 'top',
    previewer = false
  })
end

function M.file_browser()
  local opts

  opts = {
    sorting_strategy = "ascending",
    scroll_strategy = "cycle",
    prompt_position = "top",

    attach_mappings = function(prompt_bufnr, map)
      map("n", "yy", function()
        local entry = action_state.get_selected_entry()
        vim.fn.setreg("+", entry.value)
      end)

      return true
    end,
  }

  require("telescope.builtin").file_browser(opts)
end

local map_options = {
  noremap = true,
  silent = true
}
local map = function(lhs, rhs)
  vim.api.nvim_set_keymap('n', lhs, rhs, map_options)
end

-- dotfiles
map("<leader>en", "<cmd>lua require'hotrod.telescope'.edit_neovim()<cr>")
map("<leader>es", "<cmd>lua require'hotrod.telescope'.edit_scripts()<cr>")

-- files
map("<leader>ff", "<cmd>lua require('hotrod.telescope').find_files()<cr>")
map("<leader>ft", "<cmd>lua require('hotrod.telescope').fd()<cr>")
map("<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>")
map("<leader>fw", "<cmd>lua require('telescope.builtin').grep_string()<cr>")
map("<leader>fo", "<cmd>lua require('telescope.builtin').oldfiles()<cr>")
map("<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>")
map("<leader>fa", "<cmd>lua require('telescope.builtin').live_grep()<cr>")
map("<leader>fz", "<cmd>lua require('hotrod.telescope').current_buffer_fuzzy_find()<cr>")
map("<leader>fc", "<cmd>lua require('telescope.builtin').command_history()<cr>")
map("<leader>f/", "<cmd>lua require('telescope.builtin').search_history()<cr>")
map("<leader>f'", "<cmd>lua require('telescope.builtin').marks()<cr>")
map("<leader>fm", "<cmd>lua require('telescope.builtin').keymaps()<cr>")
map("<leader>fH", "<cmd>lua require('telescope.builtin').highlights()<cr>")
map("<leader>fe", "<cmd>lua require('hotrod.telescope').file_browser()<cr>")
map("<leader>fq", "<cmd>lua require('telescope.builtin').quickfix()<cr>")

-- Git
map("<leader>gs", "<cmd>lua require('telescope.builtin').git_status()<cr>")
map("<leader>gc", "<cmd>lua require('telescope.builtin').git_bcommits()<cr>")
map("<leader>gC", "<cmd>lua require('telescope.builtin').git_commits()<cr>")
map("<leader>gb", "<cmd>lua require('telescope.builtin').git_branches()<cr>")

-- LSP
map("<leader>ld", "<cmd>lua require('telescope.builtin').diagnostics()<cr>")
map("<leader>lr", "<cmd>lua require('telescope.builtin').lsp_references()<cr>")
map("<leader>ls", "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>")

return M

