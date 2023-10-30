let s:nvimdir = stdpath("config")
function Source(file)
  execute printf("source %s/%s", s:nvimdir, a:file)
endfunction

call Source("plugins.vim")
call Source("options.vim")
call Source("keybindings.vim")
call Source("run_buffer.vim")
call Source("search.vim")
call Source("caps_lock.vim")
call Source("help.vim")
