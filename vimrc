syntax on
set background=dark
call plug#begin()

" Vim plugins
Plug 'w0rp/ale'
Plug 'airblade/vim-gitgutter'
Plug 'morhetz/gruvbox'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-dirvish'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'haya14busa/is.vim'
Plug 'haya14busa/vim-asterisk'
Plug 'flaflasun/vim-nightowl'
Plug 'justinmk/vim-sneak'
Plug 'machakann/vim-highlightedyank'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
call plug#end()

" theme
set termguicolors
" colorscheme gruvbox
colorscheme nightowl

" Standard Stuff
" set number
" set relativenumber
set showcmd
set laststatus=2
set fillchars="┃"
set ignorecase
set smartcase
set gdefault
set showmatch
set incsearch
set hlsearch
set wildmode=list:full
set hidden
set splitbelow
set splitright
set clipboard=unnamed
set tabstop=2
set shiftwidth=2
set expandtab
set lazyredraw
set mouse=a
set wrap
set textwidth=80
set breakindent
set breakindentopt=shift:2
set scrolloff=3
set nobackup
set nowritebackup
set noswapfile

" wildignore
set wildignore+=**/node_modules
set wildignore+=**/lib

" Change leader key to <Space>
let mapleader = ' '

" Custom Key Mapping
inoremap jk <ESC>
cnoremap jk <C-c>
nnoremap H ^
nnoremap L $
nnoremap <Leader>; :
nnoremap <Leader>q  :q<CR>
nnoremap Q gq
nnoremap <Tab> %
vnoremap <Tab> %
nnoremap <Leader>ev :vsplit $MYVIMRC<CR>
nnoremap <Leader>sv :so %<CR>
nnoremap <Leader>ez :vsplit ~/.zshrc<CR>
nnoremap Y y$
nnoremap <Leader>s :update<CR>

" Better j/k navigation
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Ale settings
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier', 'eslint']
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_use_local_config = 1

" windows management
nnoremap <Leader>ww <C-w>w
nnoremap <Leader>wh <C-w>h
nnoremap <Leader>wj <C-w>j
nnoremap <Leader>wk <C-w>k
nnoremap <Leader>wl <C-w>l
nnoremap <Leader>wt <C-w><S-t>
nnoremap <Leader>wv <C-w>v
nnoremap <Leader>ws <C-w>s
nnoremap <Leader>w= <C-w>=

" fzf mapping
nnoremap <Leader>t :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>gst :GFiles?<CR>
nnoremap <Leader>a :Rg<Space>
nnoremap <Leader>f :Rg<Space><C-r><C-w><CR>

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

" Remove trailing spaces on write
autocmd BufWritePre * %s/\s\+$//e

" deoplete settings
let g:deoplete#enable_at_startup=1
let g:depolete#enable_smart_case=1
let g:deoplete#file#enable_buffer_path=1 "file source complete the files from the buffer path

inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end

" Change cursor in insert mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Status Line
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

set statusline=
set statusline+=\ %f
set statusline+=\%m
set statusline+=%=
set statusline+=%{LinterStatus()}
set statusline+=%l:%c:%L

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
