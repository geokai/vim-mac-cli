" ~/.vimrc -> ~/.vim/vimrc
" Author: George Kaimakis <geomatus@mac.com>
" -based on material from: Shawn Biddle, Steve Losh...
" Source: ~/.vim/...

" PATHOGEN & Compatability:------------------------------------------------{{{1
"
"set shell=/bin/bash\ --login
"
filetype off
execute pathogen#infect()
filetype plugin indent on
set nocompatible
"
" SYNTASTIC:---------------------------------------------------------------{{{1
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" let g:syntastic_mode = "passive"
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [], 'passive_filetypes': [] }
let g:syntastic_always_populate_loc_list = 1

let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_check_on_x = 0
let g:syntastic_python_python_exec = 'python3'

map <silent> <c-w>E :SyntasticCheck<CR> :lopen<CR>
map <silent> <c-w>R :lclose<CR> :SyntasticReset<CR>

" AIRLINE:-----------------------------------------------------------------{{{1
" vim-airline settings:

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" old vim-powerline symbols
" let g:airline_left_sep = '⮀'
" let g:airline_left_alt_sep = '⮁'
" let g:airline_right_sep = '⮂'
" let g:airline_right_alt_sep = '⮃'
" let g:airline_symbols.branch = '⭠'
" let g:airline_symbols.readonly = '⭤'
" " let g:airline_symbols.linenr = '⭡'

" unicode symbols
" let g:airline_left_sep = '»'
" let g:airline_left_sep = '▶'
" let g:airline_right_sep = '«'
" let g:airline_right_sep = '◀'
" let g:airline_symbols.linenr = '␊'
" let g:airline_symbols.linenr = '␤'
" let g:airline_symbols.linenr = '¶'
" let g:airline_symbols.branch = '⎇'
" let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.paste = 'Þ'
" let g:airline_symbols.paste = '∥'
" let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_symbols.branch = ''
" let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = ''

let g:airline_theme = 'badwolf'

" POWERLINE:---------------------------------------------------------------{{{1
" set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/

" NERDTree:----------------------------------------------------------------{{{1
nnoremap <leader>ed <ESC>:NERDTreeTabsToggle<CR>

" Show SYNTAX HIGHLIGHTING GROUP for word under cursor:--------------------{{{1
"
nmap <C-S-P> :call <sid>SynStack()<CR>
function! <sid>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
"
" BASIC SETTNGS:-----------------------------------------------------------{{{1

set t_Co=256
syntax enable
set shortmess+=Iw
set number
colorscheme desert
set background=dark
set showcmd
set noshowmode
set list
set listchars=tab:›\ ,trail:–,extends:»,precedes:«,eol:¬
set showbreak=↳\ 
set hidden
" set visualbell
set cursorline
set gdefault
set laststatus=2
set backspace=2
set scrolloff=5
set title
set statusline="sn"
set ruler

highlight colorcolumn ctermbg=darkred
highlight cursorline ctermbg=234 ctermfg=none cterm=none
highlight nontext ctermfg=darkgrey ctermbg=none " guifg=4a4a59
highlight specialkey ctermfg=darkgrey ctermbg=none " guifg=4a4a59

" Finding & Autocomplete:--------------------------------------------------{{{1

set path+=**
set wildmenu
set hlsearch
set incsearch
set ignorecase
set smartcase
set highlight=si
set showmatch

" Tabs, Spaces, Wrapping, Re-Mapping:--------------------------------------{{{1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set wrap
set textwidth=80
set colorcolumn=+1


" remap the Leader key:
let mapleader = ","
let maplocalleader = "\\"

" toggle wrapping:
nnoremap <silent> <leader>wr <ESC>:set wrap!<CR><ESC>

" remap the arrow keys:
" : in NORMAL mode
nnoremap <up> <Nop>
nnoremap <left> <Nop>
nnoremap <right> <Nop>
nnoremap <down> <Nop>

" : in INSERT mode
inoremap <up> <Nop>
inoremap <left> <Nop>
inoremap <right> <Nop>
inoremap <down> <Nop>

" : in VISUAL mode
vnoremap <up> <Nop>
vnoremap <left> <Nop>
vnoremap <right> <Nop>
vnoremap <down> <Nop>

" quick pairs in INSERT mode
inoremap <leader>' ''<ESC>i
inoremap <leader>" ""<ESC>i
inoremap <leader>* **<ESC>i
inoremap <leader>( ()<ESC>i
inoremap <leader>[ []<ESC>i
inoremap <leader>t[ [  ]<ESC>hi
inoremap <leader>{ {}<ESC>i
inoremap <leader>< <><ESC>i
" surround a word with ... pairs
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
nnoremap <leader>( viw<esc>a)<esc>hbi(<esc>lel
nnoremap <leader>{ viw<esc>a}<esc>hbi{<esc>lel
nnoremap <leader>< viw<esc>a><esc>hbi<<esc>lel
nnoremap <leader>[ viw<esc>a]<esc>hbi[<esc>lel
nnoremap <leader>__ viw<esc>a__<esc>hbi__<esc>lel
" exit pair(s) to end of line:
inoremap <c-l> <ESC>A
" exit nested pair to within parent pair:
inoremap <c-j> <ESC>la
" set up function block:
inoremap <leader>{{ {}<ESC>i<CR><ESC>O

" navigating between vim tabs
nnoremap <leader>n <ESC>:tabn<CR>
nnoremap <leader>p <ESC>:tabp<CR>

" use relative numbering
nnoremap <silent> <leader>u <ESC>:set relativenumber!<CR><ESC>
inoremap <silent> <leader>u <ESC>:set relativenumber!<CR><ESC>i

" movement: centering, cursor to page
"nnoremap G Gzz
"nnoremap k kzz
"nnoremap j jzz
"nnoremap H Hzz
"nnoremap M Mzz
"nnoremap L Lzz
"nnoremap } }zz
"nnoremap { {zz

" miscilanious mappings:
" open vimrc in a split for a quick edit
nnoremap <leader>ev :tabnew $MYVIMRC<cr>
" source the vimrc file
nnoremap <leader>sv :source $MYVIMRC<cr>
" -all-caps & continue in INSERT mode
inoremap <c-u> <esc>viwUea
" -all-caps & continue in NORMAL mode
nnoremap <c-u> viwUea<ESC>
" -add missing ';' to end of statements
nnoremap <leader>: mqA:<ESC>`q
" - search & highlighting
nnoremap <silent> <leader>nh :nohl<cr>
" -useful Fkey mappings:
map <F2> <ESC>i#!/bin/bash<ESC>o<ESC>
map <F3> <ESC>i#!/usr/local/bin/python3<ESC>o<ESC>
map <F4> <ESC>o# This file was created on <ESC>:r!date "+\%x"<ESC>kJ0<ESC>
map <F5> <ESC>o# Author: George Kaimakis - https://github.com/geokai<ESC>o<ESC>

" Folding:-----------------------------------------------------------------{{{1
highlight Foldcolumn ctermfg=Darkgrey ctermbg=0 cterm=BOLD
highlight Folded ctermfg=Darkgrey ctermbg=NONE cterm=none
set foldcolumn=4
set foldmethod=marker
set foldlevelstart=0

function! MyFoldText()  "  {{{2
  let line = getline(v:foldstart)

  let nucolwidth = &fdc + &number * &numberwidth
  let windowwidth = winwidth(0) - nucolwidth - 3
  let foldedlinecount = v:foldend - v:foldstart

  let onetab = strpart('           ', 0, &tabstop)
  let line = substitute(line, '\t', onetab, 'g')

  let line = strpart(line, 0, windowwidth - 2 - len(foldedlinecount))
  let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
  return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction  "  2}}}

set foldtext=MyFoldText()

" Crontab safe:------------------------------------------------------------{{{1
" Make vim able to edit crontab files w/o exploding!
set backupskip=/tmp/*,/private/tmp/*"

" Examples & Misc:---------------------------------------------------------{{{1

" steve losh - learn<VIMSCRIPT>thw chapter 29...delete 2 lines, undo one at a
" time
"
" nnoremap <leader>d ddi<C-G>u<ESC>dd
"
" 1}}}

" End of .vimrc file:
