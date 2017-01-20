" FILE OPERATIONS
noremap <leader>w :w!<cr>
noremap <leader>cc :q!<cr>
noremap <leader>ca :qall!<cr>
command W w !sudo tee % > /dev/null
noremap <leader>ev :e $MYVIMRC<cr>
noremap <leader>evc :e ~/.vim/startup/commands.vim<cr>
noremap <leader>evs :e ~/.vim/startup/settings.vim<cr>
noremap <leader>eva :e ~/.vim/startup/abbreviations.vim<cr>

" SEARCH
nnoremap <silent> <leader>cs :nohlsearch<Bar>:echo<CR>

" NERDTREE
noremap <leader>nt :NERDTreeTabsToggle<CR>

" TERMINAL
noremap <leader>ct :ConqueTermSplit bash<CR> :res -20<CR>

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

" MOVE A LINE OF TEXT USING ALT+[JK] 
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

