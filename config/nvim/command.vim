command! -nargs=0 Reset :call s:StatusReset()
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
command! -nargs=0 Eslint :call CocAction('runCommand', 'eslint.executeAutofix')
command! -nargs=+ -complete=custom,s:GrepArgs Rg :exe 'CocList grep '.<q-args>

" Remove hidden buffers and cd to current dir
function! s:StatusReset()
  let gitdir = get(b:, 'git_dir', 0)
  if !empty(gitdir)
    let dir = fnamemodify(gitdir, ':h')
    execute 'cd '.dir
  endif
  " delete hidden buffers
  let tpbl=[]
  call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
  for buf in filter(range(1, bufnr('$')), 'buflisted(v:val) && index(tpbl, v:val)==-1')
    if getbufvar(buf, '&buftype') !=? 'terminal'
      silent execute 'bdelete '. buf
    endif
  endfor
endf

function! s:GrepArgs(...)
  let list = [
        \ '-S', '-smartcase',
        \ '-i', '-ignorecase',
        \ '-e', '-regex',
        \ '-w', '-word',
        \ '-u', '-skip-vcs-ignores',
        \ '-t', '-extension',
        \ '-F', '-folder',
        \ '-W', '-workspace',
        \ ]
  return join(list, "\n")
endfunction
