set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'jpalardy/vim-slime'
Bundle 'scrooloose/nerdcommenter'
Bundle 'vim-scripts/a.vim'
Bundle 'bling/vim-airline'


call vundle#end()  
filetype plugin indent on


let mapleader = ','

nnoremap ; :
nnoremap <leader>w <C-W>v
nnoremap <leader><space> :noh<cr>
"color ir_black
"color molokai
"color peaksea
"solarized_termcolors=16
"color solarized

"nnoremap <C-j> TmuxNavigateDown

"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'


" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'


let g:slime_target = "tmux"
let g:slime_python_ipython = 1

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

nnoremap <leader>jd :YcmCompleter GoTo<CR>

"YCM STUFF
let g:ycm_autoclose_preview_window_after_insertion = 1
"let g:ycm_server_log_level = 'debug'
"let g:ycm_server_keep_logfiles = 1

syntax on
set rnu
set mouse=a
set incsearch
set hlsearch
hi Search cterm=NONE ctermfg=black ctermbg=yellow

set expandtab
set shiftwidth=4
set softtabstop=4
set cindent
set autoindent

