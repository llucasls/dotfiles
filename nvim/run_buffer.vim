" Define a function to execute the current buffer
function! RunBuffer()
  let first_line = getline(1)
  let interpreter = substitute(first_line, '^#!', '', '')
  let filetype = &ft
  let interpreter_dict = {
    \ 'vim': 'vim',
    \ 'python': 'python',
    \ 'javascript': 'node',
    \ 'typescript': 'ts-node',
    \ 'sql': 'mysql --table <',
    \ }

  if interpreter != '' && interpreter != first_line
    let cmd = interpreter
  elseif has_key(interpreter_dict, filetype)
    let cmd = interpreter_dict[filetype]
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
nnoremap <F5> :w<CR>:call RunBuffer()<CR>
