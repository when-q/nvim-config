local plugin   = require("setup.plugin")
local lang     = require("setup.lang")
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end

vim.opt.runtimepath:prepend(lazypath)


require('lazy').setup({
  { 'rebelot/kanagawa.nvim', event = "VeryLazy" },
  {
    'yorik1984/newpaper.nvim',
    event = "VeryLazy"
  },
  {
    'AlexvZyl/nordic.nvim',
    event = "VeryLazy"
  },
  { 'rebelot/heirline.nvim' },
  {
    'ms-jpq/coq_nvim',
    dependencies = {
      'ms-jpq/coq.thirdparty',
      'ms-jpq/coq.artifacts'
    },
    init = function()
      vim.g.coq_settings =
      {
        clients = { snippets = { warn = {} } },
        auto_start = 'shut-up',
        keymap =
        {
          recommended = true,
          jump_to_mark = "<c-m>",
        },
      }
    end,
    branch = "coq",
    event = 'InsertEnter',
  },
  { 'lervag/vimtex' },
  { 'christoomey/vim-tmux-navigator' },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    keys = { '<leader>' },
    config = plugin.telescope_setup,
  },

  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make' 
  },
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- calling `setup` is optional for customization
      require("fzf-lua").setup({
        winopts = {
          -- Use **only one** of the below options
          split = "belowright vnew" -- open in split right of current window
        },
      })
    end
  },
  {
    'NeogitOrg/neogit',
    dependencies =
    {
      'nvim-lua/plenary.nvim',
      { 'sindrets/diffview.nvim' },
    },
    cmd = "Neogit",
    config = plugin.neogit_setup,
  },

  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'simrat39/rust-tools.nvim',
    },
    -- setup in lsp
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = plugin.pair_setup,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    config = plugin.treesitter_setup,
    event = "BufEnter"
  },
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = plugin.tree_setup,
    event = "VeryLazy"
  },
  {
    'Julian/lean.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'Julian/tree-sitter-lean' },
    ft = { 'lean' },
    config = lang.lean_setup,
  },
  {
    'ellisonleao/glow.nvim',
    config = plugin.glow_setup,
    cmd = { "Glow" }
  },
  {
    'jakewvincent/texmagic.nvim',
    ft = { 'tex' },
    config = lang.tex_setup
  },
  {
    'ggandor/leap.nvim',
    config = plugin.leap_setup
  },
  {
    'folke/which-key.nvim',
    config = plugin.which_key_setup,
    lazy = true,
  },
  {
    'folke/trouble.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
    config = plugin.trouble_setup,
    keys = { "<leader>q" },
    cmd = { 'TroubleToggle' },
  },
  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = plugin.todo_setup,
    keys = { "<leader>f" },
    cmd = { "TodoTelescope", "TodoTrouble" },
  },
  {
    'p00f/clangd_extensions.nvim',
    ft = { "c", "cpp", "objc", "objcpp", "cuda", "proto", "h" },
    config = lang.clangd_setup,
  },
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end,
    event = "BufEnter",
  },
  {
    'tpope/vim-unimpaired',
    keys = { '[', ']' },
  },
    --[[ {
    "L3MON4D3/LuaSnip",
    version = "2.*",
    build = "make install_jsregexp",
    config = plugin.luasnip_setup,
  },
  { "mendes-davi/coq_luasnip" },
--]]
  {
    "iurimateus/luasnip-latex-snippets.nvim",
    -- replace "lervag/vimtex" with "nvim-treesitter/nvim-treesitter" if you're
    -- using treesitter.
    dependencies = { "L3MON4D3/LuaSnip", "lervag/vimtex" },
    config = function()
      require 'luasnip-latex-snippets'.setup({ use_treesitter = true })
    end,
    -- treesitter is required for markdown
    ft = { "tex", "markdown" },
  },
  --{ 'JuliaEditorSupport/julia-vim', lazy = true },
  {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    -- Optional; default configuration will be used if setup isn't called.
    config = function()
      require("everforest").setup({
        -- Your config here
        disable_italic_comments = true,
      })
      --      require("everforest").load()
    end,
  },
  {
    'nvim-orgmode/orgmode',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      require('orgmode').setup_ts_grammar()
      require('orgmode').setup {
        org_agenda_files = { '~/.config/org/agenda/**/*' },
        org_default_notes_file = '~/.config/org/note/default.org',
      }
    end,
    ft = { "org" }
  },
  {
    'akinsho/org-bullets.nvim',
    config = function()
      require('org-bullets').setup()
    end,
    ft = { 'org' }
  },
  {
    "tversteeg/registers.nvim",
    config = function()
      require("registers").setup({ bind_keys = { normal = false, insert = false } })
    end,
    keys = {
      { "\"", mode = { "n", "v" } },
    },
    cmd = "Registers",
  },
  {
    'tpope/vim-dispatch',
    cmd = {
      "Dispatch",
      "Make"
    }
  },
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'rcarriga/nvim-dap-ui'
    },
    config = plugin.nvim_daps,
    keys = { '<leader>' }
  },
  { 'rose-pine/neovim', name = 'rose-pine' },
  {
    'numToStr/Comment.nvim',
    opts = {},
    keys = {'gc'},
  },
  {
      "nvim-neorg/neorg",
      build = ":Neorg sync-parsers",
      dependencies = { "nvim-lua/plenary.nvim" },
      config = function()
        require("neorg").setup {
          load = {
            ["core.defaults"] = {}, -- Loads default behaviour
            ["core.qol.toc"] = {},
            ["core.qol.todo_items"] = {},
            ["core.looking-glass"] = {},
            ["core.concealer"] = {
              config = {
                  icons = {
                    todo ={
                      undone = {icon = " "},
                      on_hold = {icon = "="},
                    },
                },
              }, 
            },
            ["core.journal"] = {
              config = {
                strategy = "flat",
                workspace = "Notes",
              },
            },
            ["core.dirman"] = { -- Manages Neorg workspaces
              config = {
                workspaces = {
                  notes = "~/notes",
                },
              },
            },
          },
        }
      end,
    },
    {
      'kevinhwang91/nvim-ufo', 
      dependencies = {'kevinhwang91/promise-async'},
      opts = {
        provider_selector = function(bufnr, filetype, buftype)
            return {'treesitter', 'indent'}
        end,
        fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
          local newVirtText = {}
          local suffix = (' 󰁂 %d '):format(endLnum - lnum)
          local sufWidth = vim.fn.strdisplaywidth(suffix)
          local targetWidth = width - sufWidth
          local curWidth = 0
          for _, chunk in ipairs(virtText) do
              local chunkText = chunk[1]
              local chunkWidth = vim.fn.strdisplaywidth(chunkText)
              if targetWidth > curWidth + chunkWidth then
                  table.insert(newVirtText, chunk)
              else
                  chunkText = truncate(chunkText, targetWidth - curWidth)
                  local hlGroup = chunk[2]
                  table.insert(newVirtText, {chunkText, hlGroup})
                  chunkWidth = vim.fn.strdisplaywidth(chunkText)
                  -- str width returned from truncate() may less than 2nd argument, need padding
                  if curWidth + chunkWidth < targetWidth then
                      suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
                  end
                  break
              end
              curWidth = curWidth + chunkWidth
          end
          table.insert(newVirtText, {suffix, 'MoreMsg'})
          return newVirtText
        end,
      },
    }
})
