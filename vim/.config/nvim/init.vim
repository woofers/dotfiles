
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

call plug#end()

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

" Set to Tabs With 4 Spaces
set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4

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
inoremap . .<c-g>u
inoremap ? ?<c-g>u
inoremap ! !<c-g>u
inoremap , ,<c-g>u

" Visual Indent
vnoremap > >gv
vnoremap < <gv

" Navigate Tabs
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Jump To Next Row Rather Than Line
nnoremap j gj
nnoremap k gk

" Exit With Crtl W
"nnoremap <c-w> :q!<cr>
"inoremap <c-w> <C-c>:q!<cr>

" Save With Crtl S
nnoremap <c-s> :w<cr>
inoremap <c-s> <C-c>:w<cr>

nnoremap <c-x> :x<cr>
inoremap <c-x> <C-c>:x<cr>

" Highlight Last Inserted Text
nnoremap gV `[v`]

" Toggle Line Numbers on \F
nnoremap <leader>f :call ToggleNumber()<cr>

" Scroll Up and Down
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>

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
autocmd vimenter * NERDTree

" Close VIM when only NERDTree is Open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

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

