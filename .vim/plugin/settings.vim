set clipboard=unnamed                                  " Yank to system clipboard
set hidden                                             " Allow hiding unsaved buffers
set mouse=a                                            " Mouse
set ignorecase                                         " Ignore case in search patterns
set smartcase                                          " Smart case in searc patterns
set splitbelow                                         " New window below split
set splitright                                         " New window right of split
set wildmenu                                           " Command completion
set incsearch                                          " Search
set autoread                                           " Autoreload when file changes outside of vim
set backspace=indent,eol,start                         " Enable backspace
set ruler                                              " Show line and column number of cursor position
set cursorline                                         " highlight current line      
set synmaxcol=200                                      " don't bother syntax highlighting long lines
set number                                             " Show numbers in left column
set laststatus=2                                       " Show statusline
set hlsearch                                           " Highlight search matches

if !has('nvim')
  " Support resizing tmux
  set ttymouse=xterm2
endif

" Indent settings
set smartindent
set expandtab                                          " Spaces instead of tabs
set tabstop=2 shiftwidth=2 softtabstop=2               " 2 spaces
set breakindent                                        " Indent wrapped lines
set showbreak=↪\                                       " Prefix wrapped rows with arrow
set textwidth=80                                       " Wrap after 80 characters
set scrolloff=1                                        " Minimal number of screen lines to keep above and below the cursor.
set sidescrolloff=5                                    " Minimal number of screen lines to keep to the left and right of cursor. 

" Backup and history settings
set nobackup                                           " Enable backup
set nowritebackup                                      " Enable backup
set undofile                                           " Enable persistent undo
set undodir=~/.local/share/nvim/undo//
set noswapfile
" set directory=~/.local/share/nvim/swap//
" set backupdir=~/.local/share/nvim/backup//

" Wildignore settings
set wildignore+=*/node_modules/*,package-lock.json     " ignore node_modules directory

" Options for file search with gf/:find
set path=.,src                                          " Search current directory's whole tree
set suffixesadd=.js,.scss
function! LoadMainNodeModule(fname)
  let nodeModules = "./node_modules/"
  let packageJsonPath = nodeModules . a:fname . "/package.json"
  let packageIndex = nodeModules . a:fname . "/index.js"

  if filereadable(packageIndex)
    return packageIndex
  endif
  if filereadable(packageJsonPath)
    return nodeModules . a:fname . "/" . json_decode(join(readfile(packageJsonPath))).main
  else
    return nodeModules . a:fname
  endif
endfunction
set includeexpr=LoadMainNodeModule(v:fname)

" Folds
set foldmethod=syntax                                  " syntax highlighting specifies folds
set foldlevelstart=99                                  " start file with all folds open

" Fixes ESC delay
set timeoutlen=1000 
set ttimeoutlen=0 

" Change cursor in insert mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
