return require'paq-nvim'{
  'savq/paq-nvim'; -- paq manages itself

  -- night owl theme
  'haishanh/night-owl.vim';

  -- navigation
  'justinmk/vim-dirvish';

  -- git diff sybmols in the gutter
  'mhinz/vim-signify';

  -- display vertical lines at each indentation
  'Yggdroot/indentline';

  -- TPope
  'tpope/vim-fugitive'; -- git tools
  'tpope/vim-rhubarb'; -- Gbrowse opens Github URLs
  'tpope/vim-eunuch'; -- Move, Delete, Rename, Mkdir, Chmod, SudoWrite
  'tpope/vim-commentary'; -- comments - gcc gc<motion>
  'tpope/vim-unimpaired'; -- easy navigation pairs like [q for quickfix window
  'tpope/vim-repeat'; -- helps repeat actions for stuff (not sure if I need this)
  'tpope/vim-surround'; -- replace HTML tags, surround items with brackets, braces other tags

  -- Treesitter
  {'nvim-treesitter/nvim-treesitter', run=':TSUpdate'};
  'JoosepAlviste/nvim-ts-context-commentstring';

  -- icons that work with nerd fonts (may not work with current font)
  'kyazdani42/nvim-web-devicons';

  -- Completion
  'neovim/nvim-lspconfig';
  'hrsh7th/nvim-compe';
  'kosayoda/nvim-lightbulb'; -- shows a lightbulb when codeAction is available (used with Telescope)
  'ray-x/lsp_signature.nvim'; -- improved signature help

  -- colors for CSS hashes
  'norcalli/nvim-colorizer.lua';

  -- highlights unique characters in a line to use "f" or "F" commands
  'unblevable/quick-scope';

  -- emmet support - double commas
  'mattn/emmet-vim';

  -- Prettier
  {'prettier/vim-prettier', run='yarn install'};

  -- Telescope
  'nvim-lua/popup.nvim';
  'nvim-lua/plenary.nvim';
  'nvim-telescope/telescope.nvim';
  {'nvim-telescope/telescope-fzf-native.nvim', run='make'};

  -- Harpoon
  'ThePrimeagen/harpoon';

  -- Smooth scrolling
  'karb94/neoscroll.nvim';

  -- Git worktree
  'ThePrimeagen/git-worktree.nvim';

  -- Which key
  'folke/which-key.nvim';

  -- autopairs
  'windwp/nvim-autopairs';

  -- zen mode
  'folke/zen-mode.nvim';
  -- 'folke/twilight.nvim'
}
