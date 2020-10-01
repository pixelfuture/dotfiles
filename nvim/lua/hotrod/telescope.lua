local actions = require'telescope.actions'
require('telescope').setup {
  defaults = {
    -- Picker Configuration
    default_mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,

        ["<C-c>"] = actions.close,

        ["<CR>"] = actions.goto_file_selection_edit,
        ["<C-x>"] = actions.goto_file_selection_split,
        ["<C-v>"] = actions.goto_file_selection_vsplit,
        ["<C-t>"] = actions.goto_file_selection_tabedit,
      },
      n = {
        ["<esc>"] = actions.close,
        ["<CR>"] = actions.goto_file_selection_edit,
      },
    },
  },
}

local M = {}

M.dirty_files = function()
  require'telescope.builtin'.find_files{
    find_command = { "git", "ls-files", "--exclude-standard", "-m", "-o" }
  }
end

M.search_files = function()
  require'telescope.builtin'.find_files{
    find_command = { "rg", "-i", "--hidden", "--files", "-g", "!.git", "-g", "!**/*.test.js", "-g", "!**/*.snap" }
  }
end

-- TODO: Create a way to live_grep and automatically exclude test snap and lock
-- M.live_grep = function()
--   require'telescope.builtin'.live_grep{
--     find_command = { "rg", "-i", "--hidden", "--files", "-g", "!.git", "-g", "!**/*.test.js", "-g", "!**/*.snap" }
--   }
-- end

return M
