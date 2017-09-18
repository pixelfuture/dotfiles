execute pathogen#infect()
set nocompatible
syntax enable

" do not backup
set nobackup
set nowritebackup
set noswapfile

set showcmd	" display incomplete commands
set fillchars="" " Remove the ugly splits separator

" In many terminal emulators the mouse works just fine, thus enable it.
if has("mouse")
  set mouse=a
endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

set number " add line numbers
set relativenumber " turn on relative numbers
set ignorecase " ignore case in a pattern
set smartcase " ignore case when pattern contains lowercase letters only
set gdefault " substitute command updates all matches in a line and all if g flag is added
set showmatch " show matching bracket
set hlsearch " highlight all search pattern matches
set laststatus=2 " always show status line in all windows
set scrolloff=3 " minimal number of screen lines to keep abover and below the cursor
set hidden " allows me to change buffers even when buffers have not been saved
set wildmode=list:full " list all matches and complete first match
set splitbelow " Split a window to the right by default
set splitright " Split a window to the right by default
set clipboard=unnamed " Copy to OS X clipboard

" Don't use Ex mode, use Q for formatting
map Q gq

" Use tab key to navigate between bracket pairs
nnoremap <Tab> %
vnoremap <Tab> %

" Handle long lines
set wrap
set textwidth=120
set formatoptions=qrn1

" Set color of ColorColumn
" set colorcolumn=125
highlight ColorColumn ctermbg=7
call matchadd('ColorColumn', '\%81v', 100)

" jj or jk for escaping
inoremap jj <ESC>
inoremap jk <ESC>
cnoremap jj <C-c>
cnoremap jk <C-c>

" Change leader key to <Space> and disable moving with space in normal mode
map <Space> <Leader>

set tabstop=2 " show existing tab with 2 spaces width
set shiftwidth=2 " when editing with '>', use 2 spaces width
set expandtab " On pressing tab, insert 2 spaces

" Open nerd tree
let NERDTreeShowLineNumbers=1
nmap <Leader>nn :NERDTreeToggle<CR>
nmap <Leader>nf :NERDTreeFind<CR>

" airline settings
let g:airline_theme="powerlineish"
let g:airline_powerline_fonts = 1
if !exists("g:airline_symbols")
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline#extensions#tabline#enabled = 1

" ale settings
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_set_highlights = 0

" set Prettier up to run on save
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = [
\ 'eslint'
\]
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5 --no-semi'
" Run RainbowParentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

set tags=./.tags;

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
nnoremap <Leader>wd <C-w>c " Close a window
nnoremap <Leader>wq <C-w>q " Close a window
nnoremap <Leader>wr <C-W>r " Rotate windows. First window becomes the second, etc.
nnoremap <Leader>wx <C-w>x " Exchange window with the next one
nnoremap <Leader>wh <C-w>h " Move to window on the left
nnoremap <Leader>wj <C-w>j " Move to window on the bottom
nnoremap <Leader>wk <C-w>k " Move to window on the top
nnoremap <Leader>wl <C-w>l " Move to window on the right
nnoremap <Leader>wt <C-w><S-t> " Open window in a tab

" window resizing
nnoremap <Leader>w= <C-w>= " Equal size window
nnoremap <Leader>wH <C-w>5< " Resize window down horizontally
nnoremap <Leader>wL <C-w>5> " Resize window up horizontally
nnoremap <Leader>wJ :resize +5<CR> " Resize window up vertically
nnoremap <Leader>wK <:resize -5<CR> " Resize window down vertically
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

" Save file using leader
nnoremap <Leader>s :w<CR>

" Easy Motion configuration
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
" nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" use these mappings as default search and sometimes want to move cursor with
" EasyMotion.
function! s:incsearch_config(...) abort
  return incsearch#util#deepextend(deepcopy({
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {
  \     "\<CR>": '<Over>(easymotion)'
  \   },
  \   'is_expr': 0
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))

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
nnoremap <Leader>a :Ack!<Space>

" netrw config
let g:netrw_liststyle = 3 " Change style of netrw
" let g:netrw_banner = 0 " Remove top banner from netrw

" CursorLineCurrentWindow
set cursorline

" gets current path
cnoremap <expr> %%  getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Easy quit
nnoremap <Leader>q  :q<CR>

map <Leader>' :shell<CR> " Open shell in vim
nnoremap <Leader>ev :vsplit $MYVIMRC<CR> " Edit vimrc

" Fix typos
iabbrev adn and
iabbrev waht what
iabbrev tehn then

" Create shortcuts
iabbrev imp import
iabbrev conn import { connect } from 'react-redux'

" Command-P
let g:CommandTCancelMap = ['<ESC>', '<C-c>']

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

