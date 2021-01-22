function! JSInclude(file)
  if (filereadable(a:file))
    return a:file
  else
    let l:file2=substitute(substitute(a:file,'\\.js$','','g'),'$','/index.js','g')
    return l:file2
  endif
endfunction

set shiftwidth=2 tabstop=2 softtabstop=2                                   " 2 spaces
set hidden                                                                 " keep hidden buffers
set expandtab                                                              " use spaces instead of tabs
set smartcase                                                              " improve searching using '/'
set ignorecase                                                             " case insensitive on search
set nobackup                                                               " disable backup
set nowritebackup                                                          " disable backup
set noswapfile                                                             " disable swapfile
set nosmarttab                                                               " make tab behavior smarter
set splitbelow                                                             " split below instead of above
set splitright                                                             " split right instead of left
set smartindent                                                            " smarter indentation
set nostartofline                                                          " don't go to the start of the line when moving to another file  
set undofile                                                               " persistent undo
set inccommand=split                                                       " preview window for substitute
set mouse=a                                                                " enable mouse support
set clipboard=unnamed                                                      " system clipboard
set shortmess=aoOtTIc                                                      " disable some stuff on shortmess
set fillchars=vert:│                                                       " make vertical split sign better
set scrolloff=3                                                            " scrolling offset
set pumheight=10                                                           " max items to show in popup menu
set sidescrolloff=15
set updatetime=100                                                         " CursorHold relies on this
set backupcopy=yes                                                         " fix weirdness for postcss
set completeopt=menuone,noinsert,noselect,preview                          " better completion
set wildignore=*/node_modules/*,package-lock.json,*.snap,*/__snapshots__/* " ignore node_modules
set path=src/**,tests/**                                                   " search current directory
set suffixesadd=.js,.scss
set foldlevelstart=99
set include=\v[^/]from
set includeexpr=JSInclude(v:fname)

set nowrap
set number
set relativenumber
set cursorline
set signcolumn=yes

