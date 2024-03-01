local Plug = vim.fn['plug#']
--  vim.g.polyglot_disabled = ['sensible']

vim.fn['plug#begin']()
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'editorconfig/editorconfig-vim'
Plug 'w0rp/ale'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'arcticicestudio/nord-vim'
Plug 'garbas/vim-snipmate'
-- Plug 'morhetz/gruvbox'
-- Plug 'liuchengxu/space-vim-dark'
-- Plug 'raphamorim/lucario'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'diepm/vim-rest-console'
Plug 'sheerun/vim-polyglot'
Plug 'vim-scripts/info.vim'
-- Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ryanoasis/vim-devicons'
vim.fn['plug#end']()

vim.g.EditorConfig_exclude_patterns = {'fugitive://.*', 'scp://.*'}

vim.g.vrc_horizontal_split = 1

vim.g.snipMate = { snippet_version = 1 }

vim.g.vrc_curl_opts = { ['-v'] = '' }

vim.g.gruvbox_italic = 1
vim.g['airline#extensions#tabline#enabled'] = 1
vim.g['airline#extensions#tabline#left_sep'] = ' '
vim.g['airline#extensions#tabline#left_alt_sep'] = '|'
vim.g['airline#extensions#tabline#formatter'] = 'unique_tail'
