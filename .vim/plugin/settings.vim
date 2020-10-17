set mouse=a
set clipboard=unnamed
set hidden
set ignorecase
set smartcase
set inccommand=split
set splitbelow
set splitright
set cursorline
set number
set relativenumber
" set synmaxcol=200                                      " don't bother syntax highlighting long lines

" Indent settings
" set smartindent
set expandtab                                          " Spaces instead of tabs
set tabstop=2 shiftwidth=2 softtabstop=2               " 2 spaces
set breakindent                                        " Indent wrapped lines
set showbreak=↪\                                       " Prefix wrapped rows with arrow
set textwidth=80                                       " Wrap after 80 characters

" Backup and history settings
set nobackup                                           " Enable backup
set nowritebackup                                      " Enable backup
set undofile                                           " Enable persistent undo
set noswapfile

" Wildignore settings
set wildignore+=*/node_modules/*,package-lock.json     " ignore node_modules directory

" Options for file search with gf/:find
set path=.,src                                          " Search current directory's whole tree
set path+=**
set suffixesadd=.js,.scss
" function! LoadMainNodeModule(fname)
"   echo a:fname
"   let src = "./src/"
"   let nodeModules = "./node_modules/"
"   let packageJsonPath = nodeModules . a:fname . "/package.json"
"   let srcFile = src . a:fname . ".js"
"   let srcIndex = src . a:fname . "/index.js"
"   let packageIndex = nodeModules . a:fname . "/index.js"

"   if filereadable(srcFile)
"     return srcFile
"   endif
"   if filereadable(srcIndex)
"     return srcIndex
"   endif
"   if filereadable(packageIndex)
"     return packageIndex
"   endif
"   if filereadable(packageJsonPath)
"     return nodeModules . a:fname . "/" . json_decode(join(readfile(packageJsonPath))).main
"   else
"     return nodeModules . a:fname
"   endif
" endfunction
" set includeexpr=LoadMainNodeModule(v:fname)

" Folds
" set foldmethod=syntax                                  " syntax highlighting specifies folds
set foldlevelstart=99                                  " start file with all folds open

" Fixes ESC delay
set timeoutlen=1000 
set ttimeoutlen=0 

" Change cursor in insert mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

if executable("rg")
  set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
  set grepformat^=%f:%l:%c:%m
  command! -nargs=+ MyGrep execute 'silent grep! <args>' | copen 33
endif
