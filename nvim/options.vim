" enable file type detection
filetype on

syntax enable
colorscheme nord

set number
set relativenumber
set hidden
set background=dark
set expandtab
set autoindent
set softtabstop=4
set shiftwidth=2
set tabstop=4

"Enable mouse click for nvim
set mouse=a
"Fix cursor replacement after closing nvim
set guicursor=

"See invisible characters
set list listchars=tab:»\ ,trail:+,eol:$

"wrap to next line when end of line is reached
set whichwrap+=<,>,[,]

set clipboard+=unnamedplus
set termguicolors
set colorcolumn=80

if $TERM !=# 'alacritty'
  set guicursor=n-v-c:block-Cursor
endif
set guicursor+=i:ver100-iCursor
set guicursor+=r:hor100-rCursor

highlight Cursor guifg=#1E1E1E guibg=#E1E1E1

set scrolloff=12

let g:loaded_ruby_provider = 0
let g:loaded_node_provider = 0
let g:loaded_perl_provider = 0
