let s:interpreter_dict = {
  \ 'vim': 'vim',
  \ 'python': 'python',
  \ 'javascript': 'node',
  \ 'java': 'java',
  \ 'typescript': 'ts-node',
  \ 'sql': 'mysql --table <',
  \ 'mongodb': 'mongosh --quiet <',
  \ 'sh': 'sh',
  \ 'fish': 'fish',
  \ 'plaintex': 'lualatex',
  \ 'tex': 'lualatex',
  \ 'make': 'make -f'
  \ }

" Define a function to execute the current buffer
function! RunBuffer()
  let first_line = getline(1)
  let interpreter = substitute(first_line, '^#!', '', '')
  let filetype = &ft

  if interpreter != '' && interpreter != first_line
    let cmd = interpreter
  elseif has_key(s:interpreter_dict, filetype)
    let cmd = s:interpreter_dict[filetype]
  else
    echo "Interpreter not found for filetype: " . filetype
    return
  endif

  let file = expand('%')
  let save_cmd = 'silent! wa'
  if filetype == 'vim'
    let run_cmd = 'source ' . file
  else
    let run_cmd = '!' . cmd . ' ' . file
  endif
  execute save_cmd | execute run_cmd
endfunction

" Map a key to run the current buffer
nnoremap <leader><leader> :w<cr>:call RunBuffer()<cr>
