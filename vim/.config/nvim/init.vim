
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

" Trims Trailing Whitespace
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction

function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
	if has('nvim')
	  !cargo build --release
	else
	  !cargo build --release --no-default-features --features json-rpc
	endif
  endif
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
Plug 'sjl/gundo.vim'
Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }

call plug#end()

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

" Set to Tabs With 4 Spaces
set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4

" Disable Auto-Indent
set ai

" Display Line Numbers
set relativenumber

" Enable Mouse
set mouse=a

" Scrolling
set so=7

" Remap Colon
nnoremap ; :
nnoremap : ;

" Map F2 Key to Show Tabs
nnoremap <F2> :<C-U>setlocal lcs=tab:/·,trail:· list! list? <CR>

" Clear Hightling With Space
nnoremap <leader><space> :nohlsearch<CR>

" Map Super Undo on \U
nnoremap <leader>u :GundoToggle<CR>

" Undo Less
inoremap . .<c-g>u
inoremap ? ?<c-g>u
inoremap ! !<c-g>u
inoremap , ,<c-g>u

" Highlight Last Inserted Text
nnoremap gV `[v`]

" Toggle Line Numbers on \F
nnoremap <leader>f :call ToggleNumber()<cr>

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

" Minimize Redraw
set lazyredraw

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
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.markdown setlocal spell
autocmd BufRead,BufNewFile *.sh setf sh
autocmd BufRead,BufNewFile *.bash setf sh

" Not Working
autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md,*.vim \:call <SID>StripTrailingWhitespaces()

" Enable Deoplete
call deoplete#enable()

