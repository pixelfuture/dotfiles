local actions = require'telescope.actions'
local finders = require('telescope.finders')
local make_entry = require('telescope.make_entry')
local previewers = require('telescope.previewers')
local pickers = require('telescope.pickers')
local sorters = require('telescope.sorters')

require('telescope').setup {
  defaults = {
    -- Picker Configuration
    mappings = {
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

function M.fd()
  require('telescope.builtin').fd()
end

-- excludes .test.js and .snap files
function M.search_files()
  require'telescope.builtin'.find_files{
    find_command = { "rg", "-i", "--hidden", "--files", "-g", "!.git", "-g", "!**/*.test.js", "-g", "!**/*.snap", "-g", "!**/*.py", "-g", "!**/*.sh" }
  }
end

function M.live_grep()
  require'telescope.builtin'.live_grep{}
end

function M.buffers()
  require'telescope.builtin'.buffers{}
end

function M.grep_string()
  require'telescope.builtin'.grep_string{}
end

function M.current_buffer_fuzzy_find()
  require'telescope.builtin'.current_buffer_fuzzy_find{}
end

function M.treesitter()
  require'telescope.builtin'.treesitter{}
end

function M.quickfix()
  require'telescope.builtin'.quickfix{}
end

function M.edit_neovim()
  require'telescope.builtin'.find_files{
    prompt = "~ dotfiles ~",
    cwd = "~/.config/nvim/",
  }
end

function M.edit_scripts()
  require'telescope.builtin'.find_files{
    prompt = "~ scripts ~",
    cwd = "~/.scripts/",
  }
end

function M.edit_markdown()
  require'telescope.builtin'.find_files{
    prompt = "~ markdown ~",
    cwd = "~/my_site/",
  }
end

function M.lsp_references()
  require'telescope.builtin'.lsp_references{}
end

function M.lsp_code_actions()
  require('telescope.builtin').lsp_code_actions{}
end

function M.lsp_workspace_symbols()
  require('telescope.builtin').lsp_workspace_symbols{}
end

function M.dirty_files()
  require'telescope.builtin'.find_files{
    prompt = "~ dirty files ~",
    find_command = { "git", "ls-files", "--exclude-standard", "-m", "-o" }
  }
end

function M.oldfiles()
  require('telescope.builtin').oldfiles()
end

function M.help_tags()
  require('telescope.builtin').help_tags {
    show_version = true,
  }
end

function M.command_history()
  require('telescope.builtin').command_history{}
end

function M.git_branches(opts)
  opts = opts or {}

  pickers.new(opts,{
    prompt = 'Git Branches',
    finder = finders.new_oneshot_job(
      { "git", "branch", "--list", "--all" },
      opts
    ),
    attach_mappings = function(prompt_bufnr, map)
      local execute = function()
        local selection = actions.get_selected_entry(prompt_bufnr)
        actions.close(prompt_bufnr)
        local val = selection.value
        local branchname = val:gsub("remotes/origin/", "")
        local cmd = "!git checkout " .. branchname

        vim.api.nvim_exec(cmd, true)
      end

      map('i', '<CR>', execute)
      map('n', '<CR>', execute)

      return true
    end,
    sorter = sorters.get_generic_fuzzy_sorter(),
  }):find()
end

function M.reloader()
  require('telescope.builtin').reloader{}
end

-- TODO: Create a way to live_grep and automatically exclude test snap and lock
-- M.live_grep = function()
--   require'telescope.builtin'.live_grep{
--     find_command = { "rg", "-i", "--hidden", "--files", "-g", "!.git", "-g", "!**/*.test.js", "-g", "!**/*.snap" }
--   }
-- end

return M
