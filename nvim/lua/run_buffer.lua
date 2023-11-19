local interpreter_table = {
  vim = 'vim',
  lua = 'lua',
  lisp = 'emacs -x',
  python = 'python3',
  javascript = 'node',
  php = 'php',
  java = 'java',
  coffee = 'coffee',
  typescript = 'ts-node',
  sql = 'mysql --table <',
  mongodb = 'mongosh --quiet <',
  sh = 'sh',
  fish = 'fish',
  r = 'Rscript',
  plaintex = 'lualatex',
  tex = 'lualatex',
  c = 'exec-c',
  make = 'make -f',
}

local expand_list = {'%', '#'}

local function get_interpreter()
  first_line = vim.fn.getline(1)
  shebang_cmd, n = string.gsub(first_line, '^#!', '')
  file_uses_shebang = n == 1
  filetype = vim.o.filetype

  if file_uses_shebang then
    return shebang_cmd
  elseif interpreter_table[filetype] ~= nil then
    return interpreter_table[filetype]
  else
    print('Interpreter not found for filetype: ' .. filetype)
  end
end

local function obj_is_in_table(obj, tbl)
  for _, value in pairs(tbl) do
    if obj == value then
      return true
    end
  end
  return false
end

vim.g.RunBuffer = function()
  local command = get_interpreter()
  local file = vim.fn.expand('%')
  local filetype = vim.o.filetype

  vim.cmd({ addr = 'none', cmd = 'wall', mods = { emsg_silent = true }})

  if filetype == 'vim' then
    local args = { 'nvim', '-c', "'source", file, '|', "exit'" }
    vim.cmd({ cmd = '!', args = args })
  else
    vim.cmd({ addr = 'line', cmd = '!', args = { command, file }})
  end
end

vim.g.RunBufferWithArgs = function()
  local InputInterrupt = ''
  cmd = get_interpreter()
  prompt = string.format('$ %s ', cmd)
  input_options = { prompt = prompt, cancelreturn = InputInterrupt }
  user_input = vim.fn.input(input_options)

  if user_input ~= InputInterrupt then
    print('\n')
    args = {}
    for arg in user_input:gmatch('%S+') do
      if obj_is_in_table(arg, expand_list) then
        table.insert(args, vim.fn.expand(arg))
      else
        table.insert(args, arg)
      end
    end
    result = table.concat(args, ' ')
    command = string.format('%s %s', cmd, result)
    output = vim.fn.systemlist(command)
    for _, line in pairs(output) do
      print(line)
    end
  end
end

vim.keymap.set('n', '<leader><leader>', ':w<cr>:call RunBuffer()<cr>')
vim.keymap.set('n', '<leader><space>', ':w<cr>:call RunBufferWithArgs()<cr>')
