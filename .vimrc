" ========================================================================
" Plugin Configuration
" ========================================================================
set nocompatible " Required by vundle
filetype off     " Required by vundle

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle,required
Plugin 'gmarik/vundle'

" My plugins
Plugin 'scrooloose/nerdtree.git'
Plugin 'tpope/vim-fugitive'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'easymotion/vim-easymotion.git'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'bling/vim-airline'
Plugin 'bling/vim-bufferline'
Plugin 'initrc/eclim-vundle'
Plugin 'Valloric/YouCompleteMe'
Plugin 'marijnh/tern_for_vim'
Plugin 'scrooloose/syntastic'
Plugin 'xolox/vim-session'
Plugin 'xolox/vim-misc'
Plugin 'alvan/vim-closetag'
Plugin 'mattn/emmet-vim'
Plugin 'majutsushi/tagbar'
Plugin 'xolox/vim-easytags' 

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256

if has("gui_running")
   colorscheme jellybeans
else
   colorscheme jellybeans
endif

let g:EclimCompletionMethod = 'omnifunc'

let g:ctrlp_map = '<c-p>'
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 'rw'

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 0
let g:NERDTreeChDirMode = 2

set tags=./tags;,~/.vimtags
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1
" ========================================================================
" Load Configuration 
" ========================================================================

source ~/.vim/startup/commands.vim
source ~/.vim/startup/settings.vim
source ~/.vim/startup/abbreviations.vim
