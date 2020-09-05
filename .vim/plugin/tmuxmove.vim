function! TmuxMove(direction)
        let wnr = winnr()
        silent! execute 'wincmd ' . a:direction
        " If the winnr is still the same after we moved, it is the last pane
        if wnr == winnr()
                call system('tmux select-pane -' . tr(a:direction, 'phjkl', 'lLDUR'))
        end
endfunction

nnoremap <silent> <M-h> :call TmuxMove('h')<cr>
nnoremap <silent> <M-j> :call TmuxMove('j')<cr>
nnoremap <silent> <M-k> :call TmuxMove('k')<cr>
nnoremap <silent> <M-l> :call TmuxMove('l')<cr>
