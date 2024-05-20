local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    'morhetz/gruvbox',
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd [[ colorscheme tokyonight ]]
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require("lualine").setup()
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {}
      vim.keymap.set('n', '<c-n>', ':NvimTreeToggle<CR>', { silent = true })
    end,
  },
  {
    'm4xshen/autoclose.nvim',
    lazy = false,
    config = function()
      require("autoclose").setup({
        keys = {
          ['$'] = { escape = true, close = true, pair = "$$", disable_filetypes = {} },
        },
      })
    end,
  },
  {
    'Exafunction/codeium.vim',
    lazy = false,
    config = function()
      vim.keymap.set('i', '<C-g>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
      vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
      vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
      vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
    end,
  },
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('telescope').setup()
      vim.keymap.set('n', '<Space>ff', ':Telescope find_files<CR>', { silent = true })
      vim.keymap.set('n', '<Space>fg', ':Telescope live_grep<CR>', { silent = true })
      vim.keymap.set('n', '<Space>fb', ':Telescope buffers<CR>', { silent = true })
      vim.keymap.set('n', '<Space>fh', ':Telescope help_tags<CR>', { silent = true })
    end
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup {
        highlight = {
          enable = true
        },
        sync_install = false,
        auto_install = true,
        ensure_installed = {
          "c",
          "cpp",
          "go",
          "json",
          "lua",
          "python",
          "rust",
          "toml",
          "yaml",
          "vim",
          "bash",
          "html",
          "css",
          "markdown",
          "markdown_inline",
          "query",
          "vimdoc"
        },
      }
    end
  },
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    lazy = false,
    config = function()
      require("toggleterm").setup{
        open_mapping = [[<c-\>]],
        direction = 'float'
      }
    end
  },
  {
    'hrsh7th/nvim-cmp',
    config = function()
      require("configs.cmp")
    end
  },
  {
    'onsails/lspkind.nvim',
    lazy = false,
  },
  {
    'hrsh7th/cmp-nvim-lsp'
  },
  {
    'L3MON4D3/LuaSnip',
    config = function()
      require("luasnip").setup()
    end
  },
  {
    'saadparwaiz1/cmp_luasnip'
  },
  {
    'rafamadriz/friendly-snippets'
  },
  {
    'williamboman/mason.nvim',
    config = function()
      require("mason").setup()
    end
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "clangd", "cssls", "html", "jsonls", "pyright", "rust_analyzer", "tsserver", "bashls" },
      })
    end
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      require("configs.lspconfig")
    end
  },
  {
    'stevearc/oil.nvim',
    lazy = false,
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup()
      vim.keymap.set('n', '<Space>o', ':Oil<CR>', { silent = true })
    end
  },
  {
    'rcarriga/nvim-notify',
    lazy = false,
    config = function()
      require("notify").setup({
        timeout = 300,
      })
      vim.notify = require("notify")
    end
  },
  {
    "stevearc/dressing.nvim",
    lazy = true,
    init = function()
      vim.ui.select = function(...)
      require("lazy").load({ plugins = { "dressing.nvim" } })
      return vim.ui.select(...)
    end
      vim.ui.input = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.input(...)
      end
    end,
  },
  {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    -- add any options here
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
    },
    config = function()
      require("configs.noice")
    end
  },
})

