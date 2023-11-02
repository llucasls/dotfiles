local nvimdir = vim.fn.stdpath('config')
local function source(file)
  vim.cmd(string.format('source %s/%s', nvimdir, file))
end

require 'plugins'
require 'options'
require 'keybindings'
require 'run_buffer'
require 'search'
require 'help'
require 'autocmd'
