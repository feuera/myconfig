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
Bundle 'bling/vim-bufferline'
Bundle 'bling/vim-airline'
"Bundle 'kien/ctrlp.vim'
"Bundle 'SirVer/ultisnips'
"Bundle 'honza/vim-snippets'
Bundle 'ervandew/supertab'
Bundle 'tpope/vim-fugitive'
"vim mercurial wrapper
Bundle 'ludovicchabant/vim-lawrencium'
Bundle 'tpope/vim-surround'
Bundle 'klen/python-mode'
Bundle 'digitaltoad/vim-pug'
Bundle 'sirtaj/vim-openscad'
Bundle 'ivanov/vim-ipython'
Bundle 'severin-lemaignan/vim-minimap'
Bundle 'shemerey/vim-peepopen'
Bundle 'kana/vim-textobj-user'
Bundle 'bps/vim-textobj-python'


"Bundle ''
"Bundle 'mihaifm/bufstop'


call vundle#end()
filetype plugin indent on

let mapleader = ','

nnoremap ; :
nnoremap <leader>w <C-W>v
nnoremap <leader><space> :noh<cr>

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
"let g:airline_powerline_fonts=1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'


let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#virtualenv#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9


let g:slime_target = "tmux"
"let g:slime_python_ipython = 1
let g:slime_python_ipython = 1
let g:slime_paste_file = "$HOME/.slime_paste"

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

"nnoremap <leader>jd :YcmCompleter GoTo<CR>
"nnoremap <leader>jk :YcmCompleter GoToDeclaration<CR>
"nnoremap <leader>jf :YcmCompleter GoToDefinition<CR>

"YCM STUFF
"let g:ycm_autoclose_preview_window_after_insertion = 1
"let g:ycm_server_log_level = 'debug'
"let g:ycm_server_keep_logfiles = 1

" use supertab to resolve conflicting ultisnip/youcompleteme
" http://0x3f.org/blog/make-youcompleteme-ultisnips-compatible/
"let g:ycm_key_list_select_completion = ['<C-TAB>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-S-TAB>', '<Up>']
"let g:SuperTabDefaultCompletionType = '<C-Tab>'


let g:pymode_folding = 0
"let g:pymode_rope = 0
let g:pymode_python = 'python3'
let ropevim_vim_completion=1
let ropevim_extended_complete=1



syntax on
set rnu
set number
set mouse=a
set incsearch
set showmatch
set hlsearch
set ignorecase
hi Search cterm=NONE ctermfg=black ctermbg=yellow

set expandtab
set shiftwidth=4
set softtabstop=4
set cindent
set autoindent

:map <leader>b :ls<CR>:b

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
" Use the same symbols as TextMate for tabstops and EOLs
"set listchars=tab:?\ ,eol:?
set listchars=tab:▸\ ,eol:¬
"Invisible character colors
"highlight NonText guifg=#4a4a59
"highlight SpecialKey guifg=#4a4a59

nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
inoremap jj <ESC>

"set tm=500
set t_Co=256
set laststatus=2
"set autochdir
set clipboard=unnamedplus
set undofile


" real line movement when wrap is on
function! ScreenMovement(movement)
    if &wrap
        return "g" . a:movement
    else
        return a:movement
    endif
endfunction
onoremap <silent> <expr> j ScreenMovement("j")
onoremap <silent> <expr> k ScreenMovement("k")
onoremap <silent> <expr> 0 ScreenMovement("0")
onoremap <silent> <expr> ^ ScreenMovement("^")
onoremap <silent> <expr> $ ScreenMovement("$")
nnoremap <silent> <expr> j ScreenMovement("j")
nnoremap <silent> <expr> k ScreenMovement("k")
nnoremap <silent> <expr> 0 ScreenMovement("0")
nnoremap <silent> <expr> ^ ScreenMovement("^")
nnoremap <silent> <expr> $ ScreenMovement("$")


command! -bar -nargs=0 W :silent exe "write !sudo tee % >/dev/null" | silent edit!

"-------------------------------------------------------------------------------
" OmniCppCompletion plugin
"-------------------------------------------------------------------------------

" Enable OmniCompletion
" http://vim.wikia.com/wiki/Omni_completion
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" Configure menu behavior
" http://vim.wikia.com/wiki/VimTip1386
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Use Ctrl+Space for omni-completion
" http://stackoverflow.com/questions/510503/ctrlspace-for-omni-and-keyword-completion-in-vim
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
  \ "\<lt>C-n>" :
  \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
  \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
  \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

" Popup menu hightLight Group
highlight Pmenu ctermbg=13 guibg=LightGray
highlight PmenuSel ctermbg=7 guibg=DarkBlue guifg=White
highlight PmenuSbar ctermbg=7 guibg=DarkGray
highlight PmenuThumb guibg=Black

" enable global scope search
let OmniCpp_GlobalScopeSearch = 1
" show function parameters
let OmniCpp_ShowPrototypeInAbbr = 1
" show access information in pop-up menu
let OmniCpp_ShowAccess = 1
" auto complete after '.'
let OmniCpp_MayCompleteDot = 1
" auto complete after '->'
let OmniCpp_MayCompleteArrow = 1
" auto complete after '::'
let OmniCpp_MayCompleteScope = 0
" don't select first item in pop-up menu
let OmniCpp_SelectFirstItem = 0


" disable macro, since not used in 90+% use cases
"map q <Nop>
"nnoremap q :if winnr('$') > 1 \|hide\|else\|silent! exec 'q'\|endif<CR>
" qo, close all other window    -- 'o' stands for 'only'
"nnoremap qo :only<CR>
" qu close upper window
"nnoremap qu :-q<CR>

" vim ipython mode: send whole paragraph to ipyton console
nmap <leader>s vap<C-s>
nmap <leader>f vaf<C-s>

