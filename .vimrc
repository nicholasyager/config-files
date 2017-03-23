syntax enable

" Spaces and Tabs
set tabstop=4
set softtabstop=4
set expandtab

" UI Config
set colorcolumn=80
set showcmd
set number
set cursorline

set shiftwidth=4

filetype indent on
set wildmode=longest,list,full
set wildmenu
set lazyredraw
set showmatch
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
" space open/closes folds
nnoremap <space> za
set foldmethod=indent   " fold based on indent level

set tw=79
set nowrap
set fo-=t

vmap Q gq
nmap Q gqap


" Shortcuts
let mapleader=","       " leader is comma

" jk is escape
inoremap jk <esc>
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" save session
noremap <leader>s :mksession<CR>

" open ag.vim
nnoremap <leader>a :Ag

" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

call plug#begin('~/.vim/plugged')
    Plug 'flazz/vim-colorschemes'
    Plug 'sjl/gundo.vim'
    Plug 'rking/ag.vim'
    Plug 'skammer/vim-css-color'
    Plug 'rust-lang/rust.vim'
call plug#end()

colorscheme badwolf
filetype on

autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0
