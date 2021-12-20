call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'w0rp/ale'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'honza/vim-snippets'
Plug 'arcticicestudio/nord-vim'
"Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'sheerun/vim-json'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'shmup/vim-sql-syntax'
Plug 'ekalinin/dockerfile.vim'
Plug 'diepm/vim-rest-console'
call plug#end()

nnoremap <F4> :nohlsearch<cr>
nnoremap <F5> :!node %
nnoremap <F9> :e ./.rest<cr>:set ft=rest<cr>
tnoremap <esc> <C-\><C-n>
let g:vrc_horizontal_split=1

syntax enable

set number
set relativenumber
set hidden

let g:gruvbox_italic=1
colorscheme nord
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

"Press AltGr + f to go to next buffer
nnoremap đ :hide bnext <cr>
"Press AltGr + d to go to previous buffer
nnoremap ð :hide bprevious <cr>
"Press AltGr + g to go to last buffer
nnoremap ŋ :hide blast <cr>
"Press AltGr + s to go to first buffer
nnoremap ß :hide bfirst <cr>
"Press AltGr + c to close current buffer
nnoremap © :bdelete! <cr>
"Press AltGr + v to open a new buffer
nnoremap “ :hide enew <cr>
"Press AltGr + a to toggle NerdTree
nnoremap æ :NERDTreeToggle <cr>
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
set guicursor=n-v-c:block-Cursor
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
