function setEditorOptions(options)
  for k, v in pairs(options) do
    vim.o[k] = v
  end
end

function setWindowOptions(options)
  for k, v in pairs(options) do
    vim.wo[k] = v
  end
end

local include = [[\v[^/]from]]
local define = [[\v^\s*<(const|function)>]]
vim.cmd [[
function! JSInclude(fname)
  let filepath = a:fname . '.js'
  let indexPath = a:fname . '/index.js'
  let found = glob(filepath, 1)
  if len(found) < 1
    let foundAsIndex = glob(indexPath, 1)
     return indexPath
   endif
   return filepath
endfunction
]]

function core_options()
  local editorOptions = {
    hidden = true, -- keep hidden buffers
    expandtab = true, -- use spaces instead of tabs
    smartcase = true, -- improve searching using '/'
    ignorecase = true, -- case insensitive on search
    backup = false, -- disable backup
    writebackup = false, -- disable backup
    swapfile = false, -- disable swapfile
    smarttab = true, -- make tab behavior smarter
    splitbelow = true, -- split below instead of above
    splitright = true, -- split right instead of left
    autowrite = true, -- autowrite buffer when it's not focused
    smartindent = true, -- smarter indentation
    startofline = false, -- don't go to the start of the line when moving to another file
    termguicolors = true, -- truecolours for better experience
    undofile = true, -- persistent undo
    inccommand = "split", -- preview window for substitute
    mouse = "a", -- enable mouse support
    clipboard = "unnamed", -- system clipboard
    shortmess = "aoOtTIc", -- disable some stuff on shortmess
    fillchars = "vert:│", -- make vertical split sign better
    shiftwidth = 2, -- set indentation width
    tabstop = 2, -- width of tab character
    softtabstop = 2, -- tabsize
    scrolloff = 3, -- scrolling offset
    pumheight = 10, -- max items to show in popup menu
    sidescrolloff = 15,
    updatetime = 100, -- CursorHold relies on this
    backupcopy = "yes", -- fix weirdness for postcss
    completeopt = "menuone,noinsert,noselect,preview", -- better completion
    wildignore = "*/node_modules/*,package-lock.json,*.snap,*/__snapshots__/*", -- ignore node_modules
    -- path = ".,src,**", -- search current directory
    path = "src/**,tests/**", -- search current directory
    suffixesadd = ".js,.scss",
    foldlevelstart = 99,
    include = include,
    includeexpr = [[JSInclude(v:fname)]],
  }

  local windowOptions = {
    wrap = false, -- dont wrap lines
    number = true, -- enable number
    relativenumber = true, -- enable relativenumber
    cursorline = true, -- enable cursorline
    signcolumn = "yes", -- enable sign column all the time
    -- foldmethod = vim.fn.nvim_treesitter#foldexpr() -- foldmethod using marker
  }

  setEditorOptions(editorOptions)
  setWindowOptions(windowOptions)
  vim.o.runtimepath = vim.o.runtimepath .. ',/usr/local/opt/fzf'

end

core_options()
