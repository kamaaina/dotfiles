call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'rust-lang/rust.vim'
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'fannheyward/coc-rust-analyzer'
Plug 'unblevable/quick-scope'
Plug 'cocopon/iceberg.vim'
call plug#end()

filetype plugin indent on

let g:rustfmt_autosave = 1  " format rust code on save

set background=dark
colorscheme iceberg

set nocompatible
set autoindent
set smartindent
set shiftwidth=3
"set guifont=Lucida_Sans_Typewriter:h12
set nobackup  "no ~ file
set number    "line numbers
set expandtab "no tabs, use spaces
set tabstop=3
set ignorecase "case insensitive search
set smartcase
set hlsearch   "highlight search
set incsearch
set showmatch  "matching brackets
set mat=2      " tenth of second to blink cursor
set showtabline=2 " always show tabs
set formatoptions-=cro   "Stop newline continution of comments
set autochdir

"no sounds on error
set noerrorbells
set novisualbell
set t_vb=
set tm=500

set noswapfile
set nowb
set cursorline
syntax on
hi CursorLine guibg=Grey40

if has("gui_running")
  set autochdir
  " the color of the line numbers
  "highlight LineNr guifg=#569EC0
  "don't show toolbar
  set guioptions-=T

  "highlighted text copied into windows buffer
  set guioptions+=a

  "the color of the highlighted line
  "highlight CursorLine guibg=#383838
  "colorscheme torte
endif


"NERDTree stuff
"Ctrl-n to toggle NERDTree
map <C-n> :NERDTreeToggle<CR>
"Where's File (wf) shows the file in NERDTree
nnoremap <F9> :NERDTreeFind<CR>

"tab stuff
nnoremap <S-Left> :tabprevious<CR>
nnoremap <S-Right> :tabnext<CR>
nnoremap tc :tabclose<CR>
nnoremap tn :tabnew<Space>
nnoremap to :tabonl<Space>

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
