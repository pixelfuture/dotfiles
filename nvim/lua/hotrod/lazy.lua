require("lazy").setup({
  { "folke/which-key.nvim",            opts = {} },
  -- theme
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
    end,
  },

  -- Comment with gc
  { 'numToStr/Comment.nvim',           opts = {} },

  -- Treesitter
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  "JoosepAlviste/nvim-ts-context-commentstring",
  "nvim-treesitter/nvim-treesitter-textobjects", -- select functions, parameters, blocks

  -- Git
  "tpope/vim-fugitive",
  {   "lewis6991/gitsigns.nvim", opts = {
    on_attach = function (bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- navigation
      map('n', ']c', function ()
        if vim.wo.diff then return ']c' end
        vim.schedule(function () gs.next_hunk() end)
        return '<Ignore>'
      end, { expr = true })

      map('n', '[c', function ()
        if vim.wo.diff then return '[c' end
        vim.schedule(function () gs.prev_hunk() end)
        return '<Ignore>'
      end, { expr = true })

      -- actions
      map('n', '<Leader>hs', gs.stage_hunk, { desc = "[H]unk [S]tage" } )
      map('n', '<Leader>hu', gs.undo_stage_hunk, { desc = "[H]unk stage [U]ndo" } )
      map('n', '<Leader>hr', gs.reset_hunk, { desc = "[H]unk [R]eset" } )
      map('v', '<Leader>hs', function ()
        gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')}
      end, { desc = "[H]unk [S]tage" } )
      map('v', '<Leader>hr', function ()
        gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')}
      end, { desc = "[H]unk [R]eset" } )
      map('n', '<Leader>hS', gs.stage_buffer, { desc = "[H]unk [S]tage buffer" } )
      map('n', '<Leader>hR', gs.reset_buffer, { desc = "[H]unk [R]eset buffer" } )
      map('n', '<Leader>hp', gs.preview_hunk, { desc = "[H]unk [P]review" } )
      map('n', '<Leader>hb', function () gs.blame_line{full=true} end, { desc = "[H]unk [B]lame line" } )
      map('n', '<Leader>tb', gs.toggle_current_line_blame, { desc = "[T]oggle [B]lame" } )
      map('n', '<Leader>hd', gs.diffthis, { desc = "[H]unk [D]iff" } )
      map('n', '<Leader>hD', function () gs.diffthis('~') end, { desc = "[H]unk [D]iff last commit" } )
      map('n', '<Leader>td', gs.toggle_deleted, { desc = "[T]oggle [D]eleted" } )

      -- text object
      map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = "Apply to current hunk" } )
    end
  } },

  -- LSP
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { 'williamboman/mason.nvim',           config = true },
      { 'williamboman/mason-lspconfig.nvim', config = true },

      -- Useful status updates for LSP
      { 'j-hui/fidget.nvim',                 tag = 'legacy', opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      { "folke/neodev.nvim",                 opts = {} }
    },
  },

  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer",   -- buffer word completion
      "hrsh7th/cmp-nvim-lsp", -- LSP completion
      "hrsh7th/cmp-cmdline",  -- adds completion to command line and search
      "hrsh7th/cmp-path",     -- adds path completion

      -- Snippets
      "saadparwaiz1/cmp_luasnip",
      { "L3MON4D3/LuaSnip", version = "2.*", build = "make install_jsregexp" },
      "rafamadriz/friendly-snippets",

      -- Adds pictograms
      "onsails/lspkind.nvim",
      "kyazdani42/nvim-web-devicons",

      -- UI enhancements and navigation
      {
        "SmiteshP/nvim-navbuddy",
        dependencies = {
          { "SmiteshP/nvim-navic", opts = { lsp = { auto_attach = true } } },
          "MunifTanjim/nui.nvim"
        },
        opts = { lsp = { auto_attach = true } }
      },
      {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
          -- add any options here
          presets = {
            lsp_doc_border = true,
          }
        },
        dependencies = { "rcarriga/nvim-notify" }
      }
    },
  },

  -- telescope
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- Fuzzy Finder Algorithm which requires local dependencies to be built.
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
  },

  -- autopairs
  { "windwp/nvim-autopairs",  opts = {} },
  { "windwp/nvim-ts-autotag", opts = {} },

  -- formatters
  "folke/null-ls.nvim",
  "MunifTanjim/prettier.nvim",

  -- UI enhancements
  {
    'stevearc/dressing.nvim',
    opts = {
      input = {
        title_pos = "center",
        insert_only = false,
        win_options = {
          winblend = 0,
        }
      }
    },
  },
  {
    'nvimdev/lspsaga.nvim',
    opts = {
      ui = {
        border = "rounded",
      },
      code_action = {
        keys = {
          quit = { "q", "<Esc>" },
          exec = "<CR>",
        },
      },
    },
  },
  {
    'NvChad/nvim-colorizer.lua',
    opts = {
      filetypes = { "*" },
      user_default_options = {
        RGB = true,           -- #RGB hex codes
        RRGGBB = true,        -- #RRGGBB hex codes
        names = false,        -- "Name" codes like Blue or blue
        RRGGBBAA = false,     -- #RRGGBBAA hex codes
        AARRGGBB = false,     -- 0xAARRGGBB hex codes
        rgb_fn = true,        -- CSS rgb() and rgba() functions
        hsl_fn = false,       -- CSS hsl() and hsla() functions
        css = false,          -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = false,       -- Enable all CSS *functions*: rgb_fn, hsl_fn
        -- Available modes for `mode`: foreground, background,  virtualtext
        mode = "virtualtext", -- Set the display mode.
        -- Available methods are false / true / "normal" / "lsp" / "both"
        -- True is same as normal
        tailwind = false,                               -- Enable tailwind colors
        -- parsers can contain values used in |user_default_options|
        sass = { enable = true, parsers = { "css" }, }, -- Enable sass colors
        virtualtext = "■",
        -- update color values even if buffer is not focused
        -- example use: cmp_menu, cmp_docs
        always_update = false
      },
      -- all the sub-options of filetypes apply to buftypes
      buftypes = {},
    }
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    opts = {
      char = "",
      space_char_blankline = " ",
      show_current_context = true,
    }
  },
  "xiyaowong/nvim-cursorword", -- highlight word under cursor
  { "nvim-lualine/lualine.nvim", opts = { theme = "tokyonight" } },
}, {})
