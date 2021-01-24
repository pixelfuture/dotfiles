local api = vim.api
local fzf_files = vim.fn["fzf#vim#files"]
local fzf_preview = vim.fn["fzf#vim#with_preview"]
local nmap = function(lhs, rhs)
  api.nvim_set_keymap('n', lhs, rhs, {noremap = true, silent = false})
end

local open_files_fzf = function(path)
  local preview_settings = {
    options = {'--layout=reverse', '--info=inline'}
  }
  fzf_files(path, fzf_preview(preview_settings))
end

function edit_neovim()
  open_files_fzf('~/.config/nvim')
end
function edit_scripts()
  open_files_fzf('~/.scripts')
end

nmap('<Leader>ff', ':Files<cr>')
nmap('<Leader>fb', ':Buffers<cr>')
nmap('<Leader>fz', ':BLines<CR>')
nmap('<Leader>fl', ':Lines<CR>')
nmap('<Leader>fw', ':Rg<Space><C-r><C-w><CR>')
nmap('<Leader>fa', ':Rg<Space>')
nmap("<Leader>f'", ':Marks<CR>')
nmap('<Leader>fh', ':Helptags!<CR>')
nmap('<Leader>fc', ':Colors<CR>')
nmap('<Leader>fC', ':Commands<CR>')
nmap('<Leader>fM', ':Maps<CR>')
nmap('<Leader>ft', ':Tags<CR>')
nmap('<Leader>gs', ':GFiles?<CR>')
nmap('<Leader>gb', ':GBranch<CR>')
nmap('<Leader>gc', ':BCommits<CR>')
nmap('<Leader>gC', ':Commits<CR>')
nmap('<Leader>fo', ':History<CR>')
nmap('<Leader>fH', ':History:<CR>')
nmap('<Leader>en', ':lua edit_neovim()<CR>')
nmap('<Leader>es', ':lua edit_scripts()<CR>')
