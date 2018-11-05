" General configurations
" -------------------------------------------------------------------------------------------------
set nocompatible
set number
set encoding=utf-8
set clipboard=unnamed	" use system clipboard to cut/copy/paste from other applications
set backspace=indent,eol,start
set autowrite

" Mouse settings enables mouse in normal and to resize window splits
set mouse=n
set ttymouse=xterm2


" Tab spacing
" -------------------------------------------------------------------------------------------------
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab


" Enable folding
" -------------------------------------------------------------------------------------------------
set foldmethod=indent
set foldlevel=99
noremap <space> za	" enables folding with the spacebar


" Initial window settings
" -------------------------------------------------------------------------------------------------
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20
let g:netrw_sort_sequence = '[\/]$,*'
"augroup ProjectDrawer
" autocmd!
" autocmd VimEnter * :Vexplore
"augroup END


" Key Remapping
" -------------------------------------------------------------------------------------------------
nnoremap <C-H> <C-W>h<C-W>_	" Ctrl-h  will move cursor left one window
nnoremap <C-J> <C-W>j<C-W>_	" Ctrl-j  will move cursor down one window
nnoremap <C-K> <C-W>k<C-W>_	" Ctrl-k  will move cursor up one window
nnoremap <C-L> <C-W>l<C-W>_	" Ctrl-l  will move cursor right one window
nnoremap <C-R> <C-W>r<C-W>_	" Ctrl-r  will move cursor swaps windows
nnoremap <space> za		" Enable folding with the spacebar
nnoremap <C-Up> <Up>"add"ap<Up>
nnoremap <C-Down> "add"ap

noremap <silent> <Leader>cc :TComment<CR>       " Key remap to customize the :associated key for tcomment - Leader C is the prefix for code related mappings

" shortcuts for xml formatting
map <C-F> gg=G                  " this maps vim's format command to Ctrl-F
map <C-E> :%s/> *</>\r</g<CR>   " this maps a substitute command to expand an xml line

" shortcuts for json formatting
map <C-J> :%!python -m json.tool<CR>


" Stupid shift key fixes
cmap W w
cmap WQ wq
cmap wQ wq
cmap Q q
cmap Tabe tabe


" Plugin Configuration
" -----------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')	" specify directory for plugins

" List plugins here
Plug 'tomtom/tcomment_vim'		" tcomment for unified fast commenting
Plug 'itchyny/lightline.vim'		" using Lightline for the status line
Plug 'aradunovic/perun.vim'		" perun colorscheme
Plug 'elixir-editors/vim-elixir'	" Elixir language editing
Plug 'tpope/vim-rails'			" Ruby Rails framework editing


call plug#end()				" End Plug Configuration
" Initialize plugins in default VIM window to install or update
" by opening Vim from the terminal and simply typing :PlugInstall


noremap <silent> <Leader>cc :TComment<CR>	" Key remap to customize the :associated key for tcomment - Leader C is the prefix for code related mappings

" Keys Configuration
" -----------------------------------------------------------------------------
let mapleader = ','



