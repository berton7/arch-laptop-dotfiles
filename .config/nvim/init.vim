" set tabs over spaces
set autoindent
set noexpandtab
set tabstop=4
set shiftwidth=4

set number			" enable number lines
set lazyredraw		" lazy redraw of screen
set hlsearch		" highlight search results

inoremap jk <esc>

call plug#begin('~/.local/share/nvim/plugged')

Plug 'davidhalter/jedi-vim'						" several completion and qol things for python (requires pip install jedi)
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }		" async completion for python
Plug 'zchee/deoplete-jedi'						" also completion
Plug 'vim-airline/vim-airline'					" status bar
Plug 'jiangmiao/auto-pairs'						" auto insert double quotes and parenthesis
Plug 'scrooloose/nerdcommenter'					" <leader>cc to comment line, <leader>cu to uncomment
Plug 'sbdchd/neoformat'							" :NeoFormat to format code
Plug 'scrooloose/nerdtree'						" project directory structure
Plug 'neomake/neomake'							" linting for python
Plug 'joshdick/onedark.vim'						" best theme dhmu
Plug 'machakann/vim-highlightedyank'			" highlight yank selection
Plug 'tmhedberg/SimpylFold'						" zo open fold, zO open recursive, zc close fold, zC close recursive

call plug#end()

colorscheme onedark
let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1

let g:jedi#completions_enabled = 0
let g:jedi#use_splits_not_buffers = "right"

let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

let g:neomake_python_enabled_makers = ['mypy']
call neomake#configure#automake('nrwi', 500)

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
