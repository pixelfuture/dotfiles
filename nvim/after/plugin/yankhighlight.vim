if !exists('##TextYankPost')
  map y <Plug>(highlightedyank)
endif
let g:highlightedyank_highlight_duration = 150
highlight HighlightedyankRegion cterm=reverse gui=reverse
