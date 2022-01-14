-- This file can be loaded by calling `lua require('plugins')` from your init.vim

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  ---------------------
  -- My plugins here --
  ---------------------

  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- vim-tmux navigator
  use 'christoomey/vim-tmux-navigator'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end

  ------------------------------------------
  -- custom modules for installed plugins --
  ------------------------------------------
  
  -- keybinds for installed plugins
  require('plugins.plugin_keybindings')

end)
