local XDOTOOL_CMD = { 'xdotool', 'key', 'Caps_Lock' }

local function set_scrolloff()
  local new_height = vim.fn.winheight(0)
  vim.o.scrolloff = string.format('%.f', new_height / 3) + 0
end

local function turn_off_caps()
  local xset_query = vim.fn.systemlist({'xset', '-q'})
  if vim.v.shell_error ~= 0 then
    print('Error running xset command')
    return
  end

  for _, line in pairs(xset_query) do
    local caps_lock_status = line:match('Caps Lock:%s*(%a+)')
    if caps_lock_status == 'on' then
      vim.cmd({ cmd = '!', args = XDOTOOL_CMD, mods = { emsg_silent = true }})
      return
    elseif caps_lock_status == 'off' then
      return
    end
  end
end

local automate = vim.api.nvim_create_augroup('automate', { clear = true })

vim.api.nvim_create_autocmd('VimResized', {
  callback = set_scrolloff,
  desc = 'Reset the scrolloff option on every window resize',
  group = automate,
})

vim.api.nvim_create_autocmd('InsertLeave', {
  callback = turn_off_caps,
  desc = 'Turn off Caps Lock when leaving Insert Mode',
  group = automate,
})
