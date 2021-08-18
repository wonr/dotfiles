set nu ci si si sw=2 ts=2 bs=2
set ru ic scs so=5 is hls lbr nocp
set bg=dark cb^=unnamed,unnamedplus
set mouse=a noswapfile
syn on

let mapleader = '\'

noremap <leader>qr <ESC>:!clear <ESC>:w <bar> !clang++ -std=c++17 -g -O2 -Wall % -o %:r && cat %:r.in <bar> ./%:r<CR>
noremap <leader>qe <ESC>:vs %:r.in<CR>:wa<CR>

inoremap jk <ESC>
nnoremap , :
nnoremap <S-u> <C-r>
nnoremap <leader>y ggVG"+y''

inoremap {<CR> {<CR>}<ESC>O
