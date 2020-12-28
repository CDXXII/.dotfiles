if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'ryanoasis/vim-devicons'

" Plug 'gruvbox-community/gruvbox'
Plug 'arcticicestudio/nord-vim'

Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'josa42/vim-lightline-coc'

Plug 'mbbill/undotree'

" Restore cursor position
Plug 'farmergreg/vim-lastplace'

Plug 'tpope/vim-surround'

Plug 'tpope/vim-repeat'

Plug 'dhruvasagar/vim-zoom'

Plug 'tommcdo/vim-exchange'

" Automatically remove search highlighting
Plug 'romainl/vim-cool'

" Switching between a single-line statement and a multi-line one
Plug 'AndrewRadev/splitjoin.vim'

Plug 'Yggdroot/indentLine'

Plug 'chemzqm/vim-jsx-improve'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
"Plug 'peitalin/vim-jsx-typescript'
Plug 'posva/vim-vue'

Plug 'tweekmonster/helpful.vim'

call plug#end()
