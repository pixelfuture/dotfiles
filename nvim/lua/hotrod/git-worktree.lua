require("telescope").load_extension("git_worktree")
local nmap = function(lhs, rhs)
  vim.api.nvim_set_keymap('n', lhs, rhs, {noremap = true, silent = false})
end

nmap('<Leader>gw', ":lua require('telescope').extensions.git_worktree.git_worktrees()<CR>")
nmap('<Leader>gm', ":lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>")
