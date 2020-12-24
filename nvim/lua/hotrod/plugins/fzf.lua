local cmd = vim.cmd
local fzf_run = vim.fn["fzf#run"]
local fzf_wrap = vim.fn["fzf#wrap"]

-- Search Neovim Files .config/nvim
cmd [[command! -bang -nargs=0 -complete=dir EditNeovim call fzf#vim#files('~/.config/nvim', fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)]]
-- Search .scripts directory
cmd [[command! -bang -nargs=0 -complete=dir EditScripts call fzf#vim#files('~/.scripts', fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)]]
-- Search notes markdown files
cmd [[command! -bang -nargs=0 -complete=dir EditNotes call fzf#vim#files('~/my_site', fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)]]

git_branches = function()
  local wrapped =
    fzf_wrap(
    "git branches",
    {
      source = "git branch --list --all",
      window = {width = 0.6, height = 0.6},
      options = {}
      -- don't set `sink` or `sink*` here
    }
  )
  wrapped["sink*"] = nil -- this line is required if you want to use `sink` only
  wrapped.sink = function(line)
    local branchname = line:gsub("remotes/origin/", "")
    vim.cmd('silent !git checkout ' .. branchname)
  end
  fzf_run(wrapped)
end

-- Search git branches
cmd [[command! GBranch lua git_branches{}]]
