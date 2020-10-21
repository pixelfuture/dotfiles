function commands()
  local cmds = {
    [[command! -bang ES5Check execute '20split | npx es-check es5 "./index.js"']]
  }

  for _, cmd in pairs(cmds) do
    vim.cmd(cmd)
  end
end
