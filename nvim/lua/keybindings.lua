vim.g.mapleader = ','

vim.keymap.set('n', '<F2>', ':NERDTreeToggle <cr>')
vim.keymap.set('n', '<F3>', ':set relativenumber!<cr>')
vim.keymap.set('n', '<F4>', ':nohlsearch<cr>')
-- Select all the current file's content
vim.keymap.set('n', '<leader>y', ':%yank+<cr>')
vim.keymap.set('n', '<leader>s', ':%substitute//g<left><left>')
-- Shift + Tab writes hard tab
vim.keymap.set('i', '<S-Tab>', '<C-V><Tab>')
-- Ctrl + Tab does inverse tab
vim.keymap.set('i', '<C-Tab>', '<C-d>')
vim.keymap.set('n', '<PageUp>', ':hide bprevious<cr>')
vim.keymap.set('n', '<PageDown>', ':hide bnext<cr>')
vim.keymap.set('n', '<Home>', ':hide bfirst<cr>')
vim.keymap.set('n', '<End>', ':hide blast<cr>')
vim.keymap.set('n', '<Del>', ':bdelete!<cr>')
-- Remap the j, k, 0 and $ keys to gj, gk, g0 and g$ in normal mode
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
vim.keymap.set('n', '0', 'g0')
vim.keymap.set('n', '$', 'g$')
vim.keymap.set('i', '(', '()<left>')
vim.keymap.set('i', '[', '[]<left>')
vim.keymap.set('i', '{', '{}<left>')
vim.keymap.set('i', "'", "''<left>")
vim.keymap.set('i', '"', '""<left>')
