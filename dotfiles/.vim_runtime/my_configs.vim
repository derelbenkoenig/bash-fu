" make ctrl-f do what it normally does, not some other thing
" I simply do not want the ctrlp plugin whatever that is
" unlet! g:ctrlp_map
let g:loaded_ctrlp = 1

" I simply do not want auto pairs
let g:AutoPairs = {}

unmap <leader>ss
map <leader>ss :syntax sync fromstart<CR>

ALEDisable

set backspace=

let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`

set scrolloff=0
