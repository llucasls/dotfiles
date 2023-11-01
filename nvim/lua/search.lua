-- Define the Lua function for VSetSearch
vim.g.VSetSearch = function()
    local temp = vim.fn.getreg('@')
    vim.cmd([[normal! gvy]])
    local escaped_contents = vim.fn.escape(vim.fn.getreg('@'), '\\')
    local formatted_contents = string.gsub(escaped_contents, '\n', '\\n')
    vim.fn.setreg('/', '\\V' .. formatted_contents)
    vim.fn.setreg('@', temp)
end

local keymap_options = { noremap = true, silent = false }

vim.api.nvim_set_keymap('x', '/',
    [[:<C-u>call VSetSearch()<CR>//<CR>]], keymap_options)

vim.api.nvim_set_keymap('x', '?',
    [[:<C-u>call VSetSearch()<CR>??<CR>]], keymap_options)

vim.api.nvim_set_keymap('x', '<leader>/',
    [[:<C-u>call VSetSearch()<CR>:%s/<C-r>///g<Left><Left>]], keymap_options)
