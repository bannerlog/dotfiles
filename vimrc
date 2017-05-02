set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'Shougo/neocomplcache.vim'
Bundle 'bling/vim-airline'
Bundle 'myusuf3/numbers.vim'
Bundle 'tpope/vim-fugitive'
"Bundle 'tpope/vim-unimpaired'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-surround'
"Bundle 'godlygeek/tabular'
Bundle 'scrooloose/syntastic'
Bundle 'arnaud-lb/vim-php-namespace'
Bundle 'shawncplus/phpcomplete.vim'
Bundle 'robmiller/vim-movar'
Bundle 'vim-scripts/BufOnly.vim'
Bundle 'vim-scripts/ZoomWin'
"Bundle 'flazz/vim-colorschemes'
if executable('ctags')
    Bundle 'majutsushi/tagbar'
endif

filetype plugin indent on

syntax on
set t_Co=256
color Tomorrow-Night
hi CursorLineNr gui=bold guifg=#444444
set cursorline
set listchars=tab:▸\ ,trail:□,eol:¬

set encoding=utf8
set backspace=2
set backspace=indent,eol,start
set fileformat=unix
set fileformats=unix
set nowrap
set hidden
set nobackup
set noswapfile
set dir=/tmp,/var/tmp
set autoread
set number
set visualbell
set ch=1
set laststatus=2
set noshowmode
set mousehide
set ttyfast
set autoindent
set copyindent
set smartindent
set smarttab
"set nolist
"set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/*cache,*/logs,*/web/bundles,.DS_Store
"set path=**

"set textwidth=80
set colorcolumn=81
hi ColorColumn guibg=#242424 ctermbg=246

let mapleader = ","

set foldmethod=syntax
set foldlevel=1

set incsearch
set hlsearch
set showmatch
set mat=3
set ignorecase
set smartcase
"nnoremap <leader>ll :set list!<CR>
nnoremap <leader><space> :noh<cr>

" tags
set tags+=~/.vimtags,vendor.tags
nnoremap <leader>. :CtrlPTag<cr>

set scrolljump=3
set scrolloff=3

set tabstop=4
set shiftwidth=4
set softtabstop=4
set showtabline=1
set expandtab

set wildcharm=<tab>
set wildmenu
set wildmode=full
"inoremap <c-l> <c-x><c-l>

"
" Airline
"
let g:airline_theme='powerlineish'
if !exists('g:airline_powerline_fonts')
    let g:airline_left_sep=''
    let g:airline_right_sep=''
endif

"
" NERDTree
"
nnoremap <C-n> :NERDTreeToggle<CR>
map <leader>r :NERDTreeFind<cr>

"
" syntastic
"
let g:syntastic_always_populate_loc_list=1
let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd']

"
" neocompcache-complete
"
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_enable_camel_case_completion = 1

" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

"
"  fugitive
"
nnoremap <leader>gs  :Gstatus<cr>
nnoremap <leader>ga  :Gwrite<cr>
nnoremap <leader>gc  :Gcommit --verbose<cr>
nnoremap <leader>gmv :Gmove<cr>
nnoremap <leader>gb  :Gblame<CR>

"
" php
"
nnoremap <leader>u :call PhpInsertUse()<cr>
nnoremap <leader>e :call PhpExpandClass()<cr>


"
" tagbar
"
nmap <leader>t :TagbarToggle<CR>
let g:tagbar_type_php  = {
    \ 'ctagstype' : 'php',
    \ 'kinds'     : [
        \ 'i:interfaces',
        \ 'c:classes',
        \ 'd:constant definitions',
        \ 'f:functions',
        \ 'j:javascript functions:1'
    \ ]
  \ }

nnoremap <silent> <leader>c :call <sid>StripTrailingWhitespaces()<cr>
function! <sid>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

au BufWrite *.php,*.js,*.feature,*.json,*.rb :call <sid>StripTrailingWhitespaces()
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2

nnoremap <Leader>l :ls<CR>
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>
nnoremap <Leader>g :e#<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>
