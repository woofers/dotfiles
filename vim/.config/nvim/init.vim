
" Install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"
" Functions
"

" Toggles Between Relative Line Numbers and Abosulte
function! ToggleNumber()
	if(&relativenumber == 1)
		set norelativenumber
		set number
	else
		set relativenumber
	endif
endfunction

" Toggles Visible Tabs
function! ToggleShowTabs()
	setlocal lcs=tab:│ ,trail:· list! list?
endfunction

" Swap Line Toggle
function! s:swap_lines(n1, n2)
	let line1 = getline(a:n1)
	let line2 = getline(a:n2)
	call setline(a:n1, line2)
	call setline(a:n2, line1)
endfunction

" Swap Line Up
function! s:swap_up()
	let n = line('.')
	if n == 1
		return
	endif

	call s:swap_lines(n, n - 1)
	exec n - 1
endfunction

" Swap Line Down
function! s:swap_down()
	let n = line('.')
	if n == line('$')
		return
	endif

	call s:swap_lines(n, n + 1)
	exec n + 1
endfunction

"
" Plug-Ins
"

" Add Plug-Ins
call plug#begin('~/.config/nvim/plugins')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'}
Plug 'dracula/vim'
Plug 'sjl/vitality.vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'terryma/vim-smooth-scroll'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-tmux-navigator'
Plug 'majutsushi/tagbar'
Plug 'tacahiroy/ctrlp-funky'

call plug#end()

" Airline Symbols
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

"
" Behavoir
"

" Set to Tabs With 4 Spaces
set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4

" Line Wrap
set breakindent
set showbreak=\\\\\

" Auto Indent
set cindent

" Disable Auto-Indent
set ai

" Display Line Numbers
set relativenumber

" Enable Mouse
set mouse=a

" Scrolling
set so=8

" Less Case Sensitivity
set infercase

" Set Term to ZSH
set shell=/bin/zsh

" Enable Term Colors
set termguicolors

" Remove Swap File
set nobackup
set noswapfile

" Use System Clipboard
set clipboard=unnamed

" Hightlight First 100 Characters
" of a Line
set synmaxcol=135

" Change Terminal's Title
set title

" Better Searching
set incsearch
set hlsearch

" Set up English Spellchecking
set spelllang=en
setlocal spell

"
" Key Mapings
"

" Remap Colon
nnoremap ; :
nnoremap : ;

" Remap of Insert Keys
nnoremap o i
nnoremap i a
nnoremap a o

" Remap Redo
nnoremap r <C-r>

" Map /T to Show Tabs
nnoremap <leader>t :call ToggleShowTabs()<CR>

" Clear Hightling With Space
nnoremap <leader><space> :nohlsearch<CR>

" Toggle File Expoler
nnoremap <C-n> :NERDTreeToggle<CR>

" Undo Less
inoremap . .<C-g>u
inoremap ? ?<C-g>u
inoremap ! !<C-g>u
inoremap , ,<C-g>u

" Switch Buffers With ,, And ,.
nnoremap <silent> , :bp<CR>
nnoremap <silent> . :bn<CR>

" Visual indent
nnoremap <C-l> >>
nnoremap <C-h> <<
vnoremap <C-l> >gv
vnoremap <C-h> <gv
imap <C-l> <C-o><C-l>
imap <C-h> <C-o><C-h>

" Visual Dot Repeat
xnoremap . :norm.<CR>

" Toggle Between File Expoler and File
nnoremap <C-e> <C-w><C-w>

" Opens File Under Cursor
nnoremap gf :vertical wincmd f<CR>

" Jump To Next Row Rather Than Line
nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'

" Exit With Crtl W
nnoremap <C-w> :q!<CR>
inoremap <C-w> <C-c>:q!<CR>

" Save With Crtl S
nnoremap <C-s> :w<CR>
inoremap <C-s> <C-c>:w<CR>

" Save and Quit With Crtl X
nnoremap <C-x> :w\|bd<CR>
inoremap <C-x> <C-c>:w\|bd<CR>

" Select All With Crtl A
nnoremap <C-a> ggVG
inoremap <C-a> ggVG

" Change World Under Cursor
nnoremap c* *Ncgn
nnoremap c# #NcgNi

" Close Root Files
cmap w!! w !sudo tee % >/dev/null

" Swap Lines
noremap <silent> <C-k> :call <SID>swap_up()<CR>
noremap <silent> <C-j> :call <SID>swap_down()<CR>
imap <C-k> <C-o><C-k>
imap <C-j> <C-o><C-j>
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gvhhh

" Highlight Last Inserted Text
nnoremap gV `[v`]

" Toggle Line Numbers on \F
nnoremap <leader>f :call ToggleNumber()<CR>

" Scroll Up and Down
noremap <silent> <C-u> :call smooth_scroll#up(&scroll / 5, 6, 1)<CR>
noremap <silent> <C-d> :call smooth_scroll#down(&scroll / 5, 6, 1)<CR>

" Disable Arrow keys in Escape mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Disable Arrow keys in Insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Scroll Wheel
nmap <ScrollWheelUp> <C-U>
nmap <ScrollWheelDown> <C-D>

" Ctrl P Funky
nnoremap <C-r> :CtrlPFunky<Cr>

nnoremap <C-m> :TagbarToggle<CR>

" Navigate Tabs
set winaltkeys=no
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <M-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <M-j> :TmuxNavigateDown<cr>
nnoremap <silent> <M-k> :TmuxNavigateUp<cr>
nnoremap <silent> <M-l> :TmuxNavigateRight<cr>

" Enable Term Colors
if (has("termguicolors"))
set termguicolors
endif

" Set Theme
syntax enable
colorscheme dracula
let g:airline_theme='light'

" Allow File Specific
filetype indent on

" Ignore Non-Text File Types
set wildignore=*.swp,*.bak,*.pyc,*.class
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd
set wildignore+=node_modules/*,bower_components/*

" Airline Settings
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_z = airline#section#create(['windowswap', '%3p%% ', 'linenr', ':%3v'])

" Java Auto Complete
autocmd FileType java setlocal omnifunc=javacomplete#Complete

" Auto Open NERDTree Upon Starting VIM
" Without a File
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"autocmd vimenter * NERDTree

" Close VIM when only NERDTree is Open
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Ctrl P Funky Syntax
let g:ctrlp_funky_syntax_highlight = 1

" Equalize Splits On Resize
autocmd VimResized * wincmd =

" Highlight Current Line in Current File
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

" Rename TMUX Tab to File Name
if exists('$TMUX')
	autocmd BufEnter * call system("tmux rename-window 'NVIM: " . expand("%:t") . "'")
	autocmd VimLeave * call system("tmux setw automatic-rename")
endif

" Excuted Upon Open
augroup preread
	autocmd!

		" Enable Shell Highlighting
		autocmd BufRead,BufNewFile *.sh :setf sh
		autocmd BufRead,BufNewFile *.bash :setf sh
		autocmd BufRead,BufNewFile *.bashrc :setf sh

		" Show Tabs
		autocmd BufRead,BufNewFile * silent exec "call ToggleShowTabs()"
augroup END

" Excuted On Save
augroup prewrite
	autocmd!

		" Remove Trailing Spaces
		autocmd BufWritePre,FileWritePre * :%s/\s\+$//e | %s/\r$//e

		" Converts Spaces to Tabs
		autocmd BufWritePre,FileWritePre * :%retab!
augroup END

" Enable Deoplete
call deoplete#enable()

