" Keymaps {{{1

let mapleader=" "
" Normal Mode {{{2
nnoremap <leader>; $
" Toggle maps
nnoremap <Leader>tf za
nnoremap <Leader>tn :set number!<CR>
nnoremap <Leader>tr :set relativenumber!<CR>
nnoremap <Leader>th :nohls<CR>

nnoremap <Leader>ws :split<CR>
nnoremap <Leader>wv :vsplit<CR>
" set splits equal
nmap <Leader>we <C-w>= 
" move between splits
nmap <Leader>wj <C-w>j
nmap <Leader>wk <C-w>k
nmap <Leader>wl <C-w>l
nmap <Leader>wh <C-w>h
" rotate windows right
nmap <Leader>wr <C-w>r
" rotate windows backwards
nmap <Leader>wR <C-w>R
" move split to a new tab
nmap <Leader>wt <C-w>T

" Jump maps
if isdirectory(expand('~') . "/.vim/bundle/vim-easymotion")
    " jump down lines
    nmap <Leader>jd <Plug>(easymotion-j)
    nmap <Leader>ju <Plug>(easymotion-k)
    nmap <Leader>jw <Plug>(easymotion-w)
    nmap <Leader>jb <Plug>(easymotion-b)
endif

" Text maps
" align text
if isdirectory(expand('~') . "/.vim/bundle/vim-easy-align")
    nmap <Leader>xa <Plug>(EasyAlign)
    vmap <Leader>xa <Plug>(EasyAlign)
endif

" Fuzzy maps
if isdirectory(expand('~') . "/.vim/bundle/fzf.vim")
    nnoremap <Leader>ff :Files<CR>
    nnoremap <Leader>fb :Buffers<CR>
    nnoremap <Leader>fl :Lines<CR>
endif

if isdirectory(expand('~') . "/.vim/bundle/nerdtree")
    nnoremap <silent> <F3> :NERDTreeMirrorToggle<CR>
endif

if isdirectory(expand('~') . "/.vim/bundle/nerdcommenter")
    nnoremap <silent> <Leader>ct :call NERDComment('n', 'Toggle')<CR>
endif

" resize splits
if has('macunix')
  nnoremap ¬ :vertical resize +2 <CR> h" alt-l
  nnoremap ˙ :vertical resize -2 <CR> h" alt-h
  nnoremap ˚ :resize +2<CR> h" alt-k
  nnoremap ∆ :resize -2<CR> h" alt-j
else
  nnoremap <M-l> :vertical resize +2<CR>
  nnoremap <M-h> :vertical resize -2<CR>
  nnoremap <M-k> :resize +2<CR>
  nnoremap <M-j> :resize -2<CR>
endif

" move a line up/down
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==

" Visual Mode {{{2
" indent lines in visual mode
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" move selected lines up/dowm
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv


function! NeatFoldText()
    let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
    let lines_count = v:foldend - v:foldstart + 1
    let lines_count_text = '| ' . printf("%s", lines_count . ' lines') . ' |'
    let foldchar = matchstr('--', 'fold:\zs.')
    let foldtextstart = '+' . repeat('-', v:foldlevel*2) . line
    let foldtextend = lines_count_text . repeat(foldchar, 8)
    let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
    return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction

set foldtext=NeatFoldText()

