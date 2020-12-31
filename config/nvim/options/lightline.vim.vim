let g:lightline = {
  \ 'colorscheme': 'gruvbox',
  \ 'tabline': {
  \   'left': [[ 'buffers' ]],
  \   'right': [[ 'close' ], [ 'smarttabs' ]]
  \ },
  \ 'active': {
  \   'left' :[[ 'mode', 'paste'], [ 'modified' ], [ 'filename' ]],
  \   'right':[[ 'coc_info', 'coc_hints', 'coc_errors', 'coc_warnings', 'coc_ok' ], [ 'readonly' ], [ 'coc_status' ]]
  \ },
  \ 'inactive': {
  \   'left' :[[ 'mode' ]],
  \   'right':[[ 'readonly' ]]
  \ },
  \ 'component_expand': {
  \   'buffers': 'lightline#bufferline#buffers',
  \   'smarttabs': 'SmartTabsIndicator',
  \   'coc_warnings': 'lightline#coc#warnings',
  \   'coc_errors': 'lightline#coc#errors',
  \   'coc_info': 'lightline#coc#info',
  \   'coc_hints': 'lightline#coc#hints',
  \   'coc_ok': 'LightlineCocOk',
  \   'coc_status': 'lightline#coc#status'
  \ },
  \ 'component_type': {
  \   'buffers': 'tabsel',
  \   'coc_warnings': 'warning',
  \   'coc_errors': 'error',
  \   'coc_info': 'info',
  \   'coc_hints': 'hints',
  \   'coc_ok': 'left',
  \ },
  \ 'component_raw': {
  \   'buffers': 1
  \ },
  \ 'component_function': {
  \   'mode': 'LightlineMode',
  \   'readonly': 'LightlineReadonly',
  \   'modified': 'LightlineModified',
  \   'filename': 'LightlineFilename',
  \ },
  \ 'component': {
  \   'close': '%@LightlineCloseBuffer@ X %'
  \ }
  \ }

function! LightlineMode() abort
  let ftmap = {
    \ 'coc-explorer': 'EXPLORER',
    \ 'vim-plug': 'PLUGINS'
    \ }
   return get(ftmap, &filetype, lightline#mode())
endfunction

function! LightlineReadonly() abort
  return &readonly ? '' : ''
endfunction

function! LightlineModified() abort
  return &modified ? '+' : ''
endfunction

function! LightlineCocOk() abort
  return winwidth(0) < 60 ? '' : lightline#coc#ok()
endfunction

function! s:trim(maxlen, str) abort
    let trimed = len(a:str) > a:maxlen ? a:str[0:a:maxlen] . '..' : a:str
    return trimed
endfunction


function! LightlineFilename() abort
  let l:maxlen = winwidth(0) - winwidth(0) / 2
  let l:relative = expand('%:.')
  let l:tail = expand('%:t')
  let l:noname = 'No Name'

  if winwidth(0) < 50
    return ''
  endif

  if winwidth(0) < 80
    return l:tail ==# '' ? l:noname : s:trim(l:maxlen, l:tail)
  endif

  return l:relative ==# '' ? l:noname : s:trim(l:maxlen, l:relative)
endfunction

function! LightlineCloseBuffer(...)
  try
    bdelete
  catch
    call lightline#error(v:exception)
  endtry
endfunction

function! SmartTabsIndicator() abort
  let tabs = lightline#tab#tabnum(tabpagenr())
  let tab_total = tabpagenr('$')
  return tabpagenr('$') > 1 ? ('TABS: ' . tabs . '/' . tab_total) : ''
endfunction
