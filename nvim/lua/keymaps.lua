local map = function(keys, func, desc, mode)
  mode = mode or 'n'
  vim.keymap.set(mode, keys, func, { desc = desc })
end

-- stop search highlights with just <Esc>
map('<Esc>', '<cmd>nohlsearch<CR>', 'Stop highlights')

-- Show buffers
-- map('<leader>,', '<cmd>ls<cr>', 'List buffers')

-- Improved yanking and pasting
map('<leader>d', [["_d]], 'Delete without yanking', { 'n', 'v' })
map('p', [["_dP]], 'Paste over selection without losing yanked text', 'x')

-- Replace word
map('<leader>rn', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], 'Replace word cursor')

-- copy current file name
map('<leader>cf', '<cmd>let @+ = expand("%")<CR>', 'Copy current file name (relative)')

-- chmod file so it is executable
map('<leader>X', '<cmd>!chmod +x %<cr>', 'Makes file executable')

-- restart
map('<leader>re', '<cmd>restart<cr>', 'restart')

-- toggle undo tree
map('<leader>tu', function()
  vim.cmd.packadd 'nvim.undotree'
  require('undotree').open()
end, 'Toggle builtin undo tree')

-- toggles
map('<leader>tw', function() vim.o.wrap = not vim.o.wrap end, 'Toggle word wrap')
map('<leader>tr', function() vim.o.relativenumber = not vim.o.relativenumber end, 'Toggle relative line number')
map('<leader>ts', function() vim.o.spell = not vim.o.spell end, 'Toggle spelling')
map('<leader>td', function() vim.diagnostic.enable(not vim.diagnostic.is_enabled()) end, 'Toggle diagnostic')
---@diagnostic disable-next-line: undefined-field this works. not sure why diagnostic is flagging this
map('<leader>tl', function() vim.opt.list = not vim.opt.list:get() end, 'Toggle listchars')

-- Diagnostic Config & Keymaps
-- See `:help vim.diagnostic.Opts`
vim.diagnostic.config {
  update_in_insert = false,
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  underline = { severity = { min = vim.diagnostic.severity.WARN } },

  -- Can switch between these as you prefer
  virtual_text = true, -- Text shows up at the end of the line
  virtual_lines = false, -- Text shows up underneath the line, with virtual lines

  -- Auto open the float, so you can easily read the errors when jumping with `[d` and `]d`
  jump = {
    on_jump = function(_, bufnr)
      vim.diagnostic.open_float {
        bufnr = bufnr,
        scope = 'cursor',
        focus = false,
      }
    end,
  },
}
map('grd', vim.diagnostic.open_float, 'Open diagnostic float')
-- map('<leader>q', vim.diagnostic.setloclist, 'Open diagnostic [Q]uickfix list')

-- Terminal
map('<Esc><Esc>', '<C-\\><C-n>', 'Exit terminal mode', 't')

-- Window
map('<C-h>', '<C-w><C-h>', 'Move focus to the left window')
map('sh', '<C-w>h', 'Move focus to the left window')
map('<C-l>', '<C-w><C-l>', 'Move focus to the right window')
map('sl', '<C-w>l', 'Move focus to the right window')
map('<C-j>', '<C-w><C-j>', 'Move focus to the lower window')
map('sj', '<C-w>j', 'Move focus to lower window')
map('<C-k>', '<C-w><C-k>', 'Move focus to the upper window')
map('sk', '<C-w>k', 'Move focus to the upper window')
map('sw', '<C-w>w', 'Move to next window')
map('so', '<C-w>o', 'Close other windows')
map('st', '<C-w>T', 'Open current window in new tab')
map('sv', '<C-w>v', 'Open vsplit')
map('ss', '<C-w>s', 'Open split')
map('s=', '<C-w>=', 'Make all windows same width')
map('s,', '20<C-w><', 'Descrease window width by 20')
map('s.', '20<C-w>>', 'Increase window width by 20')
map('s+', '10<C-w>+', 'Increase window height by 10')
map('s-', '10<C-w>-', 'Decrease window height by 10')
map('<leader>q', '<C-w>q', 'Close window')

-- Escape in insert mode
map('jk', '<Esc>', 'Exit insert mode with jk', 'i')

-- Handy navigation
map('H', '^', 'Move to beginning of a line')
map('L', '$', 'Move to end of a line')

-- Auto Indent while moving lines in Visual mode
map('J', ":m '>+1<CR>gv=gv", 'Auto Indent while moving lines up', 'v')
map('K', ":m '>-2<CR>gv=gv", 'Auto Indent while moving lines down', 'v')

-- Improve indenting in visual mode
map('<', '<gv', 'Improve indenting less in visual mode', 'v')
map('>', '>gv', 'Improve indenting more in visual mode', 'v')

-- Improve pasting in visual mode
map('p', '"_dP', 'Better pasting in visual mode', 'v')

-- Save file
map('<C-s>', '<cmd>update<cr>', '[s]ave file')

-- console.log
map('<leader>cl', function()
  local word = vim.fn.expand '<cword>'
  vim.cmd 'norm! oconsole.log({ '
  vim.cmd(string.format('norm! a%s })', word))
end, '[c]onsole [l]og')

-- Highlight when yanking
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function() vim.hl.on_yank() end,
})

-- opens help in new tab
local group = vim.api.nvim_create_augroup('GeneralSettings', { clear = true })
vim.api.nvim_create_autocmd('BufEnter', {
  pattern = { '*.txt' },
  group = group,
  callback = function()
    if vim.api.nvim_get_option_value('buftype', { buf = 0 }) == 'help' then vim.fn.execute 'wincmd T' end
  end,
})

-- git prefix for qppfe branch commit messages
local git_group = vim.api.nvim_create_augroup('GitSettings', { clear = true })
vim.api.nvim_create_autocmd('BufEnter', {
  pattern = { '*.git/COMMIT_EDITMSG' },
  group = git_group,
  callback = function()
    if vim.fn.isdirectory '.git' ~= 0 then
      local branch = vim.fn.system "git branch --show-current | tr -d '\n'"
      if string.find(branch, 'qppfe%-%d%d%d%d%d') then
        local prefix = string.match(branch, 'qppfe%-%d%d%d%d%d')
        if prefix then vim.api.nvim_command('normal i' .. string.upper(prefix) .. ': ') end
      end
    end
  end,
})

-- extui --
require('vim._core.ui2').enable { enable = true, msg = { target = 'msg' } }
-- require('vim._core.ui2').enable {
--   enable = true, -- Whether to enable or disable the UI.
--   msg = { -- Options related to the message module.
--     ---@type string|table<string, 'cmd'|'msg'|'pager'> Default message target
--     ---or table mapping |ui-messages| kinds, triggers and IDs to a target.
--     ---Table keys are are matched as a Lua pattern to the message ID. 'default'
--     ---mapping applies to any omitted kind: { default = 'cmd', progress = 'msg' }.
--     targets = {
--       [''] = 'msg',
--       empty = 'cmd',
--       bufwrite = 'msg',
--       confirm = 'cmd',
--       emsg = 'pager',
--       echo = 'msg',
--       echomsg = 'msg',
--       echoerr = 'pager',
--       completion = 'cmd',
--       list_cmd = 'pager',
--       lua_error = 'pager',
--       lua_print = 'msg',
--       progress = 'pager',
--       rpc_error = 'pager',
--       quickfix = 'msg',
--       search_cmd = 'cmd',
--       search_count = 'cmd',
--       shell_cmd = 'pager',
--       shell_err = 'pager',
--       shell_out = 'pager',
--       shell_ret = 'msg',
--       undo = 'msg',
--       verborse = 'pager',
--       wildlist = 'cmd',
--       wmsg = 'msg',
--       typed_cmd = 'cmd',
--     },
--     cmd = { -- Options related to messages in the cmdline window.
--       -- Maximum height (rows if >=1, or % of 'lines' if <1) of messages expanded
--       -- beyond 'cmdheight'; 0.999 for full height.
--       height = 0.5,
--     },
--     dialog = { -- Options related to dialog window.
--       height = 0.5, -- Maximum height.
--     },
--     msg = { -- Options related to msg window.
--       height = 0.5, -- Maximum height.
--       timeout = 4000, -- Time a message is visible in the message window.
--     },
--     pager = { -- Options related to message window.
--       height = 0.999, -- Maximum height.
--     },
--   },
-- }

-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = 'msg',
--   callback = function()
--     local ui2 = require 'vim._core.ui2'
--     local win = ui2.wins and ui2.wins.msg
--     if win and vim.api.nvim_win_is_valid(win) then
--       vim.api.nvim_set_option_value('winhighlight', 'Normal:NormalFloat,FloatBorder:FloatBorder', { scope = 'local', win = win })
--     end
--   end,
-- })
--
-- local ui2 = require 'vim._core.ui2'
-- local msgs = require 'vim._core.ui2.messages'
-- local orig_set_pos = msgs.set_pos
-- msgs.set_pos = function(tgt)
--   orig_set_pos(tgt)
--   if (tgt == 'msg' or tgt == nil) and vim.api.nvim_win_is_valid(ui2.wins.msg) then
--     pcall(vim.api.nvim_win_set_config, ui2.wins.msg, {
--       relative = 'editor',
--       anchor = 'NE',
--       row = 1,
--       col = vim.o.columns - 1,
--       border = 'rounded',
--     })
--   end
-- end

-- prevents comments on a new line
-- vim.api.nvim_create_autocmd(
-- "BufEnter",
-- { group = group, command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o" }
-- )
