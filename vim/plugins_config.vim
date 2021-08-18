" ~/.vim/vimrc/

"vim-plug automatic installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
"Plug 'tpope/vim-fugitive'
"Plug 'tpope/vim-surround'
"Plug 'preservim/nerdtree'
"Plug 'preservim/nerdcommenter'
"Plug 'airblade/vim-gitgutter'
"Plug 'prabirshrestha/asyncomplete.vim'
"Plug 'prabirshrestha/asyncomplete-emmet.vim'
"Plug 'prabirshrestha/asyncomplete-lsp.vim'
"Plug 'prabirshrestha/vim-lsp'
"Plug 'mattn/vim-lsp-settings'
"Plug 'sheerun/vim-polyglot'
"Plug 'Yggdroot/indentLine'
"Plug 'majutsushi/tagbar'
"Plug 'dense-analysis/ale'
"Plug 'mattn/emmet-vim'
"Plug 'andrewradev/tagalong.vim'
call plug#end()

"================================================================================
" Plugin setting start
"================================================================================

"================================================================================ nerdtree
if !empty(glob("~/.vim/plugged/nerdtree")) && &rtp =~ 'nerdtree'
  " Start NERDTree and leave the cursor in it.
  "autocmd VimEnter * NERDTree

  " Exit Vim if NERDTree is the only window left.
  autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
        \ quit | endif

  " If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
  autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
        \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

  nnoremap <leader>t :NERDTreeFocus<CR>
  nnoremap <C-n> :NERDTree<CR>
  nnoremap <C-t> :NERDTreeToggle<CR>
  nnoremap <C-f> :NERDTreeFind<CR>
endif

"================================================================================ nerdcommenter
if !empty(glob("~/.vim/plugged/nerdcommenter")) && &rtp =~ 'nerdcommenter'
  " Create default mappings
  let g:NERDCreateDefaultMappings = 1
endif

"================================================================================ tagbar
if !empty(glob("~/.vim/plugged/tagbar")) && &rtp =~ 'tagbar'
  nmap <leader>r :TagbarToggle<CR>
endif

"================================================================================ emmet-vim
if !empty(glob("~/.vim/plugged/emmet-vim")) && &rtp =~ 'emmet-vim'
  let g:user_emmet_leader_key='<leader>,'
  let g:user_emmet_mode='inv'
endif

"================================================================================ asyncomplete-emmet
if !empty(glob("~/.vim/plugged/asyncomplete-emmet")) && &rtp =~ 'asyncomplete-emmet'
  au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#emmet#get_source_options({
        \ 'name': 'emmet',
        \ 'whitelist': ['html'],
        \ 'completor': function('asyncomplete#sources#emmet#completor'),
        \ }))
endif

"================================================================================ ale
if !empty(glob("~/.vim/plugged/ale")) && &rtp =~ 'ale'
  "let g:ale_completion_enabled = 1

  "ale linters
  let b:ale_linters = {
        \ 'javascript': ['eslint'],
        \ 'typescript': ['eslint']
        \}

  let g:ale_javascript_eslint_use_global = 1
  let g:ale_javascript_eslint_executable = 'eslint_d'

  "ale fixers
  let b:ale_fixers = {
        \ '*': ['remove_trailing_lines', 'trim_whitespace'],
        \ 'javascript': ['eslint'],
        \ 'tsx': ['eslint'],
        \ 'typescript': ['eslint']
        \}

  let g:ale_fix_on_save = 1

  " Only run linters named in ale_linters settings.
  "let g:ale_linters_explicit = 1

  let g:ale_c_cc_executable = 'gcc' " Or use 'clang'
  let g:ale_cpp_cc_executable = 'gcc' " Or use 'clang++'
  let g:ale_c_cc_options = '-std=c11 -Wall'
  let g:ale_cpp_cc_options = '-std=c++17 -Wall'

  autocmd BufWritePost *.ts,*.tsx,*.js,*.jsx,*.scss ALEFix eslint
endif

"================================================================================ asyncomplete.vim
if !empty(glob("~/.vim/plugged/asyncomplete.vim")) && &rtp =~ 'asyncomplete.vim'
  "Tab completion
  inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
  inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
  "If you prefer the enter key to always insert a new line (even if the popup menu is visible) then you can amend the above mapping as follows
  "inoremap <expr> <cr> pumvisible() ? asyncomplete#close_popup() . "\<cr>" : "\<cr>"

  "Force refresh completion
  imap <c-space> <Plug>(asyncomplete_force_refresh)

  "allow modifying the completeopt variable, or it will be overridden all the time
  let g:asyncomplete_auto_completeopt = 0
  set completeopt=menuone,noinsert,noselect,preview

  "To auto close preview window when completion is done.
  autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

  let g:lsp_diagnostics_enabled = 0 " disable diagnostics(e.g. warnings, errors) support
endif

"================================================================================
" Plugin setting end
"================================================================================
