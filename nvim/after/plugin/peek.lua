local status, peek = pcall(require, "peek")
if not status then
  return
end

peek.setup()

vim.api.nvim_create_user_command("PeekOpen", peek.open, {})
vim.api.nvim_create_user_command("PeekClose", peek.close, {})
