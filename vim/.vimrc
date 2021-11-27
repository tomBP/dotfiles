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
Plugin 'easymotion/vim-easymotion.git'
" Git
Plugin 'tpope/vim-fugitive'
" Completion
Plugin 'tpope/vim-surround'
Plugin 'mattn/emmet-vim'
" Saving
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" ========================================================================
" Global Config
" ========================================================================
"
" LEADER
let mapleader = ","
let g:mapleader = ","

" ========================================================================
" Plugin Config
" ========================================================================

" Snippets
let g:UltiSnipsExpandTrigger="<leader>s"

" Nerd Tree 
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 0
let g:NERDTreeChDirMode = 2

" Standard
autocmd bufwritepost *.js silent !standard --fix %

" ========================================================================
" Load Additional Config 
" ========================================================================

source ~/.vim/startup/commands.vim
source ~/.vim/startup/settings.vim
source ~/.vim/startup/abbreviations.vim
