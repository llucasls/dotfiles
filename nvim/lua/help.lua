-- Use Help command to open help pages without splitting vertically
local did_open_help = false
local mods = { keepalt = true, silent = true, noautocmd = true }

local function help_curwin(subject)
  if not did_open_help then
    vim.cmd({ cmd = 'help', mods = mods })
    vim.cmd({ cmd = 'helpclose', mods = mods })
    did_open_help = true
  end

  if #vim.fn.getcompletion(subject['args'], 'help') > 0 then
    vim.cmd({ cmd = 'edit', mods = mods, args = {vim.o.helpfile} })
    vim.o.buftype = 'help'
  end

  vim.cmd({ cmd = 'help', args = subject['fargs'] })
end

vim.api.nvim_create_user_command('HelpCurwin', help_curwin, {
  complete = 'help', bang = false, bar = true, nargs = '?',
  desc = 'Open Help command in a tall buffer'
})
