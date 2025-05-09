-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

-- Load the colorscheme here.
-- Check if neopywall's coloscheme file is available
-- if not use of another theme
return {
  {
    'RedsXDD/neopywal.nvim',
    name = 'neopywal',
    lazy = true,
    priority = 1000,
    opts = {
      use_palette = 'wallust',
    },
  },
  {
    'rebelot/kanagawa.nvim',
    config = function()
      if vim.uv.fs_stat(vim.fs.abspath '~/.cache/wallust/colors_neopywal.vim') then
        vim.cmd.colorscheme 'neopywal-dark'
      else
        vim.cmd.colorscheme 'kanagawa-wave'
      end
    end,
  },
  {
    'adalessa/laravel.nvim',
    dependencies = {
      'tpope/vim-dotenv',
      'nvim-telescope/telescope.nvim',
      'MunifTanjim/nui.nvim',
      'kevinhwang91/promise-async',
    },
    cmd = { 'Laravel' },
    keys = {
      { '<leader>la', ':Laravel artisan<cr>' },
      { '<leader>lr', ':Laravel routes<cr>' },
      { '<leader>lm', ':Laravel related<cr>' },
    },
    event = { 'VeryLazy' },
    opts = {
      lsp_server = 'phpactor',
      user_providers = {},
    },

    config = true,
  },
  {
    'S1M0N38/love2d.nvim',
    event = 'VeryLazy',
    opts = {},
    keys = {
      { '<leader>v', ft = 'lua', desc = 'LÖVE' },
      { '<leader>vv', '<cmd>LoveRun<cr>', ft = 'lua', desc = 'Run LÖVE' },
      { '<leader>vs', '<cmd>LoveStop<cr>', ft = 'lua', desc = 'Stop LÖVE' },
    },
  },
}
