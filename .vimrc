set nocompatible
set number              " show line numbers

" TAB SPACING
"set tabstop=4           " number of visual spaces per TAB
"set expandtab           " tabs are spaces
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

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

" NETRW File Broswer Settings
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
augroup ProjectDrawer
    autocmd!
    autocmd VimEnter * :Vexplore
augroup END

map <C-H> <C-W>h<C-W>_
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-F> gg=G<CR>_             " this maps vim's format command to Ctrl-F
map <C-E> :%s/> *</>\r</g<CR>   " this maps a substitute command to expand an xml line

" Stupid shift key fixes
cmap W w
cmap WQ wq
cmap wQ wq
cmap Q q
cmap Tabe tabe

