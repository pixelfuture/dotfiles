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
return M
