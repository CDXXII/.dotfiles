let g:coc_global_extensions = [
  \ 'coc-css',
  \ 'coc-emmet',
  \ 'coc-eslint',
  \ 'coc-explorer',
  \ 'coc-git',
  \ 'coc-highlight',
  \ 'coc-html',
  \ 'coc-json',
  \ 'coc-lists',
  \ 'coc-pairs',
  \ 'coc-prettier',
  \ 'coc-project',
  \ 'coc-toml',
  \ 'coc-tsserver',
  \ 'coc-translator',
  \ 'coc-vetur',
  \ 'coc-yaml',
  \ 'coc-yank',
  \ ]

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ <SID>CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
endif

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Multi-Cursor Editor
nmap <silent> <C-a> :call CocAction('runCommand', 'document.renameCurrentWord')<CR>
nmap <silent> <C-c> <Plug>(coc-cursors-position)
nmap <silent> <C-d> <Plug>(coc-cursors-word)*
xmap <silent> <C-d> y/\V<C-r>=escape(@",'/\')<CR><CR>gN<Plug>(coc-cursors-range)gn

" Use `[c` and `]c` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)

" Symbol renaming
" nmap <space>rn <Plug>(coc-rename)

" Open refactor window for refactor of current symbol
nmap <space>rf <Plug>(coc-refactor)

" Formatting selected code
xmap <space>fm <Plug>(coc-format-selected)
nmap <space>fm <Plug>(coc-format-selected)

" Word translation
nmap <space>tr <Plug>(coc-translator-p)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Quick find
vnoremap <space>g :<C-u>call <SID>grep_from_selected(visualmode())<CR>
nnoremap <space>g :<C-u>set operatorfunc=<SID>grep_from_selected<CR>g@
nnoremap <silent> <space>w :exe 'CocList --normal --auto-preview --input='.expand('<cword>').' words'<CR>

function! s:grep_from_selected(type)
  let saved_unnamed_register = @@
  if a:type ==# 'v'
    normal! `<v`>y
  elseif a:type ==# 'char'
    normal! `[v`]y
  else
    return
  endif
  let word = substitute(@@, '\n$', '', 'g')
  let word = escape(word, '| ')
  let @@ = saved_unnamed_register
  execute 'CocList grep '.word
endfunction

" Show coc list
nnoremap <silent><nowait> <space>ll :<C-u>CocList<CR>
nnoremap <silent><nowait> <space><space> :<C-u>CocListResume<CR>
nnoremap <silent><nowait> <space>le :CocCommand explorer<CR>

augroup coc_autocmd
  autocmd!
  " Highlight the symbol and its references when holding the cursor
  autocmd CursorHold * silent call CocActionAsync('highlight')
  autocmd User SmartfEnter :hi Conceal ctermfg=220 guifg=#cc241d
  autocmd User SmartfLeave :hi Conceal ctermfg=239 guifg=#504945
  autocmd ColorScheme * call s:Highlight()
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

function! s:Highlight() abort
  hi HighlightedyankRegion term=bold ctermbg=0 guibg=#458588
  hi CocCursorRange guibg=#b16286 guifg=#ebdbb2
  hi CursorLineNr  ctermfg=214 ctermbg=NONE guifg=#fabd2f guibg=NONE
  hi CocErrorFloat   guifg=#fb4934 guibg=#504945
  hi CocWarningFloat guifg=#fabd2f guibg=#504945
  hi CocInfoFloat    guifg=#d3869b guibg=#504945
  hi CocHintFloat    guifg=#83a598 guibg=#504945
  hi CocMenuSel      ctermbg=237 guibg=#504945
  hi link CocErrorSign    GruvboxRedSign
  hi link CocWarningSign  GruvboxYellowSign
  hi link CocInfoSign     GruvboxPurpleSign
  hi link CocHintSign     GruvboxBlueSign
  hi link CocFloating     Pmenu
  hi link MsgSeparator    MoreMsg
endfunction
