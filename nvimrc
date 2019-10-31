filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim

set rtp+=/usr/local/opt/fzf

call vundle#begin("~/.config/nvim/bundle")

" let Vundle manage Vundle, required
Bundle 'VundleVim/Vundle.vim'

Bundle 'christoomey/vim-tmux-navigator'
Bundle 'tpope/vim-rails'
Bundle 'itchyny/lightline.vim'
Bundle 'maximbaz/lightline-ale'
Bundle 'junegunn/fzf.vim'
Bundle 'tpope/vim-vinegar'
Bundle 'jiangmiao/auto-pairs'
Bundle 'tpope/vim-endwise'
Bundle "tpope/vim-surround"
Bundle "tpope/vim-commentary"
Bundle "bronson/vim-trailing-whitespace"
Bundle "keith/tmux.vim"
Bundle "jpo/vim-railscasts-theme"
Bundle 'nanotech/jellybeans.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'rking/ag.vim'
Bundle 'tpope/vim-unimpaired'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'kana/vim-textobj-user'
Bundle 'elixir-lang/vim-elixir'
Bundle 'tpope/vim-repeat'
Bundle 'thoughtbot/vim-rspec'
Bundle 'christoomey/vim-tmux-runner'
Bundle 'christoomey/vim-system-copy'
Bundle "kana/vim-textobj-entire"
Bundle 'christoomey/vim-sort-motion'
Bundle 'kana/vim-textobj-indent'
Bundle 'tpope/vim-fugitive'
Bundle 'christoomey/vim-conflicted'
Bundle 'joukevandermaas/vim-ember-hbs'
Bundle 'slim-template/vim-slim.git'
Bundle 'elmcast/elm-vim'
Bundle 'rhysd/vim-crystal'
Bundle 'fatih/vim-go'
Bundle 'dense-analysis/ale'

" All of your Bundles must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
syntax on

let mapleader = "\<Space>"

set expandtab
set tabstop=2
set shiftwidth=2
set number
set relativenumber
set showmatch
set incsearch
set hlsearch
set nohlsearch
set autoread
set termguicolors
set noshowmode

colorscheme jellybeans
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

" Cursor in insert mode
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

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

" Map Ctrl + p to open fuzzy find (FZF)
nnoremap <c-p> :Files<cr>

nnoremap \ :Ag<SPACE>

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

set tags=./tags;

nmap 0 ^

" Move up and down by visible lines if current line is wrapped
nmap j gj
nmap k gk

nmap <leader>p orequire 'pry'; binding.pry<esc>^

" highlight trailing spaces in annoying red
highlight ExtraWhitespace ctermbg=1 guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

let g:rspec_command = "call VtrSendCommand('rspec {spec}', 1)"
nnoremap <leader>fr :VtrFocusRunner<cr>
nnoremap <leader>kr :VtrKillRunner<cr>
nnoremap <leader>rr :VtrSendLinesToRunner<cr>
nnoremap <leader>dr :VtrSendCtrlD<cr>
nnoremap <leader>ar :VtrAttachToPane<cr>

" Expand current path
cnoremap <expr> %%  getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Vim conflicted airline
set stl+=%{ConflictedVersion()}

let g:elm_format_autosave = 1

let g:lightline = {}

let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }

let g:lightline.component_type = {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ }

let g:lightline.active = { 'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]] }
