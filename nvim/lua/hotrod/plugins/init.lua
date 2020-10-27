vim.cmd [[packadd packer.nvim]]

return require("packer").startup(
  function()
    -- Packer can manage itself as an optional plugin
    use {"wbthomason/packer.nvim", opt = true}

    use "justinmk/vim-dirvish" -- path navigator
    use "tpope/vim-fugitive" -- git helper
    use "mhinz/vim-signify" -- git sign column
    use "tpope/vim-rhubarb" -- :Gbrowse
    use "haishanh/night-owl.vim" -- night owl colorscheme
    use "psliwka/vim-smoothie" -- smooth scrolling
    use "norcalli/nvim-colorizer.lua" -- colorize hex/rgb/hsl value
    use "euclidianAce/BetterLua.vim" -- better lua highlighting
    use "Yggdroot/indentline" -- indentline guide
    use "tpope/vim-commentary" -- comment code (gcc)
    use "suy/vim-context-commentstring" -- change comment string
    use "yuezk/vim-js" -- better js highlighting support
    use "maxmellon/vim-jsx-pretty" -- jsx highlighting
    use "junegunn/fzf.vim" -- fzf
    use "tpope/vim-eunuch" -- Vim sugar for Unix shell commands
    use "tpope/vim-unimpaired" -- mappings using square brackets []
    use "tpope/vim-repeat" -- improve Vim repeat command
    use "tpope/vim-surround" -- add parentheses, brackets, quotes, xml tags
    use {"styled-components/vim-styled-components", branch = "main"} -- syntax highlighting
    use "jparise/vim-graphql" -- syntax highlighting
    use {"neoclide/coc.nvim", branch = "release"} -- conquer of completion
    use "antoinemadec/coc-fzf" -- coc fzf

    -- use 'neovim/nvim-lspconfig' -- lsp
    -- use 'nvim-lua/completion-nvim' -- lsp completion
    -- use 'nvim-lua/diagnostic-nvim' -- lsp diagnostics

    -- Lazy loading:
    -- Load on specific commands
    -- use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

    -- Load on an autocommand event
    use {'andymass/vim-matchup', event = 'VimEnter *'}

    -- Load on a combination of conditions: specific filetypes or commands
    -- Also run code after load (see the "config" key)
    --  use {
    -- 'w0rp/ale',
    -- ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
    -- cmd = 'ALEEnable',
    -- config = 'vim.cmd[[ALEEnable]]'
    -- }

    -- Plugins can have dependencies on other plugins
    use {
      "nvim-treesitter/nvim-treesitter",
      requires = {'nvim-treesitter/nvim-treesitter-refactor', 'nvim-treesitter/nvim-treesitter-textobjects'}
    }

    -- Local plugins can be included
    -- use '~/projects/personal/hover.nvim'

    -- Plugins can have post-install/update hooks
    -- use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}

    -- You can specify multiple plugins in a single call
    -- use {'tjdevries/colorbuddy.vim', {'nvim-treesitter/nvim-treesitter', opt = true}}

    -- You can alias plugin names
    use {'dracula/vim', as = 'dracula'}
  end
)
