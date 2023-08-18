"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""               
"               
"               ???   ??? ??? ????   ???? ???????   ???????
"               ???   ??? ??? ????? ????? ??? ???? ?????????
"               ???   ??? ??? ??????????? ??? ???? ????     
"               ???? ???? ??? ??????????? ???????  ????     
"                ???????  ??? ??? ??? ??? ???  ??? ????????
"                 ?????   ??? ???     ??? ???  ???  ???????
"               
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""               
" Author:   Tommy Bui
" Date:     08/30/2022
" Revision: 1.0

" VIMRC ----------------------------------------------------------------- {{{

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Add numbers to each line on te left-hand side.
set number

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Highlight cursor line underneath the cursor vertically.
set cursorcolumn

" While searching through a file incrementally highlight matching characters
" as you type
set incsearch

" Ignore capital letters during search.
set ignorecase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to history default number is 20.
set history=1000

" Enable auto completion menu after pressing TAB.
set wildmode=list:longest

" Set time out on mapping after ten seconds, time out on keycodes after 3
" seconds
set timeout timeoutlen=10000 ttimeoutlen=3000

" Wildmenu will ignore files with these extensions
set wildignore=*.docx,*.jpg,*.png,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
set tabstop=4
set autoindent
set visualbell
set number
set shiftwidth=4
set nu
set nowrap
set smartcase
set noswapfile
set incsearch
set noerrorbells
set cindent
set foldmethod=syntax
set mouse=a

"color space-vim-dark
color lucario
"hi Normal guibg=NONE ctermbg=NONE
"echo s:colors_d

"this will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
     autocmd!
     autocmd FileType vim setlocal foldmethod=marker
augroup END

" }}}

"MAPPINGS --------------------------------------------------------------- {{{
"
" Vim is a modal editor and supports multiple modes such as normal, visual,
" insert, etc.
"
" To create a mapping that works in normal, visual, select, & operator modes,
" use: <:map> & <:noremap> for recursive & non-recursive key mappings
" respectively
"
" For normal mode only:
" :nmap & :nnoremap
"
" For visual mode only:
" :vmap & :vnoremap

" Set the backslash as the leader key.
let mapleader = " "

" Press \\ to jump back to the last cursor position.
nnoremap <leader><leader> ``

" Edit vimrc configuration file in normal mode: <ldr>ve
nnoremap <leader>confe :e ~/.vimrc<CR>

" Edit vimrc configuration file in normal mode: <ldr>ve
nnoremap <leader>r :source ~/.vimrc<CR>

" Press \p to print the current file to the default printer from a Linuxoperating system.
" View available printers:   lpstat -v
" Set default printer:       lpoptions -d <printer_name>
" <silent> means do not display output.
nnoremap <silent> <leader>p :%w !lp<CR>

" Turn off highlighting from search
map <leader>h :noh<CR>

function! ToggleLineNumber()
  if v:version > 703
  set norelativenumber!
	endif
  set nonumber!
endfunction

" toggle the line numbers: <ldr>r
map <leader>3 :call ToggleLineNumber()<CR>

" Print features & hints of this vimrc
map <leader>usage :call Usage()<CR>

" Change colorscheme to one of the schemes in colors_d
map <leader>nc :call NextColor()<CR>

" Change colorscheme to one of the schemes in colors_d
map <leader>pc :call PrevColor()<CR>

" Type jj to exit insert mode quickly.
inoremap jj <Esc>

"enter the cursor vertically when moving to the next word during a search.
nnoremap n nzz
nnoremap N Nzz

" Mappings for opening tabs, splitscreen, etc
nnoremap <leader>ex :Explore<Enter>
nnoremap <leader>vx :Vex<Return> 
nnoremap <leader>tb :tabnew<CR>
nnoremap <leader>vs :vsplit<Enter>

"you can split the window in Vim by typing :split or :vsplit.
"Navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h, or
"CTRL+l.
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

"https://unix.stackexchange.com/questions/12535/how-to-copy-text-from-vim-to-an-external-program
nnoremap <c-y> "+y
vnoremap <c-y> "+y
nnoremap <c-p> "+p
vnoremap <c-p> "+p

"https://vim.fandom.com/wiki/Smart_mapping_for_tab_completion 
"inoremap <tab> <c-r>=Smart_TabComplete()<CR>

" }}}

"STATUS LINE ------------------------------------------------------------ {{{

" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

" Show the status on the second to last line.
set laststatus=2

" }}}

" Functions & variables----------------------------------------------------------------- {{{
if !exists ("s:color_cnt")
	let s:color_cnt = 1
endif


" dictionaries can't have new liens
let s:colors_d = { 
				  \'1':'space-vim-dark',  
				  \'2':'lucario', 
				  \'3':'nord', 
			      \'4':'anderson',
				  \'5':'challenger_deep',
				  \'6':'PaperColor',
				  \'7':'spacecamp',
				  \'8':'OceanicNext',
			      \}

" Variables
let s:ldr_btn = "spacebar"

func! Usage()
	let l:msg = ""
	echo "==================== VIMRC Usage ========================"
	echo "To call for this message again: " s:ldr_btn "+ {usage}"
	echo "To toggle line number: " s:ldr_btn "+ 3"
	echo "To reload vimrc: " s:ldr_btn "+ r"
	echo "To change colorscheme: " s:ldr_btn "+ nc OR " s:ldr_btn "+ pc"
	echo "To jump to last cursor position: " s:ldr_btn s:ldr_btn  
	echo "To edit vimrc: " s:ldr_btn "+ {confe}"  
	echo "To turn off highlighting from search: " s:ldr_btn "+ {h}"  
	echo "To exit insert mode quickly: jj"
	echo "To switch windows while in split view: CTRL+{j, k, h, or l}"
	echo "To use Explore cmd: " s:ldr_btn "ex"
	echo "To use Vertical Explore cmd: " s:ldr_btn "vx"
	echo "To open a new tab: " s:ldr_btn "tb"
	echo "To use Veritcal Split: " s:ldr_btn "vs"
	echo "In insert mode, press tab for a scuffed auto-complete"
	echo "========================================================="
endfun

func! NextColor()
	let s:cur_color = ""
	"echo "color b4: " s:color_cnt
	let s:color_cnt = s:color_cnt + 1
	if s:color_cnt > len(s:colors_d)
		let s:color_cnt = 1
	endif
	"echo "color now: " s:color_cnt
	"echo s:colors_d[s:color_cnt]
	"echo len(s:colors_d)
	"echo s:color_cnt > len(s:colors_d)
	let s:cur_color = s:colors_d[s:color_cnt]
	"echo s:
	"colorscheme s:cur_color
	exe "colorscheme " s:colors_d[s:color_cnt]
endfun

func! PrevColor()
	let l:cur_color = ""
	let s:color_cnt = s:color_cnt - 1
	if s:color_cnt < 1
		let s:color_cnt = len(s:colors_d)
	endif
	let l:cur_color = s:colors_d[s:color_cnt] 
	exe "colorscheme " s:colors_d[s:color_cnt]
endfun

function! Smart_TabComplete()
  let line = getline('.')                         " current line

  let substr = strpart(line, -1, col('.')+1)      " from the start of the current
                                                  " line to one character right
                                                  " of the cursor
  let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
  if (strlen(substr)==0)                          " nothing to match on empty string
    return "\<tab>"
  endif
  let has_period = match(substr, '\.') != -1      " position of period, if any
  let has_slash = match(substr, '\/') != -1       " position of slash, if any
  if (!has_period && !has_slash)
    return "\<C-X>\<C-P>"                         " existing text matching
  elseif ( has_slash )
    return "\<C-X>\<C-F>"                         " file matching
  else
    return "\<C-X>\<C-O>"                         " plugin matching
  endif
endfunction

" }}}
