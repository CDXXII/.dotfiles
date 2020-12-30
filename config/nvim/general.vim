" Enables mouse support
set mouse=a

" Automatic switching of working directory
" Do not set this when using coc-list
" set autochdir

" Set the width of the tabs
set tabstop=2 softtabstop=2 shiftwidth=2 autoindent

" Converting tabs to spaces
set expandtab smarttab

" Show the last command entered
set showcmd

" Show search highlighting and ignore case
set incsearch ignorecase nohlsearch

" Automatic case conversion when searching
set smartcase

" Show highlighting on regular matches
set inccommand=nosplit

" String to put at the start of lines that have been wrapped
set showbreak=↪

" Show invisible characters and set invisible character style
set list listchars=tab:▒░,trail:▓

" Set automatic line feed
set wrap

" Use the same indent after a line break
set breakindent

" Set character encoding
set encoding=utf-8

" Turn on true color
set termguicolors

" Highlight the line where the cursor is located
set cursorline

" Putting unsaved files into the buffer
set hidden

" Open numeric line number
set number

" Show the line number relative to the line with the cursor in front of each line
set relativenumber

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience
set updatetime=300

" Don't pass messages to |ins-completion-menu|
set shortmess+=c

" Always show the signcolumn
if has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif

" Hide the display of mode message
set noshowmode

" Show emoji
set emoji

" Display longer text on the command line (@ is displayed by default)
set display+=lastline

" Show the status line in the penultimate row
set laststatus=2

" tabline width
set showtabline=2

" The cursor position remains the same after splitting the window
set nosplitright

" The height of the command line (under the status line)
set cmdheight=1

" Pop-up menu height (number of options)
if exists('+pumheight')
  set pumheight=15
endif

" Modification history remains after exit
function! s:init_backup_dir()
  let l:parent = $HOME . "/.config/nvim/.tmp"
  let l:prefix = 'vim'
  let l:dir_list = {
        \ 'backup': 'backupdir',
        \ 'views': 'viewdir',
        \ 'swap': 'directory',
        \ 'undo': 'undodir'
        \}
  let l:common_dir = l:parent . '/.' . l:prefix

  for [l:dirname, l:settingname] in items(l:dir_list)
    let l:directory = l:common_dir . l:dirname . '/'
    if exists('*mkdir')
      if !isdirectory(l:directory)
        call mkdir(l:directory, 'p', 0755)
      endif
    endif
    if !isdirectory(l:directory)
      echo 'Warning: Failed to create backup folder: ' . l:directory
      echo 'Try: mkdir -p ' . l:directory
    else
      let l:directory = substitute(l:directory, ' ', "\\\\ ", 'g')
      exec 'set ' . l:settingname . '=' . l:directory
    endif
  endfor
endfunction

call s:init_backup_dir()
set backup
set undofile

