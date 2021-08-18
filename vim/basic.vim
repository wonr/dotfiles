" ~/.vim/vimrc/

let $LANG = 'en_US.UTF-8'
language messages en_US.UTF-8

"Initializations from files and environment variables is skipped
"[vim --clean] or [vim -u DEFAULTS -U NONE -i NONE]

syntax enable
syntax on
filetype plugin indent on

set number
"set relativenumber

set cindent
set smartindent
set autoindent

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab
set shiftround

set hlsearch "Type ':noh' everytime to turn off highlighted match result
set incsearch "Search when you type every single character
set wrapscan
set ignorecase
set smartcase

set ruler
set showmatch
set matchpairs=(:),{:},[:],<:> "Jump using '%'
set showmode
"set showcmd
"set cursorline
"set cursorcolumn

set background=dark
set t_Co=256
"set termguicolors
colorscheme hybrid

"set paste "If enabled, you can't use key mappings in Insert mode and Command-line mode
set backspace=indent,eol,start

set list
set listchars=tab:»\ ,trail:· "Tab:\|\ for indent line
set mouse=a
set wildmenu
set wildmode=list:longest,full
set nostartofline
set scrolloff=5

"set linebreak
"set showbreak=+++\
"set wrap
"set whichwrap+=h,l
set nowrap
set sidescroll=1 "Needs to be set 'nowrap'
set sidescrolloff=5 "Needs to be set 'nowrap'

set textwidth=72
set nojoinspaces "No double space when join two sentences using 'J'
set completeopt=menuone,menu,longest,preview "Keyword completion option when use ^N^P
set conceallevel=0 "When text is marked as “hidden characters”, Determines how this text is displayed

if !isdirectory($HOME."/.vim/save")
  call mkdir($HOME."/.vim/save", "p", 0770)
endif

if !isdirectory($HOME."/.vim/save/backup-dir")
  call mkdir($HOME."/.vim/save/backup-dir", "p", 0700)
endif
"set backupdir=~/.vim/save/backup-dir
"set backup
set nobackup
set nowritebackup

if !isdirectory($HOME."/.vim/save/swap-dir")
  call mkdir($HOME."/.vim/save/swap-dir", "p", 0700)
endif
"set directory=~/.vim/save/swap-dir
"set swapfile
set noswapfile

if !isdirectory($HOME."/.vim/save/undo-dir")
  call mkdir($HOME."/.vim/save/undo-dir", "p", 0700)
endif
"set undodir=~/.vim/save/undo-dir
"set undofile
"set undolevels=100
"set undoreload=100

set autoread
"set autowrite "Auto saves changes when quitting and swiching buffer
set history=100 "~/.viminfo
set report=0 "Show all changes

set title
set encoding=utf-8
set fileencoding=utf-8
set fileformat=unix
set nrformats=alpha,octal,hex,bin "C-a, C-x
set clipboard^=unnamed,unnamedplus "Use OS clipboard
"set foldmethod=indent "indent or syntax. open 'zo', fold 'zc'
"set foldnestmax=1
"set nofoldenable
set lazyredraw "Don’t update screen during macro and script execution
set updatetime=100

set nocompatible
set belloff=all
set hidden "Hide buffers instead of closing them like other editors
set splitbelow
set splitright

" Mark trailing spaces as errors
"match ErrorMsg '\s\+$'

"================================================================================ Key Mapping
inoremap jk <ESC>
noremap , :
nnoremap <leader>1 :noh<CR>
nnoremap <S-u> <C-r>
nnoremap <leader>q <nop>
nnoremap <leader>qr <nop>
noremap j gj
noremap k gk

"Re-map leader key
let mapleader = '\'

nmap <leader>y ggVG"+y''
nmap <leader>= gg=G''

"Disable del and backspace
nnoremap <Del> <nop>
vnoremap <Del> <nop>
nnoremap <BS> <nop>
vnoremap <BS> <nop>

"Don't use arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

"Easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

"Go to the previous/next buffer
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>

"Vimdiff
augroup Vimdiff
  autocmd BufEnter,BufNew * if &diff | syntax off | endif

  if &diff
    map ] ]c
    map [ [c
  endif
augroup END

"================================================================================ END
