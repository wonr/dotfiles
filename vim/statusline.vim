" ~/.vim/vimrc/

"================================================================================
" Status Line
"================================================================================
if 0
  set laststatus=2 " Show statusline always
  set statusline=%1*%f\ %h%m%r%=%<%-14.(%l,%c%V%)\ %P " Emulate standard status line with 'ruler' set
elseif 0
  set laststatus=2 " Show statusline always
  set statusline=
  set statusline+=%1*%.99f\ " " File path
  set statusline+=%h%m%r%w " Helpfile, Modified, Readonly, Preview"
  set statusline+=%= " Right Side
  if !empty(glob("~/.vim/plugged/vim-gitgutter")) && &rtp =~ 'vim-gitgutter'
    set statusline+=\ \|\ " " Separator
    set statusline+=%{GitStatus()}\ " " Git status
  endif
  if !empty(glob("~/.vim/plugged/vim-fugitive")) && &rtp =~ 'vim-fugitive'
    set statusline+=\(%{GitBranch()}\) " "Git branch
  endif
  "set statusline+=\ \|\ " " Separator
  "set statusline+=%< " Where to truncate line if too long
  "set statusline+=b%n:w%{winnr()} " Buffer number: Window number
  "set statusline+=\ \|\ " " Separator
  "set statusline+=%Y " FileType
  "set statusline+=\ \|\ " " Separator
  "set statusline+=%{strlen(&fenc)?&fenc:'none'} " Encoding
  "set statusline+=\ " " Separator
  "set statusline+=\[%{&ff}\] " " File format
  set statusline+=\ \|\ " " Separator
  set statusline+=%2c:%3l/%L " Colomn number: Line number / Total lines
  set statusline+=\ \|\ " " Separator
  set statusline+=%2P " Percentage of document
  "set statusline+=\ \|\ " " Separator
  "set statusline+=[%b][0x%B] " ASCII and byte code under cursor
  "set statusline+=\ \|\ " " Separator
  "set statusline+=%{strftime(\"%y/%m/%d\ -\ %H:%M:%S\")} " Time
else
endif

if !empty(glob("~/.vim/plugged/vim-gitgutter")) && &rtp =~ 'vim-gitgutter'
  function! GitStatus()
    let [a,m,r] = GitGutterGetHunkSummary()
    return printf('+%d ~%d -%d', a, m, r)
  endfunction
endif

if !empty(glob("~/.vim/plugged/vim-fugitive")) && &rtp =~ 'vim-fugitive'
  function! GitBranch()
    if fugitive#head() != ""
      return fugitive#head()
    else
      return printf('----')
    endif
  endfunction
endif

"hi User1 ctermfg=249 ctermbg=NONE

"================================================================================
" Status Line end
"================================================================================
