set nocompatible
set number              " show line numbers

"Enables the Airline plugin
let g:airline#extensions#tabline#enabled = 1

" Mouse and ttymouse settings allows using a mouse and to click-drag the window splits
set mouse=n
set ttymouse=xterm2

" ColorScheme
set t_Co=256
colorscheme codedark

" TAB SPACING
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

" UI CONFIG
set showcmd             " show command in bottom bar
set showmatch           " highlight matching [{()}]

" SEARCHING
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" FOLDING
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
" space open/closes folds
nnoremap <space> za
set foldmethod=indent   " fold based on indent level


" NetrwTreeListing - File Browser Settings
" note: do not enable auto-open using augroup because it causes extra screen for vimdiff
let g:netrw_banner = 0          " disables the top banner
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25        " sets initial window size


" PLUGINS
call plug#begin('~/.vim/plugged')       "Specifies a directory for plugins
Plug 'vim-airline/vim-airline'
Plug 'tomasiser/vim-code-dark'
call plug#end()                         " Initialize plugin system

" Mapping
map <C-H> <C-W>h<C-W>_
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_


" XML Formating
map <C-F> gg=G                  " this maps vim's format command to Ctrl-F
map <C-E> :%s/> *</>\r</g<CR>   " this maps a substitute command to expand an xml line
let mapleader = "x"             " this auto indents on return

" Shift key fixes
cmap W w
cmap WQ wq
cmap wQ wq
cmap Q q
cmap Tabe tabe

