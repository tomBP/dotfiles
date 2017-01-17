" ========================================================================
" Plugin Installation
" ========================================================================
set nocompatible " Required by vundle
filetype off     " Required by vundle

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle,required
Plugin 'VundleVim/Vundle.vim'

" Plugins

" Navigation
Plugin 'scrooloose/nerdtree.git'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'easymotion/vim-easymotion.git'
Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'
" Git
Plugin 'tpope/vim-fugitive'
" Completion
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs.git'
Plugin 'Valloric/YouCompleteMe'
Plugin 'alvan/vim-closetag'
Plugin 'mattn/emmet-vim'
Plugin 'tomtom/tcomment_vim'
" Baseline
Plugin 'bling/vim-airline'
Plugin 'bling/vim-bufferline'
" Linters
Plugin 'scrooloose/syntastic'
" Saving
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
" Searching
Plugin 'mileszs/ack.vim'
" Terminal
Plugin 'jewes/Conque-Shell'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" ========================================================================
" Plugin Config
" ========================================================================

" Colours
if has("gui_running")
   colorscheme jellybeans
else
   colorscheme jellybeans
endif

" Powerline
set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256

" Ctrl P 
let g:ctrlp_map = '<c-p>'
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py|node_modules'
let g:ctrlp_dotfiles = 1
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 'rw'
let g:ctrlp_show_hidden = 1

" Nerd Tree 
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 0
let g:NERDTreeChDirMode = 2

" Syntastic 
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

" Tags
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

" ========================================================================
" Load Configuration 
" ========================================================================

source ~/.vim/startup/commands.vim
source ~/.vim/startup/settings.vim
source ~/.vim/startup/abbreviations.vim
