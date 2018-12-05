"        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|


let mapleader = " "

" PLUGINS 
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tomasiser/vim-code-dark'
call plug#end()

" Enables the Airline plugin
let g:airline#extensions#tabline#enabled = 1


" GENERAL
set number
set nowrap
set noswapfile
set nocompatible
set encoding=utf-8
set backspace=indent,eol,start
filetype plugin on
syntax enable


" AUTOCOMPLETION
set wildmode=longest,list,full


" WINDOW SPLITS
set splitbelow splitright	" sets where to open splits
map <C-h> <C-w>h			" navigational mapping for h
map <C-j> <C-w>j			" navigational mapping for j
map <C-k> <C-w>k			" navigational mapping for k
map <C-l> <C-w>l			" navigational mapping for l


" INDENTATION
set autoindent
set smartindent


" MOUSE
set mouse=a				" a -> all modes
set ttymouse=xterm2		" terminal type


" COLOR SCHEME
set t_Co=256
colorscheme codedark


" TAB SPACING
set tabstop=4 softtabstop=0 shiftwidth=4 smarttab


" DISPLAY & FORMAT
set showcmd             " show command in bottom bar
set showmatch           " To identify open and close brace positions when you traverse through the file
set wrapmargin=2		" To wrap text based on a number of columns from the right side


" SEARCHING
set incsearch           " To perform incremental searches as you type
set hlsearch            " To highlight the searched term in a file
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>


" FOLDING
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
" space open/closes folds
nnoremap <space> za
set foldmethod=indent   " fold based on indent level


" SPELL CHECKER
set spell spelllang=en_us
set spellfile=~/.vim/spell/en.utf-8.add
highlight SpellBad cterm=underline
highlight CursorLine cterm=bold
" Spell Checker Commands
" 	]s	jump to next misspelled word
" 	[s	jump to last misspelled word
" 	z=	provides suggestions
" 	zg	adds the word to the misspell file
" 	zug	removes a word from the misspell file
" 	zw	marks a misspelled word
" 	zuw	will unmark a misspelled word


" NetrwTreeListing - File Browser Settings
" note: do not enable auto-open using augroup because it causes extra screen for vimdiff
let g:netrw_banner = 0          " disables the top banner
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 10        " sets initial window size


" XML FORMATING
map <C-F> gg=G                  " this maps vim's format command to Ctrl-F
map <C-E> :%s/> *</>\r</g<CR>   " this maps a substitute command to expand an xml line
"let mapleader = "x"             " this auto indents on return


" SHIFT-KEY FIXES
cmap W w
cmap WQ wq
cmap wQ wq
cmap Q q
cmap Tabe tabe


