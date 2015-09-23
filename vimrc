" use pathogen - see https://github.com/tpope/vim-pathogen for installation
execute pathogen#infect()

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

"no sounds on error
set noerrorbells
set novisualbell
set t_vb=
set tm=500

set noswapfile
set nowb

if has("gui_running")
  set autochdir

  set cursorline
  "the color of the highlighted line
  "highlight CursorLine guibg=#383838
  "colorscheme torte
else
  syntax on
endif

" the color of the line numbers
highlight LineNr guifg=#569EC0

"don't show toolbar
set guioptions-=T

"highlighted text copied into windows buffer
set guioptions+=a

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