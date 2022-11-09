local options = {
  termguicolors = true,                         -- for iTerm
  clipboard = "unnamedplus",                    -- access system clipboard
  signcolumn = 'yes',                           -- sign column always open
  swapfile = false,                             -- swap files annoy me
  undofile = true,                              -- keep track of my 'undo's between sessions
  splitright = true,                            -- vsplit to the right
  splitbelow = true,                            -- split to the bottom
  shiftwidth = 2,                               -- number of spaces to indent
  tabstop = 2,                                  -- number of spaces to indent with <Tab>
  softtabstop = 2,                              -- number of spaces to indent with <Tab> or <BS>
  expandtab = true,                             -- use spaces (not tabs)
  number = true,                                -- show number on current line
  relativenumber = true,                        -- relative numbers for easier navigation
  scrolloff = 3,                                -- scroll offset
  sidescrolloff = 8,                            -- side scroll offset
  foldlevelstart = 99,                          -- all folds open
  wrap = false,                                 -- no wrap
  showmode = false,                             -- we don't need to see things like -- INSERT -- anymore
  cursorline = true,                            -- highlight current line
  ignorecase = true,                            -- case insensitive search
  smartcase = true,                             -- case sensitivity on when caps used
  cmdheight = 0,                                -- number of screenlines to use for command line 
-- pumheight = 10,                              -- maximum 10 lines in popup menu
-- pumblend = 17,                               -- transparent popup
-- fillchars = 'vert:│',                        -- vertical line
  laststatus = 3,                               -- global statusline
-- updatetime = 100,                            -- stop typing quickly
-- suffixesadd = '.js,.scss'                    -- help resolve gf command
-- wildmode = { "longest", "list", "full" }
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- Maybe?
-- o.shortmess:append {c = true}
-- o.shortmess:append 'c'
-- o.whichwrap:append {['<'] = true, ['>'] = true, [','] = true, h = true, l = true}
-- o.wildignore:append = '*/node_modules/*,package-lock.json,*.snap,*/__snapshots__/*'
-- vim.cmd[[set path=src/**,tests/**]]                 -- search src and tests root folders

