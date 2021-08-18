" ~/.vim/vimrc/

"================================================================================ Compile, Build, Debugging
augroup java
  autocmd filetype java noremap <leader>qr :w <bar> !javac -g -J-Xms1024m -J-Xmx1920m -J-Xss512m
        \ -encoding UTF-8 %:r.java && cat %:r.in <bar> java -Xms1024m -Xmx1920m -Xss512m
        \ -Dfile.encoding=UTF-8 -XX:+UseSerialGC %:r.java<CR>

  autocmd filetype java noremap <leader>qe <ESC>:vs %:r.in<CR>:wa<CR>
augroup END

augroup cpp
  autocmd filetype cpp :set fileencoding=utf-8
  autocmd filetype cpp :set fileformat=unix

  autocmd filetype cpp noremap <leader>qr <ESC>:!clear <ESC>:w <bar> !clang++ -std=c++17 -g -O2 -Wall % -o %:r && cat %:r.in <bar> ./%:r<CR>
  autocmd filetype cpp noremap <leader>qe <ESC>:vs %:r.in<CR>:wa<CR>

  "autocmd filetype cpp let &g:makeprg="(clang++ -o %:r %:r.cc -O2 -g -Wall -std=c++17 && time ./%:r < %:r.in)"
  "autocmd filetype cpp map  <leader>qr <ESC>:wa<CR>:make!<CR>:copen<CR>
  "autocmd filetype cpp imap <leader>qr <ESC>:wa<CR>:make!<CR>:copen<CR>

  autocmd filetype cpp noremap <leader>qd :!lldb %:r<CR>
  "autocmd filetype cpp noremap <leader>qd :!(echo "run < %:r.in" && cat) <bar> lldb %:r<CR>

  "autocmd filetype cpp nnoremap <leader>qr :w <bar> !clang++ -g -std=c++17
        "\ -Wl,-stack_size -Wl,0x10000000 -O2 -Wall -Wextra -pedantic -Wshadow -Werror -Wformat=2
        "\ -Wfloat-equal -Wconversion -Wcast-qual -Wcast-align -Wno-unused-result -Wno-sign-conversion
        "\ -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -fsanitize=address -fsanitize=undefined
        "\ -fsanitize=float-divide-by-zero -fsanitize=float-cast-overflow -fno-sanitize-recover=all
        "\ -fstack-protector-all -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC % -o %:r && cat %:r.in <bar> ./
        "\ %:r<CR>

  "autocmd filetype cpp nnoremap <leader>qr :w <bar> !g++-10 -g -std=gnu++17
        "\ -Wl,-stack_size -Wl,0x10000000 -O2 -Wall -Wextra -pedantic -Wshadow -Werror -Wformat=2
        "\ -Wfloat-equal -Wconversion -Wlogical-op -Wshift-overflow=2 -Wduplicated-cond -Wcast-qual -Wcast-align
        "\ -Wno-unused-result -Wno-sign-conversion -D_FORTIFY_SOURCE=2 -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC
        "\ % -o %:r && cat %:r.in <bar> ./%:r<CR>
augroup END

"================================================================================ Indentation rules
autocmd filetype make setlocal noexpandtab

if !exists('g:html_indent_inctags')
  let g:html_indent_inctags = 'body,head,html,tbody,p,li,dt,dd'
endif
if !exists('g:html_indent_autotags')
  let g:html_indent_autotags = 'wbr'
endif
if !exists('g:html_indent_script1')
  let g:html_indent_script1 = 'inc'
endif
if !exists('g:html_indent_style1')
  let g:html_indent_style1 = 'inc'
endif

"================================================================================ END
