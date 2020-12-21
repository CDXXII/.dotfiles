let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'enable': {
      \ 'statusline': 1,
      \   'tabline': 1
      \ },
      \ 'active': {
      \   'left' :[[ 'mode', 'paste' ], [ 'readonly', 'modified' ]],
      \   'right':[[ 'coc_info', 'coc_hints', 'coc_errors', 'coc_warnings', 'coc_ok' ], [ 'coc_status' ], [ 'filetype' ]]
      \ },
      \ }

call lightline#coc#register()
