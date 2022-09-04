" VIMSCRIPT -------------------------------------------------------------- {{{
set number
set tabstop=4
set autoindent
set visualbell
set mouse=a
set expandtab
set softtabstop=4
"color github
color goldenrod
"color space-vim-dark 
"color vividchalk
"color busybee
"color cobalt2 
"color sierra 
"color skittles_autumn
"color moss
set shiftwidth=4
set nu
set nowrap
set smartcase
set noswapfile
set incsearch
set noerrorbells
set syntax
set incsearch
set hlsearch
set cindent
set foldmethod=syntax
"Enable matchit
runtime macros/matchit.vim
if v:version < 800
    "Start pathogen
    execute pathogen#infect()
endif
"Turn on syntax highlighting
syntax on
"Enable filetype detection
filetype plugin indent on
"Enable folding based on indent (on 8.0 and greater versions)
if v:version >= 800
    set foldmethod=indent
    set foldnestmax=10
    set nofoldenable
    set foldlevelstart=10
endif
execute pathogen#infect()
" transparent bg
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
" For Vim<8, replace EndOfBuffer by NonText
autocmd vimenter * hi EndOfBuffer guibg=NONE ctermbg=NONE
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" MAPPINGS --------------------------------------------------------------- {{{

"Set <leader> key to spacebar for personalized shortcuts
let mapleader=" "

"Vim by default leaves all search terms found highlighted til your next
"search, this will turn it off with leader
map <leader>h :noh<CR>

"Map custom function using leader

"This function toggles line number to either be relative or normal
function! ToggleLineNumber()
    if v:version > 703
        set norelativenumber!
    endif
    set nonumber!
endfunction

"Call function by :ToggleLineNumber() or <ldr>r
map <leader>r :call ToggleLineNumber()<CR>

"Press spacebar twice to jump back to last cursor position
nnoremap <leader>\ ``

" Press \p to print the current file to the default printer from a Linux operating system.
" View available printers:   lpstat -v
" Set default printer:       lpoptions -d <printer_name>
" <silent> means do not display output.
nnoremap <silent> <leader>p :%w !lp<CR>

" Type jj to exit insert mode quickly.
inoremap jj <Esc>
" Map the F5 key to run a Python script inside Vim.
" I map F5 to a chain of commands here.
" :w saves the file.
" <CR> (carriage return) is like pressing the enter key.
" !clear runs the external clear screen command.
" !python3 % executes the current file with Python.
nnoremap <f5> :w <CR>:!clear <CR>:!python3 % <CR>

" You can split the window in Vim by typing :split or :vsplit.
" Navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h, or CTRL+l.
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Resize split windows using arrow keys by pressing:
" CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><

" }}}
