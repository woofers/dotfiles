if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
	\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
	if has('nvim')
	  !cargo build --release
	else
	  !cargo build --release --no-default-features --features json-rpc
	endif
  endif
endfunction

call remote#host#RegisterPlugin('python3', '/$HOME/.config/nvim/plugins/deoplete.nvim/rplugin/python3/deoplete.py', [
	  \ {'sync': 1, 'name': 'DeopleteInitializePython', 'type': 'command', 'opts': {}},
	 \ ])

call plug#begin('~/.config/nvim/plugins')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'}
Plug 'dracula/vim'
Plug 'mhartington/oceanic-next'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }

call plug#end()

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4
set ai
set number
set mouse=a
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*/platforms/*,*/plugins/*,*/coverage/*,*/.nyc_output/*
nnoremap ; :
nnoremap : ;
nnoremap	<F2> :<C-U>setlocal lcs=tab:>-,trail:-,eol:$ list! list? <CR>


if (has("termguicolors"))
	set termguicolors
endif

syntax enable
colorscheme dracula
let g:airline_theme='light'

let g:airline_powerline_fonts = 1
let g:deoplete#enable_at_startup = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_z = airline#section#create(['windowswap', '%3p%% ', 'linenr', ':%3v'])

autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
set spelllang=en
au BufRead *.md setlocal spell
au BufRead *.markdown setlocal spell

