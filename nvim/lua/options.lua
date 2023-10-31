vim.cmd('filetype on')

vim.cmd('syntax enable')
vim.cmd('colorscheme nord')
vim.o.background = 'dark'
vim.o.termguicolors = true

vim.o.number = true
vim.o.relativenumber = true

vim.o.hidden = true
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 2
vim.o.tabstop = 4
vim.o.scrolloff = string.format('%.f', vim.o.lines / 3) + 0

vim.o.clipboard = 'unnamedplus'
vim.opt.colorcolumn = {80}

-- Enable mouse click for nvim
vim.o.mouse = 'a'

-- See invisible characters
vim.opt.listchars = {tab = '» ', trail = '+', eol = '$'}

-- Wrap to next line when end of line is reached
vim.o.whichwrap = '<,>,[,]'

vim.opt.guicursor = {'i:ver100-iCursor', 'r:hor100-rCursor'}
if vim.env.TERM ~= 'alacritty' then
  vim.opt.guicursor:prepend('n-v-c:block-Cursor')
end

vim.cmd('highlight Cursor guifg=#1E1E1E guibg=#E1E1E1')

vim.g.python3_host_prog = '/usr/bin/python3'
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
