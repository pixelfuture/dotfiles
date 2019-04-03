function! PackInit() abort
  packadd minpac
  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  " Additional plugins here.
  " ESLint and Prettier on Save. ESLint asynchronously
  call minpac#add('w0rp/ale')
  " Show git status per line
  call minpac#add('airblade/vim-gitgutter')
  " Fuzzy search for files or search terms
  call minpac#add('junegunn/fzf.vim')
  " File navigation
  call minpac#add('justinmk/vim-dirvish')
  " Adds Vim functionality Like Delete, Move
  call minpac#add('tpope/vim-eunuch')
  " Add Git features to Vim
  call minpac#add('tpope/vim-fugitive')
  call minpac#add('tpope/vim-rhubarb')
  " Adds vim keyboard shortcuts using []
  call minpac#add('tpope/vim-unimpaired')
  " Improves Vim Repeat command
  call minpac#add('tpope/vim-repeat')
  " Comment code using gcc
  call minpac#add('tpope/vim-commentary')
  " Automatically indent based on file
  call minpac#add('tpope/vim-sleuth')
  " Adds better JavaScript syntax highlighting
  call minpac#add('pangloss/vim-javascript')
  call minpac#add('mxw/vim-jsx')
  " Stop search highlighting automatically
  call minpac#add('haya14busa/is.vim')
  " Improve Vim’s asterisk command
  call minpac#add('haya14busa/vim-asterisk')
  " Easily navigate using s{char}{char} for down
  " Easily navigate using S{char}{char} for up
  call minpac#add('justinmk/vim-sneak')
  " Highlight whatever just got yanked
  call minpac#add('machakann/vim-highlightedyank')
  " Syntax highlighting for .pug files
  call minpac#add('digitaltoad/vim-pug')
  " Easily add parentheses, brackets, quotes, XML tags
  call minpac#add('tpope/vim-surround')
  " Syntax highlighting for styled-components
  call minpac#add('styled-components/vim-styled-components', { 'branch': 'main' })
  " Use Emmet <C-y>, (don’t forget the comma)
  call minpac#add('mattn/emmet-vim')
  " Inserts pairs of [] () {} and quotes
  " Deletes the pair automatically
  " Skips closed character automatically just like in moderin editor
  " Fast wrap mapped to <C-e> e.g. (|)Text === (Test)
  call minpac#add('jiangmiao/auto-pairs')
  " GraphQL support
  call minpac#add('jparise/vim-graphql')
  " Automatically add import statements or fix import statements
  " <Leader>j :ImportJSWord Import the module underneath cursor
  " <Leader>i :ImportJSFix Import missing modules and remove unused modules
  " <Leader>g :ImportJSGoto Got to the module of the variable under the cursor
  " It required npm i -g import-js
  call minpac#add('Galooshi/vim-import-js')
  " Adds ability to use multiple cursors <C-n>
  " I mapped <Leader>n to select all
  call minpac#add('terryma/vim-multiple-cursors')
  " Adds vertical lines to file
  call minpac#add('Yggdroot/indentLine')
  " better JSON formatter
  call minpac#add('elzr/vim-json')
  " Markdown Preview
  call minpac#add('iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  })
  " Better Comments
  call minpac#add('suy/vim-context-commentstring')
  " Save previously yanks. Cycle through using <C-p>
  call minpac#add('vim-scripts/YankRing.vim')
  " Automatically refresh files edited from other programs
  call minpac#add('djoshea/vim-autoread')
  " Themes
  call minpac#add('haishanh/night-owl.vim')
  " call minpac#add('morhetz/gruvbox')

  " code completion
  call minpac#add('neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}})
endfunction

command! PackUpdate call PackInit() | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  call PackInit() | call minpac#clean()
command! PackStatus call PackInit() | call minpac#status()

" Set colorscheme
syntax enable
set termguicolors
colorscheme night-owl

" Misc
set clipboard=unnamed           " Yank to system clipboard
set fillchars=eob:^             " Fill characters for empty lines
set hidden                      " Allow hiding unsaved buffers
set lazyredraw                  " Don't redraw the screen during batch execution
set mouse=a                     " Mouse
set ignorecase                  " Ignore case in search patterns
set smartcase                   " Smart case in searc patterns
set splitbelow                  " New window below split
set splitright                  " New window right of split
set shortmess+=I                " No startup splash screen
set pumblend=20                 " Neovim rocks

" Indent settings
filetype plugin indent on        " Enable loading indent file
set expandtab                    " Spaces instead of tabs
set shiftwidth=2                 " Indent with 2 spaces
set softtabstop=2                " Insert 2 spaces with tab key
set tabstop=2                    " Insert 2 spaces with tab key

" Wrap settings
set breakindent                  " Indent wrapped lines
set showbreak=↪\                 " Prefix wrapped rows with arrow
set textwidth=80                 " Wrap after 80 characters
set wrap                         " Wrap lines

" Define extra 'list' display characters
set listchars+=extends:>         " Unwrapped text to screen right
set listchars+=precedes:<        " Unwrapped text to screen left
set listchars+=tab:>-            " Tab characters, preserve width
set listchars+=trail:_           " Trailing spaces
silent! set listchars+=nbsp:+    " Non-breaking spaces

" Backup and history settings
set backup                       " Enable backup
set undofile                     " Enable persistent undo
set undodir=~/.local/share/nvim/undo//
set directory=~/.local/share/nvim/swap//
set backupdir=~/.local/share/nvim/backup//

" Wildignore settings
" set wildmode=list:longest,full
set wildignore+=*/node_modules/*,package-lock.json,yarn.lock
set wildoptions=pum

" Options for file search with gf/:find
set path-=/usr/include  " Let the C/C++ filetypes set that
set path+=**            " Search current directory's whole tree

" Change leader key to <Space>
let mapleader = ' '

" Custom Key Mapping
inoremap jk <ESC>
nnoremap H ^
nnoremap L $
nnoremap <Leader>; :
nnoremap <Leader>q :q<CR>
nnoremap Q gq
nnoremap <Leader>ev :tabe ~/.config/nvim/init.vim<CR>
nnoremap <Leader>r :so $MYVIMRC<CR>
nnoremap <Leader>ez :tabe ~/.zhrc<CR>
nnoremap <Leader>en :vsplit ~/notes.txt<CR>
nnoremap Y y$
nnoremap <Leader>s :update<CR>
nnoremap <Leader>/ :<C-U>vimgrep /\c/ **<S-Left><S-Left><Right>
nnoremap <Leader>? :<C-U>helpgrep \c<S-Left>
nnoremap <Leader>j :<C-U>buffers<CR>:buffer<Space>
nnoremap <Leader>h :<C-U>history :<CR>
vnoremap <leader>p "_dP
let g:multi_cursor_select_all_word_key = '<Leader>n'

" Better j/k navigation
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Terminal remapping
tnoremap <Esc> <C-\><C-n>

" Windows management
nnoremap <Leader>ww <C-w>w
nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l
tnoremap <M-h> <C-\><C-n><C-w>h
tnoremap <M-j> <C-\><C-n><C-w>j
tnoremap <M-k> <C-\><C-n><C-w>k
tnoremap <M-l> <C-\><C-n><C-w>l
nnoremap <M-=> <C-w>=
nnoremap <Leader>wt <C-w><S-t>
nnoremap <Leader>wv <C-w>v
nnoremap <Leader>ws <C-w>s

" Folds
set foldmethod=syntax " syntax highlighting specifies folds
set foldlevelstart=99 " start file with all folds open

" Python paths
let g:python_host_prog = "/usr/local/bin/python2"
let g:python3_host_prog = "/usr/local/bin/python3"

" fzf mapping
nnoremap <Leader>t :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>gst :GFiles?<CR>
nnoremap <Leader>a :Rg<Space>
nnoremap <Leader>f :Rg<Space><C-r><C-w><CR>

" Add fzf as runtime path
set rtp+=/usr/local/opt/fzf

" Use ripgrep to search for word in project
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --smart-case --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" Files command with preview window
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" Choose RipGrep for grep
if executable("rg")
  set grepprg=rg\ --vimgrep\ --no-heading\ -g\ '!*lock*'
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" Ale settings
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['eslint', 'prettier']
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_set_signs = 0
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_delay = 0
let g:ale_virtualtext_cursor = 1 "neovim virtualtext when it is released

au VimEnter,BufEnter,ColorScheme *
      \ exec "hi! ALEInfoLine
        \ guifg=".(&background=='light'?'#808000':'#ffff00')."
        \ guibg=".(&background=='light'?'#ffff00':'#555500') |
      \ exec "hi! ALEWarningLine
        \ guifg=".(&background=='light'?'#808000':'#ffff00')."
        \ guibg=".(&background=='light'?'#ffff00':'#555500' )|
      \ exec "hi! ALEErrorLine
        \ guifg=".(&background=='light'?'#808000':'#ff0000')."
        \ guibg=".(&background=='light'?'#ffff00':'#550000')

" vim-asterisk settings
map *   <Plug>(asterisk-*)<Plug>(is-nohl-1)
map #   <Plug>(asterisk-#)<Plug>(is-nohl-1)
map g*  <Plug>(asterisk-g*)<Plug>(is-nohl-1)
map g#  <Plug>(asterisk-g#)<Plug>(is-nohl-1)
map z*  <Plug>(asterisk-z*)<Plug>(is-nohl-1)
map gz* <Plug>(asterisk-gz*)<Plug>(is-nohl-1)
map z#  <Plug>(asterisk-z#)<Plug>(is-nohl-1)
map gz# <Plug>(asterisk-gz#)<Plug>(is-nohl-1)

" vim-sneak settings
let g:sneak#label = 1

"indentline config
let g:indentLine_char = "│"

" gitgutter config
highlight GitGutterAdd    guifg=#009900 guibg=<X> ctermfg=Green
highlight GitGutterChange guifg=#bbbb00 guibg=<X> ctermfg=Yellow
highlight GitGutterDelete guifg=#ff2222 guibg=<X> ctermfg=Red

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" tab for autocompletion
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" Find references
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Add quotes back on JSON files
let g:vim_json_syntax_conceal=0

" auto-pairs config
" let g:AutoPairsShortcutFastWrap = '<C-e>'

"statusline
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? '' : printf(
    \   ' %dW %dE ',
    \   all_non_errors,
    \   all_errors
    \)
endfunction

function! ActiveStatus() abort
  let statusline=""
  let statusline.="%4*\ %n"
  let statusline.="%{fugitive#head()!=''?'\ \ '.fugitive#head().'\ ':''}"
  let statusline.="%0*"
  let statusline.="%0*\ %f"
  let statusline.="%2*\ %m" 
  let statusline.="%0*%="
  let statusline.="%{LinterStatus()}"
  let statusline.="%3*%y\ "
  let statusline.="%l:%c:%L"

  return statusline
endfunction

function! InActiveStatus() abort
  let statusline=""
  let statusline.=" %n"
  let statusline.="%{fugitive#head()!=''?'\ \ '.fugitive#head().'\ ':''}"
  let statusline.=" "
  let statusline.=" %f"
  let statusline.=" %m" 
  let statusline.="%="
  let statusline.="%{LinterStatus()}"
  let statusline.="%y "
  let statusline.="%l:%c:%L"

  return statusline
endfunction

" Color Overrides
hi TabLine           guifg=#666666 guibg=#011627 gui=none
hi TabLineSel        guifg=#ecc48d guibg=#011627 gui=bold
hi TabLineFill       guifg=#999999 guibg=#011627 gui=none
hi StatusLine        guifg=#ecc48d guibg=NONE    gui=none
hi StatusLineNC      guifg=#666666 guibg=NONE    gui=none
hi User1             guifg=#999    guibg=NONE    gui=none
hi User2             guifg=#addb67 guibg=NONE    gui=none
hi User3             guifg=#82aaff guibg=NONE    gui=none
hi User4             guifg=#333333 guibg=#ecc48d gui=none
hi jsTemplateString  guifg=#addb67 guibg=NONE gui=NONE
hi xmlAttrib         guifg=#addb67 guibg=NONE gui=italic

set statusline=%!ActiveStatus()
augroup status
  autocmd!
  autocmd WinEnter * setlocal statusline=%!ActiveStatus()
  autocmd WinLeave * setlocal statusline=%!InActiveStatus()
augroup END

" Vim Fugitive Merge Conflict
nnoremap <Leader>gdh :diffget //2<CR>
nnoremap <Leader>gdl :diffget //3<CR>

" Github Enterprise settings
let g:github_enterprise_urls = ['https://github.cms.gov']
