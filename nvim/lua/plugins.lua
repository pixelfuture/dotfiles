-- local function run_build(name, cmd, cwd)
--   local result = vim.system(cmd, { cwd = cwd }):wait()
--   if result.code ~= 0 then
--     local stderr = result.stderr or ''
--     local stdout = result.stdout or ''
--     local output = stderr ~= '' and stderr or stdout
--     if output == '' then output = 'No output from build command.' end
--     vim.notify(('Build failed for %s:\n%s'):format(name, output), vim.log.levels.ERROR)
--   end
-- end

vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name = ev.data.spec.name
    local kind = ev.data.kind
    if kind ~= 'install' and kind ~= 'update' then return end

    if name == 'nvim-treesitter' then
      if not ev.data.active then vim.cmd.packadd 'nvim-treesitter' end
      vim.cmd 'TSUpdate'
      return
    end
  end,
})

local function gh(repo) return 'https://github.com/' .. repo end

-- common icon pack
vim.pack.add { gh 'nvim-tree/nvim-web-devicons' }

-- identify key maps as you type
vim.pack.add { gh 'folke/which-key.nvim' }
require('which-key').setup {
  delay = 0,
  icons = { mappings = true },
  spec = {
    { '<leader>t', group = '[T]oggle' },
    { 'gr', group = 'LSP Actions', mode = { 'n' } },
  },
}

-- theme
vim.pack.add { gh 'folke/tokyonight.nvim' }
require('tokyonight').setup {}
vim.cmd.colorscheme 'tokyonight-night'

-- git status on number column along with other useful git features
vim.pack.add { gh 'lewis6991/gitsigns.nvim', gh 'tpope/vim-fugitive' }
require('gitsigns').setup {
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- navigation
    map('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, { expr = true })

    map('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, { expr = true })

    -- actions
    map('n', '<Leader>hs', gs.stage_hunk, { desc = '[H]unk [S]tage' })
    map('n', '<Leader>hu', gs.undo_stage_hunk, { desc = '[H]unk stage [U]ndo' })
    map('n', '<Leader>hr', gs.reset_hunk, { desc = '[H]unk [R]eset' })
    map('v', '<Leader>hs', function() gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' } end, { desc = '[H]unk [S]tage' })
    map('v', '<Leader>hr', function() gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' } end, { desc = '[H]unk [R]eset' })
    map('n', '<Leader>hS', gs.stage_buffer, { desc = '[H]unk [S]tage buffer' })
    map('n', '<Leader>hR', gs.reset_buffer, { desc = '[H]unk [R]eset buffer' })
    map('n', '<Leader>hp', gs.preview_hunk, { desc = '[H]unk [P]review' })
    map('n', '<Leader>hb', function() gs.blame_line { full = true } end, { desc = '[H]unk [B]lame line' })
    map('n', '<Leader>tb', gs.toggle_current_line_blame, { desc = '[T]oggle [B]lame' })
    map('n', '<Leader>hd', gs.diffthis, { desc = '[H]unk [D]iff' })
    map('n', '<Leader>hD', function() gs.diffthis '~' end, { desc = '[H]unk [D]iff last commit' })
    map('n', '<Leader>td', gs.toggle_deleted, { desc = '[T]oggle [D]eleted' })

    -- text object
    map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'Apply to current hunk' })
  end,
}

-- vim.pack.add { gh 'j-hui/fidget.nvim' }
-- require('fidget').setup {}

-- display command line in the middle of screen
vim.pack.add { gh 'rachartier/tiny-cmdline.nvim' }
require('tiny-cmdline').setup {}

-- lsp config
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
  callback = function(ev)
    local map = function(keys, func, desc, mode)
      mode = mode or 'n'
      vim.keymap.set(mode, keys, func, { buffer = ev.buf, desc = 'LSP: ' .. desc })
    end

    map('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    -- map('<C-s>', vim.lsp.buf.signature_help, 'Display Signature Help', 'i')
    -- map('grn', vim.lsp.buf.rename, '[R]e[n]ame')
    -- map('gra', vim.lsp.bufqcode_action, '[G]oto Code [A]ction', { 'n', 'x' })
    -- map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    -- map('grx', vim.lsp.codelens.run, '[G]oto [R]un Codelens')
    -- map('g0', vim.lsp.buf.document_symbol, '[G]oto Document Symbol')

    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client and client:supports_method('textDocument/documentHighlight', ev.buf) then
      local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        buffer = ev.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        buffer = ev.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.clear_references,
      })

      vim.api.nvim_create_autocmd('LspDetach', {
        group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
        callback = function(ev2)
          vim.lsp.buf.clear_references()
          vim.api.nvim_clear_autocmds { group = 'lsp-highlight', buffer = ev2.buf }
        end,
      })
    end

    if client and client:supports_method('textDocument/inlayHint', ev.buf) then
      map('<leader>th', function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = ev.buf }) end, '[T]oggle Inlay [H]ints')
    end
  end,
})

local servers = {
  ts_ls = {
    filetypes = {
      'javascript',
      'javascriptreact',
      'typescript',
      'typescriptreact',
    },
  },
  stylua = {},
  lua_ls = {
    on_init = function(client)
      client.server_capabilities.documentFormattingProvider = false

      if client.workspace_folders then
        local path = client.workspace_folders[1].name
        if path ~= vim.fn.stdpath 'config' and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc')) then return end
      end

      client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
        runtime = {
          version = 'LuaJIT',
          path = { 'lua/?.lua', 'lua/?/init.lua' },
        },
        diagnostics = {
          globals = { 'vim' },
        },
        workspace = {
          checkThirdParty = false,
          library = vim.tbl_extend('force', vim.api.nvim_get_runtime_file('', true), {
            '${3rd}/luv/library',
            '${3rd}/busted/library',
          }),
        },
      })
    end,
    settings = {
      Lua = {
        format = { enable = false },
      },
    },
  },
}

vim.pack.add {
  gh 'neovim/nvim-lspconfig',
  gh 'mason-org/mason.nvim',
  gh 'mason-org/mason-lspconfig.nvim',
  gh 'WhoIsSethDaniel/mason-tool-installer.nvim',
}

require('mason').setup {}

local ensure_installed = vim.tbl_keys(servers or {})
vim.list_extend(ensure_installed, {}) -- Add other Mason tools here

require('mason-tool-installer').setup { ensure_installed = ensure_installed }

for name, server in pairs(servers) do
  vim.lsp.config(name, server)
  vim.lsp.enable(name)
end

-- Formatter config - Prettier
vim.pack.add { gh 'stevearc/conform.nvim' }
require('conform').setup {
  notify_on_error = false,
  format_on_save = function(bufnr)
    local enabled_filetypes = {
      lua = true,
      javascript = true,
    }
    if enabled_filetypes[vim.bo[bufnr].filetype] then
      return { timeout_ms = 500 }
    else
      return nil
    end
  end,
  default_format_opts = {
    lsp_format = 'fallback',
  },
  formatters_by_ft = {
    javascript = { 'prettierd', 'prettier', stop_after_first = true },
    lua = { 'stylua' },
  },
}
-- vim.keymap.set({ 'n', 'v' }, '<leader>f', function() require('conform').format { async = true } end, { desc = '[F]ormat buffer' })

-- Oil config
vim.pack.add { gh 'stevearc/oil.nvim' }
require('oil').setup {}
vim.keymap.set('n', '-', '<cmd>Oil<cr>', { desc = 'Open parent directory' })

-- Treesitter config
vim.pack.add { { src = gh 'nvim-treesitter/nvim-treesitter', branch = 'main' } }
local treesitter = require 'nvim-treesitter'
local parsers = {
  'bash',
  'css',
  'diff',
  'dockerfile',
  'go',
  'html',
  'http',
  'javascript',
  'json',
  'query',
  'rust',
  'tsx',
  'typescript',
}
treesitter.setup {
  ensure_installed = parsers,
  highlight = { enable = true },
}
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'lua', 'typescriptreact', 'typescript', 'tsx' },
  callback = function(args)
    vim.treesitter.start(args.buf)
    -- https://www.jackfranklin.co.uk/blog/code-folding-in-vim-neovim/
    vim.wo[0][0].foldlevel = 99
    vim.wo[0][0].foldnestmax = 4
    vim.wo[0][0].foldtext = ''
    vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    vim.wo[0][0].foldmethod = 'expr'
    vim.bo.indentexpr = 'v:lua.require"nvim-treesitter".indentexpr()'
  end,
})
vim.pack.add { gh 'windwp/nvim-ts-autotag' }
require('nvim-ts-autotag').setup()

-- Automplete
vim.pack.add { { src = gh 'saghen/blink.cmp', version = vim.version.range '1.0' } }
require('blink.cmp').setup()

-- Fuzzy Finder
vim.pack.add { gh 'ibhagwan/fzf-lua' }
require('fzf-lua').setup()
vim.keymap.set('n', '<leader>ff', require('fzf-lua').files, { desc = '[F]ind [F]iles' })
vim.keymap.set('n', '<leader>,', require('fzf-lua').buffers, { desc = '[F]ind [B]uffers' })
vim.keymap.set('n', '<leader>fo', require('fzf-lua').oldfiles, { desc = '[F]ind [O]ld files' })
vim.keymap.set('n', '<leader>fr', require('fzf-lua').resume, { desc = '[F]ind [R]esume' })
vim.keymap.set('n', '<leader>fb', require('fzf-lua').blines, { desc = '[F]ind Buffer [L]ines' })
vim.keymap.set('n', '<leader>fl', require('fzf-lua').lines, { desc = '[F]ind Buffers [L]ines' })
vim.keymap.set('n', '<leader>fq', require('fzf-lua').quickfix, { desc = '[F]ind [Q]uickfix' })
vim.keymap.set('n', '<leader>fg', require('fzf-lua').live_grep, { desc = '[F]ind [G]rep' })
vim.keymap.set('n', '<leader>fw', require('fzf-lua').grep_cword, { desc = '[F]ind [w]ord Under Cursor' })
vim.keymap.set('n', '<leader>fh', require('fzf-lua').helptags, { desc = '[F]ind [H]elp' })
vim.keymap.set('n', '<leader>gs', require('fzf-lua').git_status, { desc = '[G]it [S]tatus' })
vim.keymap.set('n', '<leader>gd', require('fzf-lua').git_diff, { desc = '[G]it [D]iff' })
vim.keymap.set('n', '<leader>gc', require('fzf-lua').git_commits, { desc = '[G]it Project [C]ommits' })
vim.keymap.set('n', '<leader>gb', require('fzf-lua').git_bcommits, { desc = '[G]it Buffer [C]ommits' })
vim.keymap.set(
  'n',
  '<leader>gm',
  function() require('fzf-lua').git_diff { prompt = 'Conflicts> ', cmd = 'git diff --name-only --diff-filter=U --relative' } end,
  { desc = '[G]it Buffer [C]ommits' }
)
