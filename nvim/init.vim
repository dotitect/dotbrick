set ignorecase
set clipboard+=unnamedplus

tnoremap <ESC> <C-\><C-n>

" Install vim-plug if necessary
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'tpope/vim-commentary'
Plug 'neovim/nvim-lspconfig'

call plug#end()

lua << EOF
require'lspconfig'.tsserver.setup{}
EOF