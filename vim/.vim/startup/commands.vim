" LEADER
let mapleader = ","
let g:mapleader = ","

" FILE OPERATIONS
noremap <leader>w :w!<cr>
noremap <leader>cc :q!<cr>
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
" autocmd VimEnter * NERDTree
" autocm BufEnter * if expand('%:p') !~ '://' | :lchdir %:p:h | endif
noremap <leader>nt :NERDTreeTabsToggle<CR>

" TERN
noremap <leader>tr :TernRefs<CR>

" TAGBAR
noremap <leader>tb :TagbarToggle<CR>

" MAPS
noremap H ^
noremap L $
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
vnoremap // y/<C-R>"<CR>

" SESSIONS
noremap <leader>os :OpenSession<cr>

" BUFFERS AND TABS
noremap gB :bp<cr>
noremap gb :bn<cr>
noremap <leader>bd :bdelete<cr>

" WINDOWS
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l


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

