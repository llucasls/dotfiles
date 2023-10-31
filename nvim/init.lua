local nvimdir = vim.fn.stdpath('config')
function Source(file)
  vim.cmd(string.format('source %s/%s', nvimdir, file))
end

Source  'plugins.vim'
Source  'options.vim'
require 'keybindings'
Source  'run_buffer.vim'
Source  'search.vim'
Source  'caps_lock.vim'
Source  'help.vim'
