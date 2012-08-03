"""""""""""""""""""""""""""""""""""""
" =>        Pathogen                "
"""""""""""""""""""""""""""""""""""""
call pathogen#runtime_append_all_bundles ( )
call pathogen#infect ( )
"""""""""""""""""""""""""""""""""""""
" =>        Colors                  "
"""""""""""""""""""""""""""""""""""""
syntax on
filetype plugin on
filetype indent on
colorscheme darkZ
set background=dark
set gfn=Menlo:h14
set shell=/usr/local/bin/zsh
"""""""""""""""""""""""""""""""""""""
" =>        General                 "
"""""""""""""""""""""""""""""""""""""
set nocompatible
set backspace=indent,eol,start
set noerrorbells
set autoread
set number
set ruler
set tabpagemax=15
set cursorline
hi cursorline guibg=#333333
hi CursorColumn guibg=#333333
" Fast saving
nmap <leader>w :w!<cr>
set linespace=0
set showmatch
set incsearch
set hlsearch
set winminheight=0
set ignorecase
set smartcase
set whichwrap=b,s,h,l,<,>,[,]
set scrolljump=5
set scrolloff=5
set foldenable
set gdefault
set list
set invlist
"set listchars=tab:>.,trail:.,extends:#,nbsp:. " Highlight problematic whitespace
set nowrap
set autoindent
"set tw=78
set shiftwidth=4
set expandtab
set tabstop=4
set softtabstop=4
set pastetoggle=<F12>
"""""""""""""""""""""""""""""""""""""
" =>         NERDTree               "
"""""""""""""""""""""""""""""""""""""
map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
map <leader>e :NERDTreeFind<CR>
nmap <leader>nt :NERDTreeFind<CR>
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr', '\.java~', '\.class']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
"""""""""""""""""""""""""""""""""""""
" =>        Tabs                    "
"""""""""""""""""""""""""""""""""""""
map <leader>tt :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove
map <leader>fft :FuzzyFinderTextMate<cr>
"""""""""""""""""""""""""""""""""""""
" => Python section                 "
"""""""""""""""""""""""""""""""""""""
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
map <leader>tlt :TlistToggle<CR>
"""""""""""""""""""""""""""""""""""""
" => Python section                 "
"""""""""""""""""""""""""""""""""""""
let python_highlight_indents = 0
let python_highlight_all = 1
map <leader>i0 :let python_highlight_indents = 0<CR>:source $MYVIMRC<CR>
map <leader>i1 :let python_highlight_indents = 1<CR>:source $MYVIMRC<CR>
au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako

au FileType python inoremap <buffer> $r return
au FileType python inoremap <buffer> $i import
au FileType python inoremap <buffer> $p print
au FileType python inoremap <buffer> $f #--- PH ----------------------------------------------<esc>FP2xi
au FileType python map <buffer> <leader>1 /class
au FileType python map <buffer> <leader>2 /def
au FileType python map <buffer> <leader>C ?class
au FileType python map <buffer> <leader>D ?def
"""""""""""""""""""""""""""""""""""""
" => Print Options                  "
"""""""""""""""""""""""""""""""""""""
set printoptions=number:y
"""""""""""""""""""""""""""""""""""""
" => JavaScript section             "
"""""""""""""""""""""""""""""""""""""
au FileType javascript call JavaScriptFold ( )
au FileType javascript setl fen
au FileType javascript setl nocindent

au FileType javascript imap <c-t> AJS.log ( );<esc>hi
au FileType javascript imap <c-a> alert ( );<esc>hi

au FileType javascript inoremap <buffer> $r return
au FileType javascript inoremap <buffer> $f //--- PH ----------------------------------------------<esc>FP2xi

function! JavaScriptFold ( )
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText ( )
    return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText ( )
endfunction

"""""""""""""""""""""""""""""""""""""
" => My Commands                    "
"""""""""""""""""""""""""""""""""""""
map <leader>fws :%s/\t/    <CR> :FixWhitespace <CR>
map <leader>ffr :ruby finder.rescan!<CR>
map <leader>fps :%s/\([^ ]\)();$/\1 ( );<CR> :%s/\([^ ]\)(\(.*\));$/\1 ( \2 );<CR>
" => Line Number switch between relative/absolute

function! g:ToggleNuMode ( )
    if(&rnu == 1)
        set nu
    else
        set rnu
    endif
endfunc

"""""""""""""""""""""""""""""""""""""""""""""""""
" Toggle Between Relative/Absolute Line Numbers "
"""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-L> :call g:ToggleNuMode ( )<cr>

""""""""""""""""""""""""""""""
" Escape removes last search "
""""""""""""""""""""""""""""""
nnoremap <esc> :noh<return><esc>

"""""""""""""""""
" Toggle TagBar "
"""""""""""""""""
nnoremap <C-T> :TagbarToggle<cr>

""""""""""""""
" fix arrows "
""""""""""""""
map <Esc>[B <Down>

""""""""""""""""""""
" TMux style Splits"
""""""""""""""""""""
nnoremap <C-w><bar> <C-w>v
nnoremap <C-w>_ <C-w>s

""""""""""""""""""""
" L/R Tab movement "
""""""""""""""""""""
nnoremap <Left> :tabprevious<CR>
nnoremap <Right> :tabnext<CR>
