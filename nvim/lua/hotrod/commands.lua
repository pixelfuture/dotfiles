local cmd = vim.cmd

function commands()
  local cmds = {
    [[command! -bang ES5Check execute '20split | npx es-check es5 "./index.js"']]
  }

  for _, command in pairs(cmds) do
    cmd(command)
  end
end

rebase_development = function()
  cmd("silent Git stash")
  cmd("silent Git chechout main")
  cmd("silent Git branch -D development")
  cmd("silent Git checkout development")
  cmd("silent Git rebase main -i")
end

cmd [[command! RebaseDev lua rebase_development{}]]

-- prettier for javascript
cmd("augroup prettier")
cmd("autocmd!")
cmd [[au FileType javascript setlocal formatprg=prettier\ --stdin-filepath\ %]]
cmd("augroup END")

-- lua-fmt for lua
cmd("augroup luafmt")
cmd("autocmd!")
cmd [[au FileType lua setlocal formatprg=luafmt\ --indent-count\ 2\ --stdin\ %]]
cmd("augroup END")
