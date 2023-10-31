local function set_scrolloff()
  local new_height = vim.fn.winheight(0)
  vim.o.scrolloff = string.format('%.f', new_height / 3) + 0
end

vim.api.nvim_create_autocmd('VimResized', {
  callback = set_scrolloff,
  desc = 'Reset the scrolloff option on every window resize'
})
