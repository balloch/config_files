filetype plugin on

filetype plugin indent on

" Syntax highlighting on
syntax on

" Dont wrap text
set nowrap

" Setting the tabstop
set tabstop=4 shiftwidth=4

" Tabs as spaces
set expandtab

" Search highlighting
set hlsearch

" Incremental searching
set incsearch

" Ignore case in searching
set ignorecase

" Use any case if caps are used
set smartcase

" Line numbers
set number

" Make buffers not hidden
set hidden

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" Additional PEP8 stuff
au BufNewFile,BufRead *.py
    \ set fileformat=unix
"    \ set autoindent

" Webfile formatting
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

" Check for whitespace
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" UTF-8 Encoding
set encoding=utf-8


" ***Plugins***
"

" Make autocomplete window close after completed
let g:ycm_autoclose_preview_window_after_completion=1

" 'g' as a shortcut for `goto`
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" use ag with ack.vim
let g:ackprg = 'ag --nogroup --nocolor --column'

" Syntastic recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" open NERDTree with C-n
map <C-n> :NERDTreeToggle<CR>


