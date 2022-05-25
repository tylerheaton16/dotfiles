-- This file can be loaded by calling `lua require('plugins')` from your init.vim
return require('packer').startup(function()

  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Color Scheme
  use 'JoosepAlviste/palenightfall.nvim'
  require('palenightfall').setup()

end)
