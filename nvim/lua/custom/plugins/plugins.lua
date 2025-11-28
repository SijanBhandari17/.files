-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
-- File containing custom plugin specifications for lazy.nvim
-- This file returns a table of plugin specifications
return {
  -- LSP Configuration
  -- Code formatter
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require 'harpoon'
      harpoon:setup()

      -- Basic keymaps
      vim.keymap.set('n', '<leader>a', function()
        harpoon:list():append()
      end, { desc = 'Harpoon: Add file' })
      vim.keymap.set('n', '<C-e>', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = 'Harpoon: Toggle menu' })

      -- Navigate to specific files
      vim.keymap.set('n', '<C-1>', function()
        harpoon:list():select(1)
      end, { desc = 'Harpoon: File 1' })
      vim.keymap.set('n', '<C-2>', function()
        harpoon:list():select(2)
      end, { desc = 'Harpoon: File 2' })
      vim.keymap.set('n', '<C-3>', function()
        harpoon:list():select(3)
      end, { desc = 'Harpoon: File 3' })
      vim.keymap.set('n', '<C-4>', function()
        harpoon:list():select(4)
      end, { desc = 'Harpoon: File 4' })
    end,
  },

  -- Additional completion sources for nvim-cmp
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-emoji', -- Add emoji completions
    },
    opts = function(_, opts)
      local cmp = require 'cmp'
      -- Initialize opts if it's nil
      opts = opts or {}
      -- Initialize sources if it doesn't exist
      opts.sources = opts.sources or {}
      -- Add emoji source
      table.insert(opts.sources, { name = 'emoji' })
      return opts
    end,
  },

  -- Catppuccin theme
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    enabled = false,
    lazy = false,
    priority = 1000, -- make sure to load this before all the other plugins
    config = function()
      require('catppuccin').setup {
        flavour = 'mocha', -- latte, frappe, macchiato, mocha
        term_colors = true,
        transparent_background = false, -- Set to true if you want transparency
        no_italic = false,
        no_bold = false,
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          notify = true,
          mini = {
            enabled = true,
            indentscope_color = '',
          },
          telescope = {
            enabled = true,
          },
          which_key = true,
        },
      }

      -- Set colorscheme after options
      vim.cmd.colorscheme 'catppuccin'
    end,
  },
  -- Emmet for HTML and CSS abbreviations
  {
    'mattn/emmet-vim',
    ft = { 'html', 'css', 'javascriptreact', 'typescriptreact', 'vue', 'svelte', 'php' },
    init = function()
      -- Enable Emmet in these file types
      vim.g.user_emmet_mode = 'n' -- Only enable normal mode functions
      vim.g.user_emmet_leader_key = '<C-y>' -- The default leader key

      -- Enable Emmet in specific filetypes
      vim.g.user_emmet_install_global = 0
      vim.cmd [[autocmd FileType html,css,javascriptreact,typescriptreact,vue,svelte,php EmmetInstall]]
    end,
  },
}
