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
