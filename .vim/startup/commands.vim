" LEADER
let mapleader = ","
let g:mapleader = ","

" FILE OPERATIONS
noremap <leader>w :w!<cr>
noremap <leader>c :q!<cr>
noremap <leader>ca :qall!<cr>
command W w !sudo tee % > /dev/null
noremap <leader>ev :e $MYVIMRC<cr>
" Doesn't work with Vundle nnoremap <leader>sv :source $MYVIMRC<cr>
noremap <leader>evc :e ~/.vim/startup/commands.vim<cr>
noremap <leader>evs :e ~/.vim/startup/settings.vim<cr>
" Doesn't work either nnoremap <leader>svc :source ~/.vim/startup/commands.vim<cr>!

" SEARCH
nnoremap <silent> <leader>cs :nohlsearch<Bar>:echo<CR>

" NERDTREE
autocmd VimEnter * NERDTree
autocmd BufEnter * lcd %:p:h
noremap <leader>nt :NERDTreeTabsToggle<CR>

" TERN
noremap <leader>tr :TernRefs<CR>


" MAPS
noremap H ^
noremap L $
noremap 0 ^
nnoremap G Gzz
nnoremap n nzz
nnoremap N Nzz
nnoremap } }zz
nnoremap { {zz
noremap j gj
noremap k gk
noremap <space> /
noremap <c-space> ?
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;
noremap <C-a> ggVG

" SESSIONS
noremap <leader>os :OpenSession<cr>

" BUFFERS AND TABS
noremap gb :bp<cr>
noremap gB :bn<cr>
noremap <leader>bd :bdelete<cr>

" WINDOWS
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

" MOVE A LINE OF TEXT USING ALT+[JK] 
nnoremap <M-j> mz:m+<cr>`z
nnoremap <M-k> mz:m-2<cr>`z
vnoremap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vnoremap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z


" AIRLINE
if !exists('g:airlinesymbols') 
   let g:airlinesymbols = {} 
endif 
let g:airlineleftsep = '»' 
let g:airlineleftsep = '?' 
let g:airlinerightsep = '«' 
let g:airlinerightsep = '?' 
let g:airlinesymbols.linenr = '?' 
let g:airlinesymbols.linenr = '?' 
let g:airlinesymbols.linenr = '¶' 
let g:airlinesymbols.branch = '?' 
let g:airlinesymbols.paste = '?'
let g:airlinesymbols.paste = 'Þ' 
let g:airlinesymbols.paste = '?' 
let g:airlinesymbols.whitespace = '?'
