--
--         ▀▀█                    ▀
--  ▄▄▄▄     █    ▄   ▄   ▄▄▄▄  ▄▄▄    ▄ ▄▄    ▄▄▄
--  █▀ ▀█    █    █   █  █▀ ▀█    █    █▀  █  █   ▀
--  █   █    █    █   █  █   █    █    █   █   ▀▀▀▄
--  ██▄█▀    ▀▄▄  ▀▄▄▀█  ▀█▄▀█  ▄▄█▄▄  █   █  ▀▄▄▄▀
--  █                     ▄  █
--  ▀                      ▀▀
--
--
--  => lua/plugins/init.lua

-- This file can be loaded by calling `lua require('plugins')` from your init.vim

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system{
	  'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
	  install_path
  },
  print "Installing packer close and reopen nvim"
  vim.cmd [[packadd packer.nvim]]
end

local status_ok, packer_config = pcall(require, 'packer')
if not status_ok then
  return
end

-- have packer use a popup window
--[[ packer_config.init {
  display = {
    open_fn = function()
      return require('packer.util').float{ border = "rounded" }
    end,
  },
}
--]]

packer_config.startup(function(use)
  ---------------------
  -- My plugins here --
  ---------------------

  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- vim-tmux navigator
  use {
    'christoomey/vim-tmux-navigator',
    config = "require('plugins.vim-tmux-navigator')"
  }

  -- LSP
  use {
    'neovim/nvim-lspconfig',
    -- check if it's worth to put up filetypes like this
    -- ft = { 'sh', 'zsh', 'fish', 'c', 'cpp', 'cmake', 'go',
    --   'html', 'scss', 'css', 'javascript', 'javascriptreact',
    --   'lua', 'python', 'rust', 'typescript', 'typescriptreact' }
    -- event = "BufRead",
  }

  -- LSP stuffs
  use {
    'glepnir/lspsaga.nvim',
    -- event = "BufRead",
    config = "require('plugins.lspsaga')"
  }
  use {
    'onsails/lspkind-nvim',
    -- event = "BufRead"
  }
  -- use 'kosayoda/nvim-lightbulb'
  -- use 'mfussenegger/nvim-jdtls'

  use 'kevinhwang91/nvim-bqf'
  use {
    'airblade/vim-rooter',
    config = "require('plugins.rooter')",
}

  -- autocomplete
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'saadparwaiz1/cmp_luasnip',
    },
    -- event = "InsertEnter",
    config = "require('plugins.nvim-cmp')",
  }

  -- autopairs
  use {
    'windwp/nvim-autopairs',
    config = "require('plugins.nvim-autopairs')",
    after = "nvim-cmp"
  }

  -- surround
  use {
    'blackCauldron7/surround.nvim',
    event = "BufEnter",
    config = "require('plugins.surround')"
  }

  -- commentary
  use {
    'b3nj5m1n/kommentary',
    event = "BufEnter",
    config = "require('plugins.kommentary')"
}

  -- align text
  use 'godlygeek/tabular'

  -- treesitter (post-install/update hook with neovim command)
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    -- requires = { 'p00f/nvim-ts-rainbow' },
    event = "BufWinEnter",
    config = "require('plugins.nvim-treesitter')"
  }

  -- tagviewer
  use {
    'liuchengxu/vista.vim',
    cmd = "Vista",
    config = "require('plugins.vista')"
  }

  -- indent line
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = "require('plugins.indent-blankline')",
    event = "BufRead"
  }

  -- icons
  use 'kyazdani42/nvim-web-devicons'

  -- startpage
	-- use {
  --   'glepnir/dashboard-nvim',
  --   config = "require('plugins.dashboard')"
  -- }
  -- use {
  --   'goolord/alpha-nvim',
  --   requires = 'kyazdani42/nvim-web-devicons',
  --   config = "require('plugins.alpha-nvim')",
  -- }

  -- colorschemes
  use 'rrethy/nvim-base16'
  use 'huyvohcmc/atlas.vim'
  use 'LuRsT/austere.vim'
  use {'Jorengarenar/vim-darkness', as = 'darkness'}
  use 'Mangeshrex/uwu.vim'
  use 'FrenzyExists/aquarium-vim'
  use 'logico/typewriter-vim'
  use 'preservim/vim-colors-pencil'
  use 'tanvirtin/monokai.nvim'
  use 'romgrk/doom-one.vim'
  use 'srcery-colors/srcery-vim'
  use 'sainnhe/gruvbox-material'
  use 'jnurmine/Zenburn'
  use 'sainnhe/edge'
  use 'folke/tokyonight.nvim'
  use 'tiagovla/tokyodark.nvim'
  use 'arzg/vim-colors-xcode'
  use 'kyazdani42/blue-moon'
  use 'sainnhe/everforest'
  use 'marko-cerovac/material.nvim'
  use 'EdenEast/nightfox.nvim'
  use 'projekt0n/github-nvim-theme'
  use { 'kyazdani42/nvim-palenight.lua', as = 'palenight' }
	use {
    'norcalli/nvim-colorizer.lua',
    config = "require('plugins.colorizer')",
  }
  use 'yunlingz/equinusocio-material.vim'
  use 'ChristianChiarulli/nvcode-color-schemes.vim'
  use 'rebelot/kanagawa.nvim'
  use { 'rose-pine/neovim', as = 'rose-pine' }
  use { 'catppuccin/nvim', as = 'catppuccin' }
  use { 'bluz71/vim-moonfly-colors', as = 'moonfly' }
  use { 'bluz71/vim-nightfly-guicolors', as = 'nightfly' }

  -- statusline
  use {
    'famiu/feline.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
  }

  -- telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-lua/popup.nvim'
    },
    config = "require('plugins.telescope')",
  }

  -- telescope extension plugins
  use {
    'nvim-telescope/telescope-media-files.nvim',
  }

  -- file explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    cmd = "NvimTreeToggle",
    config = "require('plugins.nvim_tree')"
  }

  -- focus-mode
  -- use {
  --   'folke/zen-mode.nvim',
  --   config = "require('plugins.zen-mode')",
  --   event = "BufWinEnter",
  -- }
  -- use {
  --   'folke/twilight.nvim',
  --   config = "require('plugins.twilight')",
  --   event = "BufWinEnter",
  -- }


  -- git labels
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = "require('plugins.gitsigns')"
  }

  -- better diff
  use {
    'sindrets/diffview.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = "require('plugins.diffview')"
  }

  -- magit for neovim
  use {
    'TimUntersberger/neogit',
    requires = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',
    },
    -- config = "require('plugins.neogit')",  -- buffer problem
    config = function()
      require("neogit").setup {
        disable_commit_confirmation = true,
        signs = {
          -- { CLOSED, OPENED }
          section = { "", "" },
          item = { "", "" },
          hunk = { "", "" },
        },
        integrations = {
          diffview = true,
        },
        kind = "tab",
      }
    end,
  }


  -- floaterm
  use {
    'voldikss/vim-floaterm',
    config = "require('plugins.floaterm')",
    cmd = { "FloatermNew", "FloatermToggle" }
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    packer_config.sync()
  end

  ------------------------------------------
  -- custom modules for installed plugins --
  ------------------------------------------

  -- keybinds for installed plugins
  require('plugins.telescope')
  require('plugins.plugin_keybindings')

end)
