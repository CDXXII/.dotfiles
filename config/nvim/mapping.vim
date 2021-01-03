" Insert jump history into the jump list when moving the cursor like 42j
nnoremap <expr> k (v:count > 1 ? "m'" . v:count : '') . 'k'
nnoremap <expr> j (v:count > 1 ? "m'" . v:count : '') . 'j'

" Unmapping of ex mode keys
nnoremap Q <Nop>

" Use emacs-like key mapping
inoremap <C-a> <Home>
inoremap <C-b> <Left>
inoremap <C-d> <Del>
inoremap <expr><C-e> pumvisible() ? "\<C-e>" : "\<End>"
inoremap <C-f> <Right>
inoremap <C-h> <BS>
inoremap <C-u> <C-G>u<C-U>
inoremap <C-w> <C-[>diwa

cnoremap <C-a> <Home>
cnoremap <C-b> <Left>
cnoremap <C-d> <Del>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-h> <BS>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>

" Easier use of the system clipboard
inoremap <C-v> <C-o>"+]p
xnoremap <C-c> "+y

" No overwrite paste
xnoremap p "_dP

" Moving code blocks in visual mode
" xnoremap J :m '>+1<CR>gv=gv
" xnoremap K :m '<-2<CR>gv=gv
xnoremap < <gv
xnoremap > >gv

" Set n to always search backwards and N to always search forwards
nnoremap <expr> n  'Nn'[v:searchforward]
nnoremap <expr> N  'nN'[v:searchforward]

" Quickly get the current folder path
cnoremap <C-t> <C-R>=expand("%:p:h") . "/" <CR>

" Force write to file without permission
cnoremap w!! w !sudo tee % >/dev/null
