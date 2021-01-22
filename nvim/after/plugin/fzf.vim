" Search Neovim Files .config/nvim
command! -bang -nargs=0 -complete=dir EditNeovim call fzf#vim#files('~/.config/nvim', fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)
" Search .scripts directory
command! -bang -nargs=0 -complete=dir EditScripts call fzf#vim#files('~/.scripts', fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)
" Search notes markdown files
command! -bang -nargs=0 -complete=dir EditNotes call fzf#vim#files('~/my_site', fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>fb :Buffers<CR>
nnoremap <Leader>fz :BLines<CR>
nnoremap <Leader>fl :Lines<CR>
nnoremap <Leader>fw :Rg<Space><C-r><C-w><CR>
nnoremap <Leader>fa :Rg<Space>
nnoremap <Leader>f' :Marks<CR>
nnoremap <Leader>fh :Helptags!<CR>
nnoremap <Leader>fc :Colors<CR>
nnoremap <Leader>fC :Commands<CR>
nnoremap <Leader>fM :Maps<CR>
nnoremap <Leader>ft :Tags<CR>
nnoremap <Leader>gs :GFiles?<CR>
nnoremap <Leader>gb :GBranch<CR>
nnoremap <Leader>gc :BCommits<CR>
nnoremap <Leader>gC :Commits<CR>
nnoremap <Leader>fo :History<CR>
nnoremap <Leader>fH :History:<CR>
nnoremap <Leader>en :EditNeovim<CR>
nnoremap <Leader>es :EditScripts<CR>
nnoremap <Leader>em :EditNotes<CR>

