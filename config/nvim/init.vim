let s:script_path = expand('<sfile>:p:h')

let s:sourceList = [
      \ 'plugin',
      \ 'general',
      \ 'autocmd',
      \ 'command',
      \ 'mapping',
      \ 'config',
      \ ]

for s:item in s:sourceList
  exec 'source ' . s:script_path . '/' . s:item . '.vim'
endfor

unlet s:script_path
unlet s:sourceList
