local plugin = require("setup.plugin")
local lang   = require("setup.lang")
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
  {'lewis6991/impatient.nvim'},
  {'sainnhe/everforest'},
  {'rhysd/vim-color-spring-night'},
  {'rebelot/kanagawa.nvim', event = "VeryLazy"},
  {'rebelot/heirline.nvim'},
  {
    'ms-jpq/coq_nvim',
    dependencies =
    {
      { 'ms-jpq/coq.artifacts', branch = 'artifacts', opt = true },
      { 'ms-jpq/coq.thirdparty', branch = '3p', opt = true }
    },
  },
  {
    'SirVer/ultisnips',
    event = 'InsertEnter',
  },

  
  {'christoomey/vim-tmux-navigator'},
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = plugin.telescope_setup()
  },
  {
    'vim-autoformat/vim-autoformat',
    ft = 'py'
  },
  {
    'TimUntersberger/neogit',
    dependencies =
    {
      'nvim-lua/plenary.nvim',
      { 'sindrets/diffview.nvim', opt = true },
    },
    config = plugin.neogit_setup,
    event = "VeryLazy",
  },

  {'neovim/nvim-lspconfig'},
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = plugin.pair_setup,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    config = plugin.treesitter_setup,
    lazy = true
  },
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = plugin.tree_setup,
  },
  {
    'Julian/lean.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', },
    ft = { 'lean' },
    config = lang.lean_setup,
  },
  {
    'ellisonleao/glow.nvim',
    config = plugin.glow_setup,
    cmd = {"Glow"}
  },
  { 'KeitaNakamura/tex-conceal.vim', ft = { 'tex' } },
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
    'ziglang/zig.vim',
    ft = { 'zig' }
  },
  {
    'ShinKage/idris2-nvim',
    dependencies = { 'MunifTanjim/nui.nvim', opt = true },
    ft = { 'idr' }
  },
  {
    'folke/which-key.nvim',
    config = plugin.which_key_setup,
    lazy = true,
  },
  {
    'folke/trouble.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
    config = plugin.trouble_setup,
    keys = { "<leader>t" }
  },
  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = plugin.todo_setup,
    keys = {"<leader>f"}
  },
  {
    'debugloop/telescope-undo.nvim',
    dependencies = {'nvim-telescope/telescope.nvim'},
    keys = {'<leader>u'},
    config = function()
      require("telescope").load_extension("undo")
    end,
  },
})
