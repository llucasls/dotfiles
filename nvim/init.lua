local nvimdir = vim.fn.stdpath('config')
local function source(file)
  vim.cmd(string.format('source %s/%s', nvimdir, file))
end

source  'plugins.vim'
require 'options'
require 'keybindings'
source  'run_buffer.vim'
source  'search.vim'
source  'caps_lock.vim'
source  'help.vim'
require 'autocmd'
