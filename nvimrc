filetype off
syntax on

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin("~/.config/nvim/bundle")

" let Vundle manage Vundle, required
Bundle 'VundleVim/Vundle.vim'

Bundle 'christoomey/vim-tmux-navigator'
Bundle 'tpope/vim-rails'
Bundle 'vim-airline/vim-airline'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-vinegar'
Bundle 'jiangmiao/auto-pairs'
Bundle 'tpope/vim-endwise'
Bundle "tpope/vim-surround"
Bundle "tpope/vim-commentary"
Bundle "bronson/vim-trailing-whitespace"
Bundle "keith/tmux.vim"
Bundle "jpo/vim-railscasts-theme"
"Bundle 'flazz/vim-colorschemes'
Bundle 'nanotech/jellybeans.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'rking/ag.vim'

" All of your Bundles must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let mapleader = "\<Space>"

nnoremap <Leader>w :w<CR>

set expandtab
set tabstop=2
set shiftwidth=2

set number
set showmatch
set incsearch
set hlsearch
set nohlsearch

colorscheme jellybeans

" Cursor in insert mode
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Splits
set splitbelow
set splitright

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

map <C-n> :NERDTreeToggle<CR>

let g:ag_working_path_mode="r"

" Make it more obvious which paren I'm on
hi MatchParen cterm=none ctermbg=black ctermfg=yellow
