" Use pathogen to add plugins - TODO: Vim 8 does this already
execute pathogen#infect()
packloadall                           " Load packages in pack directory

set termguicolors                     " use GUI colors for terminal – 24bit true color (16 million)
colorscheme neodark                   " set neodark as the theme
let g:neodark#background = '#202020'  " make the background darker

set nobackup                          " do not backup
set nowritebackup                     " do not need backup files
set noswapfile                        " do not want swap files everywhere

set showcmd	                          " display incomplete commands
set laststatus=2                      " always show status line in all windows
set belloff=all                       " Turn off the bell
set fillchars="┃"                     " Replace ugly splits with this super long character

set number                            " add line numbers
set relativenumber                    " turn on relative numbers

set ignorecase                        " ignore case in a search pattern
set smartcase                         " ignore case when pattern contains lowercase letters only
set gdefault                          " substitute command updates all matches in a line and all if g flag is added
set showmatch                         " show matching bracket
set hlsearch                          " highlight all search pattern matches
set wildmode=list:full                " list all matches and complete first match

set hidden                            " allows me to change buffers even when buffers have not been saved
set splitbelow                        " Split a window to the right by default
set splitright                        " Split a window to the right by default
set clipboard=unnamed                 " Copy to OS X clipboard

set lazyredraw                        " don’t update screen during macro playback
set mouse=a                           " activate mouse
set tags=./.tags;                     " I love tags
set formatoptions=jn                  " format options. this will probably change
set highlight+=@:ColorColumn          " ~/@ at end of window, 'showbreak'

set wrap                              " wrap
set textwidth=120                     " maximum allowed characters
set breakindent                       " indent wrapped lines
set breakindentopt=shift:2            " emphasize broken lines by indenting them
set scrolloff=3                       " minimal number of screen lines to keep abover and below the cursor

set tabstop=2                         " show existing tab with 2 spaces width
set shiftwidth=2                      " when editing with '>', use 2 spaces width
set expandtab                         " On pressing tab, insert 2 spaces

if exists('+colorcolumn')
  " Highlight up to 255 columns (this is the current Vim max) beyond 'textwidth'
  let &l:colorcolumn='+' . join(range(0, 254), ',+')
endif


" Don't use Ex mode, use Q for formatting
map Q gq

" Use tab key to navigate between bracket pairs
nnoremap <Tab> %
vnoremap <Tab> %

" jj or jk for escaping
inoremap jj <ESC>
inoremap jk <ESC>
cnoremap jj <C-c>
cnoremap jk <C-c>

" Change leader key to <Space> and disable moving with space in normal mode
let mapleader = ' '

" ale settings
" let g:ale_lint_on_save = 1
" let g:ale_lint_on_text_changed = 'never'
" let g:ale_set_highlights = 0

" set Prettier up to run on save
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = [
\ 'eslint'
\]
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5 --no-semi'


" http://blog.petrzemek.net/2016/04/06/things-about-vim-i-wish-i-knew-earlier/
" better jk normally but don't remap when it's called with a count
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" remap beginning and end of line to home row keys
noremap H ^
noremap L $

" quick command mode
nnoremap <Leader>; :

" windows management
nnoremap <Leader>ww <C-w>w " Go to next window
nnoremap <Leader>wh <C-w>h " Move to window on the left
nnoremap <Leader>wj <C-w>j " Move to window on the bottom
nnoremap <Leader>wk <C-w>k " Move to window on the top
nnoremap <Leader>wl <C-w>l " Move to window on the right
nnoremap <Leader>wt <C-w><S-t> " Open window in a tab

" window resizing
nnoremap <Leader>w= <C-w>= " Equal size window
nnoremap <Leader>ws <C-w>s " Split window horizontally
nnoremap <Leader>wv <C-w>v " Split window vertically

" Buffer
nnoremap <Leader>bp :bprevious<CR>
nnoremap <Leader>bn :bnext<CR>
nnoremap <Leader>bf :bfirst<CR>
nnoremap <Leader>bl :blast<CR>
nnoremap <Leader>bd :bd<CR>
nnoremap <Leader>bk :bw<CR>

" Remove trailing spaces on write
autocmd BufWritePre * %s/\s\+$//e

" Resize buffer windows when Vim is resized
autocmd VimResized * execute "normal! \<c-w>="

" Save file using leader
nnoremap <Leader>s :w<CR>

" Easy Motion configuration
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
map <Leader><Leader>f <Plug>(easymotion-overwin-f)

" Turn on case insensitive feature
" let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)

" use these mappings as default search and sometimes want to move cursor with
" EasyMotion.
" function! s:incsearch_config(...) abort
"   return incsearch#util#deepextend(deepcopy({
"   \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
"   \   'keymap': {
"   \     "\<CR>": '<Over>(easymotion)'
"   \   },
"   \   'is_expr': 0
"   \ }), get(a:, 1, {}))
" endfunction

" noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
" noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
" noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))

" Integrate pulse plugin with incsearch
let g:vim_search_pulse_disable_auto_mappings = 1
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)<Plug>Pulse
map N  <Plug>(incsearch-nohl-N)<Plug>Pulse
map *  <Plug>(incsearch-nohl-*)<Plug>Pulse
map #  <Plug>(incsearch-nohl-#)<Plug>Pulse
map g* <Plug>(incsearch-nohl-g*)<Plug>Pulse
map g# <Plug>(incsearch-nohl-g#)<Plug>Pulse

" Pulses the first match after hitting the enter keyan
autocmd! User IncSearchExecute
autocmd User IncSearchExecute :call search_pulse#Pulse()

" Easy Fuzzy Search with Easy Motion integration
function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzyword#converter()],
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())

" Ack config
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>src<Left><Left><Left><Left><Space>

let g:netrw_liststyle = 3 " Change style of netrw

" CursorLineCurrentWindow
set cursorline

" gets current path
cnoremap <expr> %%  getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Easy quit
nnoremap <Leader>q  :q<CR>

" Open shell in vim
map <Leader>' :shell<CR>

" Edit vimrc
nnoremap <Leader>ev :vsplit $MYVIMRC<CR>

" tern mapping
nnoremap T :TernDef<CR>

" Command-T
let g:CommandTCancelMap = ['<ESC>', '<C-c>']
let g:CommandTWildIgnore=&wildignore . ",*/node_modules,*/coverage,*/dist,*/errorShots,*/bin,*/interfaces,*/server,*/build"
set path+=src/**,tests/**

" Change cursor in insert mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<Tab>"
let g:UltiSnipsJumpForwardTrigger = "<Tab>"
let g:UltiSnipsJumpBackwardTrigger = "<S-Tab>"
let g:UltiSnipsEditSplit = 'vertical'
let g:UltiSnipsSnippetsDir='/Users/Rodrigo/.vim/mysnippets'
let g:UltiSnipsSnippetDirectories=["mysnippets"]

let g:powerline_left_separator = "\uE0B0"
let g:powerline_right_separator = "\uE0B2"
let g:powerline_branch = "\uE0A0"
let g:spacer = " "

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

"  right separator
"  left separator
" green     #84B97C
" blue      #639EE4
" yellow    #D4B261
" red       #DC657D
" purple    #B888E2

set statusline =
set statusline+=\ %n%{g:spacer}
set statusline+=%#LineNr#
set statusline+=
set statusline+=%#VertSplit#
set statusline+=%{g:spacer}
set statusline+=%f
set statusline+=\%m
set statusline+=%{g:spacer}
set statusline+=%=
" set statusline+=%y
set statusline+=%{LineNoIndicator()}
set statusline+=%{g:spacer}
set statusline+=%{LinterStatus()}
set statusline+=%{g:spacer}
set statusline+=%3*%{empty(fugitive#head())?'':g:spacer}
set statusline+=%3*%{empty(fugitive#head())?'':g:powerline_branch}
set statusline+=%3*%{empty(fugitive#head())?'':fugitive#head()}
set statusline+=%3*%{empty(fugitive#head())?'':g:spacer}

" Default cursor line color
hi CursorLine guibg=#2B2B2B
" Change CursorLine Color when in insert mode
autocmd InsertEnter * highlight CursorLine guibg=#1e2b1e
" Revert CursorLine Color back when in normal mode
autocmd InsertLeave * highlight CursorLine guibg=#2B2B2B


