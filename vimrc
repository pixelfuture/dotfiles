filetype plugin indent on
syntax on

" packadd minpac
" call minpac#init()

" call minpac#add('airblade/vim-gitgutter')
" call minpac#add('docunext/closetag.vim')
" call minpac#add('haya14busa/is.vim')
" call minpac#add('jiangmiao/auto-pairs')
" call minpac#add('junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' })
" call minpac#add('junegunn/fzf.vim')
" call minpac#add('justinmk/vim-dirvish')
" call minpac#add('k-takata/minpac', {'type': 'opt'})
" call minpac#add('marijnh/tern_for_vim')
" call minpac#add('mxw/vim-jsx')
" call minpac#add('pangloss/vim-javascript')
" call minpac#add('tpope/vim-commentary')
" call minpac#add('tpope/vim-eunuch')
" call minpac#add('tpope/vim-fugitive')
" call minpac#add('tpope/vim-repeat')
" call minpac#add('tpope/vim-surround')
" call minpac#add('tpope/vim-unimpaired')
" call minpac#add('w0rp/ale')
" call minpac#add('Shougo/deoplete.nvim')
" call minpac#add('styled-components/vim-styled-components')
" if !has('nvim')
"   call minpac#add('roxma/nvim-yarp')
"   call minpac#add('roxma/vim-hug-neovim-rpc')
" endif
" call minpac#add('carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' })

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#file#enable_buffer_path=1 "file source complete the files from the buffer path instead of current directory
" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end
" tern
if exists('g:plugs["tern_for_vim"]')
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1
  autocmd FileType javascript setlocal omnifunc=tern#Complete
endif
autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>
" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><S-tab> pumvisible() ? "\<c-p>" : "\<S-tab>"
command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update()
command! PackClean packadd minpac | source $MYVIMRC | call minpac#clean()

" Standard stuff
set number                            " line numbers
set relativenumber                    " relative line numbers
set showcmd   	                      " display incomplete commands
set laststatus=2                      " always show status line. all windows
set belloff=all                       " Turn off the bell
set fillchars="┃"                     " Replace ugly splits with this character
set ignorecase                        " ignore case in a search pattern
set smartcase                         " ignore case if all lowercase pattern
set gdefault                          " substitute flag 'g' on by default
set showmatch                         " show matching bracket
set incsearch                         " incrementally search
set hlsearch                          " highlight all search pattern matches
set wildmode=list:full                " list all matches and complete first match
set hidden                            " hide unsaved buffers
set splitbelow                        " Split a window to the bottom by default
set splitright                        " Split a window to the right by default
set clipboard=unnamed                 " Copy to OS X clipboard
set tabstop=2                         " show existing tab with 2 spaces width
set shiftwidth=2                      " when editing with '>', use 2 spaces width
set expandtab                         " On pressing tab, insert 2 spaces
set lazyredraw                        " don’t update screen during macro playback
set mouse=a                           " activate mouse
set formatoptions=jn                  " format options. this will probably change
" set highlight+=@:ColorColumn          " ~/@ at end of window, 'showbreak'
set wrap                              " wrap
set textwidth=120                     " maximum allowed characters
set breakindent                       " indent wrapped lines
set breakindentopt=shift:2            " emphasize broken lines by indenting them
set scrolloff=3                       " 3 screen lines minimum above and below
set nobackup                          " do not backup
set nowritebackup                     " do not need backup files
set noswapfile                        " do not want swap files everywhere
set path=src/**                         " makes it easier to :find files

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
" search and replace
nnoremap <Leader>/ :%s/\V/gc<Left><Left><Left>
" console.log word underneath your cursor
nnoremap <Leader>c yiwoconsole.log('<C-r>*', <C-r>*)<Esc>
nnoremap <Leader>slc iimport React from 'react'<CR>import PropTypes from 'prop-types'<CR><CR>const propTypes = {}<CR>const defaultProps = {}<CR><CR>const MyComponent = () => (<CR><p></p><CR>)<CR><CR>MyComponent.propTypes = propTypes<CR>MyComponent.defaultProps = defaultProps<CR><CR>export default MyComponent<ESC>
nnoremap <Leader>b :ls<CR>:b<Space>

" Better j/k navigation
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

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
" nnoremap <Leader>b :Buffers<CR>
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

" Change cursor in insert mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Let vim-jsx handle JSX in `.js` files.
let g:jsx_ext_required = 0

" dirvish config
let g:dirvish_mode = 2
let g:dirvish_relative_paths = 1

" set Prettier up to run on save
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier', 'eslint']
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5 --no-semi --print-width 80'

" italic comments
highlight Comment cterm=italic
highlight htmlArg cterm=italic

" Status Line
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? '' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction
let g:spacer = " "
let g:powerline_branch = "\uE0A0"
set statusline =
set statusline+=%4*\ %l
set statusline+=%2*\ %f
set statusline+=\%m
set statusline+=%{g:spacer}
set statusline+=%=
set statusline+=%{g:spacer}
set statusline+=%3*%{LinterStatus()}
set statusline+=%{g:spacer}
set statusline+=%1*%{empty(fugitive#head())?'':g:spacer}
set statusline+=%1*%{empty(fugitive#head())?'':g:powerline_branch}
set statusline+=%1*%{empty(fugitive#head())?'':fugitive#head()}
set statusline+=%1*%{empty(fugitive#head())?'':g:spacer}
set statusline+=%4*\ %n
set statusline+=%{g:spacer}

hi User1 guifg=#CCCCCC guibg=#333333
hi User2 guifg=#D4B261
hi User3 guifg=#DC657D
hi User4 guifg=#639EE4
hi User5 guifg=#202020 guibg=#333333

let g:completor_node_binary = '/usr/local/opt/node@6/bin/node'

runtime macros/matchit.vim

