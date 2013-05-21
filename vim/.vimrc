colorscheme koehler

let $LANG='en'
set langmenu=none

set bs=2

set directory^=$HOME/.vim_swap//   "put all swap files together in one place"

filetype on
filetype plugin on
filetype plugin indent on

autocmd BufNewFile,BufRead *.json setf json

"" http://mirnazim.org/writings/vim-plugins-i-use/
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
call pathogen#infect()

autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source ~/.vim/bundle/closetag.vim/plugin/closetag.vim

com! Sw :call FSwitch('%', '')

"" Leader mappings
let mapleader = ","
let maplocalleader = ";"

" set cindent
set sw=4

syntax on

set tabstop=4
set shiftwidth=4
set expandtab

" set textwidth=79

set pastetoggle=<F3>

set number
nnoremap <F2> :set nonumber!<CR>

set showmatch
set autoindent
set ruler
set hlsearch
set incsearch

" http://dailyvim.blogspot.fi/2009/11/shift-tabing.html
" TODO: find an alternative to this! seems to bork git commit
"imap <S-Tab> <C-o><<

map <Leader>r *Nciw

command W w
command Q q
command WQ wq
command Wq wq
command Qa qa
command QA qa
command Wa wa
command WA wa

noremap ö l
noremap l k
noremap k j
noremap j h

" First non-whitespace character
map å ^

" End of line
map ä $

" Beginning of line
map Å 0

" Last non-space character
map Ä g_

" G should map to the last character of the last line
map G Gg_

" Same for visual mode
vmap å ^
vmap ä $
vmap Å 0
vmap Ä g_

" http://codingfearlessly.com/2012/08/21/vim-putting-arrows-to-use/
"nmap <Left> <<
"nmap <Right> >>
"vmap <Left> <gv
"vmap <Right> >gv

"nmap <Up> [e
"nmap <Down> ]e
"vmap <Up> [egv
"vmap <Down> ]egv

" http://stackoverflow.com/questions/526858/how-do-i-make-vim-do-normal-bash-like-tab-completion-for-file-names
set wildmode=longest,list

" spell-checking
set spelllang=en_us

" show trailing whitespace
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" expand tabs
let g:Jsbeautify_jslint_expandtab = 1

" disable ex mode
nnoremap Q <nop>

" https://gist.github.com/3418841
" toggle line numbers
" use Ctrl+L to toggle the line number counting method
function! g:ToggleNuMode()
    if &nu == 1
        set rnu
    else
        set nu
    endif
endfunction
nnoremap <silent><C-L> :call g:ToggleNuMode()<cr>
