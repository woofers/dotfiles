
" Install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
	\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

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

" Add Plug-Ins
call plug#begin('~/.config/nvim/plugins')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'}
Plug 'dracula/vim'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'terryma/vim-smooth-scroll'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'

call plug#end()

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

" Set to Tabs With 4 Spaces
set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4
set breakindent
set showbreak=\\\\\

" Show Tabs
silent exec "call ToggleShowTabs()"

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

" Remove Swap File
set nobackup
set noswapfile

" Hightlight First 200 Characters
" of a Line
set synmaxcol=200

" Remap Colon
nnoremap ; :
nnoremap : ;

" Map /T to Show Tabs
nnoremap <leader>t :call ToggleShowTabs()<CR>

" Clear Hightling With Space
nnoremap <leader><space> :nohlsearch<CR>

" Toggle File Expoler
nnoremap <C-n> :NERDTreeToggle<CR>
inoremap <C-n> <C-c>:NERDTreeToggle<CR>

" Undo Less
inoremap . .<C-g>u
inoremap ? ?<C-g>u
inoremap ! !<C-g>u
inoremap , ,<C-g>u

" Visual Indent
nnoremap = >>
nnoremap - <<
"inoremap <C-+> <C-d>
"inoremap <C-_> <C-t>
vnoremap = >gv
vnoremap - <gv

" Visual Dot Repeat
xnoremap . :norm.<CR>

" Toggle Between File Expoler and File
nnoremap <C-e> <C-w><C-w>

" Navigate Tabs
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Jump To Next Row Rather Than Line
nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'

" Exit With Crtl W
nnoremap <C-w> :q!<CR>
inoremap <C-w> <C-c>:q!<CR>

" Save With Crtl S
nnoremap <C-s> :w<CR>
inoremap <C-s> <C-c>:w<CR>

"Save and Quit With Crtl
nnoremap <C-x> :x<CR>
inoremap <C-x> <C-c>:x<CR>

nnoremap c* *Ncgn
nnoremap c# #NcgN
inoremap <C-l> <C-x><C-l>

noremap <silent> <C-s-up> :call <SID>swap_up()<CR>
noremap <silent> <C-s-down> :call <SID>swap_down()<CR>

" Highlight Last Inserted Text
nnoremap gV `[v`]

" Toggle Line Numbers on \F
nnoremap <leader>f :call ToggleNumber()<CR>

" Scroll Up and Down
noremap <silent> <C-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <C-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>

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

if (has("termguicolors"))
	set termguicolors
endif

" Set Theme
syntax enable
colorscheme dracula
let g:airline_theme='light'

" Allow File Specific
filetype indent on

" Better Searching
set incsearch
set hlsearch

" Ignore Non-Text File Types
set wildignore=*.swp,*.bak,*.pyc,*.class

" Change Terminal's Title
set title

" Airline Settings
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_z = airline#section#create(['windowswap', '%3p%% ', 'linenr', ':%3v'])

" Auto Open NERDTree Upon Starting VIM
" Without a File
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close VIM when only NERDTree is Open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Equalize Splits On Resize
autocmd VimResized * wincmd =

" Highlight Current Line in Current File
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

" Set up English Spellchecking
set spelllang=en

" Excuted Upon Open
augroup preread
	autocmd!
		" Enable Spellchecking for Markdown
		autocmd BufReadPre,FileReadPre *.md setlocal spell
		autocmd BufReadPre,FileReadPre *.markdown setlocal spell
		autocmd BufReadPre,FileReadPre *.txt setlocal spell
		" Enable Shell Highlighting
		autocmd BufReadPre,FileReadPre *.sh :setf sh
		autocmd BufReadPre,FileReadPre *.bash :setf sh
		autocmd BufReadPre,FileReadPre *.bashrc :setf sh
		" Remove Trailing Spaces
		autocmd BufWritePre,FileWritePre * :%s/\s\+$//e | %s/\r$//e
		" Converts Spaces to Tabs
		autocmd BufWritePre,FileWritePre * :%retab!
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

