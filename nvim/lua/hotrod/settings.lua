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
    shortmess = "cs", -- disable some stuff on shortmess
    fillchars = "vert:│", -- make vertical split sign better
    shiftwidth = 2, -- set indentation width
    tabstop = 2, -- width of tab character
    softtabstop = 2, -- tabsize
    scrolloff = 3, -- scrolling offset
    pumheight = 10, -- max items to show in popup menu
    sidescrolloff = 15,
    updatetime = 100, -- CursorHold relies on this
    backupcopy = "yes", -- fix weirdness for postcss
    completeopt='menuone,noinsert,noselect', -- better completion
    wildignore = '*/node_modules/*,package-lock.json', -- ignore node_modules
    path = '.,src,**', -- search current directory
    suffixesadd = '.js,.scss',
    foldlevelstart = 99,
  }

  local windowOptions = {
    wrap = false, -- dont wrap lines
    number = true, -- enable number
    relativenumber = true, -- enable relativenumber
    cursorline = true, -- enable cursorline
    signcolumn = "yes", -- enable sign column all the time
    foldmethod = "marker", -- foldmethod using marker
  }

  setEditorOptions(editorOptions)
  setWindowOptions(windowOptions)
end

core_options()
