vim.g.mapleader = ' '
vim.g.localleader = ' '

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require 'config'

require'lazy'.setup({
  require 'plugins.core',
  require 'plugins.ui',
  require 'plugins.editor',
  require 'plugins.git',
  require 'plugins.telescope',
  require 'plugins.lsp',
  require 'plugins.completion',
  require 'plugins.debug',
  require 'plugins.tasks',
})
