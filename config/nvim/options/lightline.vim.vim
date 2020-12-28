let g:lightline = {
  \ 'colorscheme': 'nord',
  \ 'tabline': {
  \   'left': [ ['buffers'] ],
  \   'right': [ ['close'] ]
  \ },
  \ 'active': {
  \   'left' :[[ 'mode', 'paste' ]],
  \   'right':[[ 'coc_info', 'coc_hints', 'coc_errors', 'coc_warnings', 'coc_ok' ], [ 'coc_status' ], [ 'readonly' ]]
  \ },
  \ 'inactive': {
  \   'left' :[[ 'mode' ]],
  \   'right':[[ 'readonly' ]]
  \ },
  \ 'component_expand': {
  \   'buffers': 'lightline#bufferline#buffers'
  \ },
  \ 'component_type': {
  \   'buffers': 'tabsel'
  \ },
  \ 'component_raw': {
  \   'buffers': 1
  \ },
  \ 'component_function': {
  \   'mode': 'LightlineMode',
  \   'readonly': 'LightlineReadonly',
  \ },
  \ }

function! LightlineMode() abort
  let ftmap = {
    \ 'coc-explorer': 'EXPLORER',
    \ }
   return get(ftmap, &filetype, lightline#mode())
endfunction

function! LightlineReadonly() abort
  return &readonly ? '' : ''
endfunction

call lightline#coc#register()
