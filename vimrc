" A modest vimrc
" Author: Jim Zhao<zjj3065@gmail.com>

" <--- Before ---> vundle#begin() is called
filetype plugin indent off                                      " required
autocmd FileType netrw setl bufhidden=delete                    " or use qa!

" Basic Settings
set nocompatible                                                " `Better safe than sorry`
set encoding=utf-8                                              " enable utf8
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936        " enable utf8
set termencoding=utf-8                                          " enable utf8
set mouse=a                                                     " enable mouse
set clipboard=unnamed,unnamedplus                               " enable clipboard
set nowrap                                                      " disable wrapping
set textwidth=0                                                 " disable text length limit
set autoread                                                    " reload on external file changes
set backspace=indent,eol,start                                  " backspace behavior
set autochdir                                                   " auto changing current pwd

" UI Settings
set wildmenu wildmode=longest:full,full                         " wildmode behavior
set term=xterm-256color                                         " colorful terminal
set nu rnu                                                      " enable line number & relative line number
set showmatch                                                   " show matching brackets

" Search Settings
set ignorecase smartcase                                        " case options
set hlsearch incsearch                                          " highlighting
set path+=**                                                    " Search all subdirectories recursively

" Tab & Indentation
set autoindent expandtab                                        " autoident & tabbing
set tabstop=4 softtabstop=4 shiftwidth=4                        " 1 tab = 4 spaces

" Undo & Backup
set nobackup noswapfile nowritebackup                           " disable backup/swap files
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo")
    call mkdir($HOME."/.vim/undo", "", 0700)
endif
set undodir=~/.vim/undo                                         " undo options
set undofile                                                    " undo options
set undolevels=9999                                             " undo options

" Plugin Settings
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'                                   " Vundle
Plugin 'scrooloose/nerdtree'                                    " NERDTREE
let g:NERDTreeWinSize=48

Plugin 'patstockwell/vim-monokai-tasty'                         " Monokai
call vundle#end()                                               " required

" <--- after ---> vundle#end() is called
filetype plugin indent on                                       " required
syntax on                                                       " required

" Theme Settings
colorscheme vim-monokai-tasty

" Keybinding Settings
map <C-n> :NERDTreeToggle<CR>
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>             " clear last search highlights
nnoremap <C-t>      :tabnew<CR>                                 " create a new tab
nnoremap <C-h>      :tabprev<CR>                                " go to prev tab
nnoremap <C-l>      :tabnext<CR>                                " go to next tab
nnoremap <C-Left>   :tabm -1<CR>                                " move current tab to prev position
nnoremap <C-Right>  :tabm +1<CR>                                " move current tab to next position


map <C-j>   :cn<CR>                                             " go to next in quickfix list
map <C-k>   :cp<CR>                                             " go to previous in quickfix list
map <C-x>   :q<CR>                                              " close current buffer if nothing happens

" Map <F3> to trigger vimgrep with noautocmd (search faster)
nnoremap <F3> :noautocmd vimgrep // **/*<c-f>$Bhhi
