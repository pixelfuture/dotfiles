if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

let &l:include = 'from\|require'
let &l:define = '\v(export\s+(default\s+)?)?(var|let|const|function|class)|export\s+'
