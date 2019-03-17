"        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|


let mapleader = " "


" Install Vim-Plug if it is not already installed
function! CheckVimPlug()
	if empty(glob('~/.vim/autoload/plug.vim'))
		silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
	endif
endfunction


" PLUGINS
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tomasiser/vim-code-dark'
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'ctrlpvim/ctrlp.vim'
call plug#end()


" Automatically update plugins when opening vimrc
autocmd BufRead,BufNewFile .vimrc PlugUpdate --sync | source $MYVIMRC | sleep 2 | :q | :normal gg


" Enables the Airline plugin
let g:airline#extensions#tabline#enabled = 1


" TABLINE FORMATTER
let g:airline#extensions#tabline#formatter = 'unique_tail'


" GENERAL
set number
set nowrap
set noswapfile
set nocompatible
set encoding=utf-8
set backspace=indent,eol,start
set whichwrap+=<,>,h,l,[,]		" allows traversing the end of lines
filetype plugin on
syntax enable


" COLOR SCHEME
set t_Co=256
colorscheme codedark


" AUTOCOMPLETION
set wildmode=longest,list,full


" WINDOW SPLITS
set splitbelow splitright	" sets where to open splits	
"split navigations
	nnoremap <C-J> <C-W><C-J>
	nnoremap <C-K> <C-W><C-K>
	nnoremap <C-L> <C-W><C-L>
	nnoremap <C-H> <C-W><C-H>


" INDENTATION
set autoindent
set smartindent


" MOUSE
set mouse=a				" a -> all modes
set ttymouse=xterm2		" terminal type


" TABS
set tabstop=4 softtabstop=0 shiftwidth=4 smarttab	" spacing
let g:tablineclosebutton=1							" tab close button 'X'


" BUFFERS are not tabs! :-)
map <Leader>t :tabnew<Esc>


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
set foldmethod=indent
set foldlevel=99
nnoremap <Leader>za		" space open/closes folds


" SPELL CHECKER
set spell spelllang=en_us
set spellfile=~/.vim/spell/en.utf-8.add
highlight CursorLine cterm=bold
" Spell Checker Commands
" 	]s	jump to next misspelled word
" 	[s	jump to last misspelled word
" 	z=	provides suggestions
" 	zg	adds the word to the misspell file
"
" 	zug	removes a word from the misspell file
" 	zw	marks a misspelled word
" 	zuw	will unmark a misspelled word
function! ToggleSpell()
	if !exists("g:showingSpell")
		let g:showingSpell=0
	endif
	if g:showingSpell==0
		exec "highlight SpellBad cterm=underline"
		let g:showingSpell=1
	else
		exec "highlight clear SpellBad"
		let g:showingSpell=0
	endif
endfunction
map <silent> <Leader>o :call ToggleSpell()<CR>


" LINE WRAP TOGGLE
set linebreak
map <silent> <Leader>l :set wrap!<CR>


" NetrwTreeListing - File Browser Settings
" note: do not enable auto-open using augroup because it causes extra screen for vimdiff
let g:netrw_banner = 0          " disables the top banner
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 15        " sets initial window size


" XML FORMATING
map <C-F> gg=G                  " this maps vim's format command to Ctrl-F
map <C-E> :%s/> *</>\r</g<CR>   " this maps a substitute command to expand an xml line


" SHIFT-KEY FIXES
cmap W w
cmap WQ wq
cmap wQ wq
cmap Q q
cmap Tabe tabe


