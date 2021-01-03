if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Plug 'ryanoasis/vim-devicons'

Plug 'gruvbox-community/gruvbox'

" View and search LSP symbols
Plug 'liuchengxu/vista.vim'

Plug 'itchyny/lightline.vim'

Plug 'mengelbrecht/lightline-bufferline'

Plug 'josa42/vim-lightline-coc'

Plug 'mbbill/undotree'

" Restore cursor position
Plug 'farmergreg/vim-lastplace'

Plug 'tpope/vim-surround'

Plug 'tpope/vim-repeat'

" Toggle zoom of current window within the current tab
Plug 'dhruvasagar/vim-zoom'

Plug 'tommcdo/vim-exchange'

" Automatically remove search highlighting
Plug 'romainl/vim-cool'

" Switching between a single-line statement and a multi-line one
Plug 'AndrewRadev/splitjoin.vim'

Plug 'Yggdroot/indentLine'

Plug 'luochen1990/rainbow'

Plug 'chemzqm/vim-jsx-improve'

Plug 'leafgarland/typescript-vim'

Plug 'maxmellon/vim-jsx-pretty'

" Plug 'peitalin/vim-jsx-typescript'

Plug 'posva/vim-vue'

" Comment stuff out
Plug 'tpope/vim-commentary'

" Use terminal in the floating/popup window.
Plug 'voldikss/vim-floaterm'

" A Vim plugin to move function arguments
Plug 'andrewradev/sideways.vim'

" Jump to any location specified by two characters.
Plug 'justinmk/vim-sneak'

Plug 'rbtnn/vim-vimscript_indentexpr'

Plug 'yianwillis/vimcdoc'

" Embed Neovim in your browser.
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

call plug#end()
