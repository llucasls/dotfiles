local nvimdir = vim.fn.stdpath('config')
local function source(file)
  vim.cmd(string.format('source %s/%s', nvimdir, file))
end

source  'plugins.vim'
require 'options'
require 'keybindings'
require 'run_buffer'
require 'search'
source  'help.vim'
require 'autocmd'
