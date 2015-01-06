syntax enable
set background=dark


set tabstop=4
set shiftwidth=4
set colorcolumn=80

filetype indent on

set wildmode=longest,list,full
set wildmenu

set expandtab

let g:solarized_termtrans =  1 
colorscheme solarized

set number
set tw=79
set nowrap
set fo-=t
set colorcolumn=80

vmap Q gq
nmap Q gqap

map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

filetype on

autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0
