vim.cmd 'colorscheme default'

local colorscheme = "catppuccin"
-- local colorscheme = "tokyonight"
-- local colorscheme = "night-owl"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
