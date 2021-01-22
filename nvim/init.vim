let mapleader = " "
set termguicolors

" Plugins
call plug#begin(stdpath('data') . '/plugged')
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'justinmk/vim-dirvish'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-rhubarb'
	Plug 'tpope/vim-eunuch'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-unimpaired'
	Plug 'tpope/vim-repeat'
	Plug 'tpope/vim-surround'
	Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
	Plug 'jparise/vim-graphql'
	Plug 'haishanh/night-owl.vim'
	Plug 'norcalli/nvim-colorizer.lua'
	Plug 'Yggdroot/indentline'
	Plug 'suy/vim-context-commentstring'
	Plug 'yuezk/vim-js'
	Plug 'maxmellon/vim-jsx-pretty'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'mhinz/vim-signify'
  Plug 'machakann/vim-highlightedyank'
call plug#end()

lua require'colorizer'.setup()

