call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'w0rp/ale'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'arcticicestudio/nord-vim'
Plug 'garbas/vim-snipmate'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'diepm/vim-rest-console'
call plug#end()

tnoremap <Esc> <C-\><C-n>
nnoremap <F2> :NERDTreeToggle <cr>
nnoremap <F3> :set relativenumber! <cr>
nnoremap <F4> :nohlsearch<cr>
nnoremap <F5> :w<cr> :!node %<cr>
nnoremap <silent> <F6> :w<cr> :!mongosh --quiet < %<cr>
nnoremap <F9> :e ./.rest<cr>:set ft=rest<cr>
tnoremap <esc> <C-\><C-n>
let g:vrc_horizontal_split=1

filetype on

let g:snipMate = { 'snippet_version' : 1 }

let g:vrc_curl_opts = { '-v': '', }

syntax enable
colorscheme nord
"colorscheme space-vim-dark
"colorscheme lucario

set number
set relativenumber
set hidden

let g:gruvbox_italic=1
set background=dark
"highlight Normal     ctermbg=NONE guibg=NONE
"highlight LineNr     ctermbg=NONE guibg=NONE
"highlight SignColumn ctermbg=NONE guibg=NONE
"let g:airline_theme='base16_gruvbox_dark_hard'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'

set expandtab
set autoindent
set softtabstop=4
set shiftwidth=2
set tabstop=4

"Enable mouse click for nvim
set mouse=a
"Fix cursor replacement after closing nvim
set guicursor=
"Shift + Tab writes hard tab
inoremap <S-Tab> <C-V><Tab>
"Ctrl + Tab does inverse tab
inoremap <C-Tab> <C-d>

"See invisible characters
set list listchars=tab:»\ ,trail:+,eol:$

"wrap to next line when end of line is reached
set whichwrap+=<,>,[,]

set clipboard+=unnamedplus
set termguicolors
set colorcolumn=80

nnoremap <PageUp> :hide bprevious <cr>
nnoremap <PageDown> :hide bnext <cr>
nnoremap <Home> :hide bfirst <cr>
nnoremap <End> :hide blast <cr>
nnoremap <Del> :bdelete! <cr>
"nnoremap <Insert> :hide enew <cr>

"Remap the j, k, 0 and $ keys to gj, gk, g0 and g$ in normal mode
nmap j gj
nmap k gk
nmap 0 g0
nmap $ g$

inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap ' ''<left>
inoremap " ""<left>

highlight Cursor guifg=#2E3440 guibg=#ECEFF4
highlight iCursor guifg=#2E3440 guibg=#ECEFF4
highlight rCursor guifg=#2E3440 guibg=#ECEFF4
set guicursor+=i:ver100-iCursor
set guicursor+=r:hor100-rCursor

set scrolloff=12
" Function to turn off caps lock
" https://vi.stackexchange.com/questions/376/can-vim-automatically-turn-off-capslock-when-returning-to-normal-mode/11506
" https://vi.stackexchange.com/users/11493/avian-y
function TurnOffCaps()
    let capsState = matchstr(system('xset -q'), '00: Caps Lock:\s\+\zs\(on\|off\)\ze')
    if capsState == 'on'
        silent! execute ':!xdotool key Caps_Lock'
    endif
endfunction
" Call the function defined above
" https://vi.stackexchange.com/users/3308/ruben
au InsertLeave * call TurnOffCaps()
