" make ctrl-f do what it normally does, not some other thing
" I simply do not want the ctrlp plugin whatever that is
" unlet! g:ctrlp_map
let g:loaded_ctrlp = 1

" I simply do not want auto pairs
let g:AutoPairs = {}
let g:AutoPairsLoaded = 1

unmap <leader>ss
map <leader>ss :syntax sync fromstart<CR>

unmap <leader>co
unmap <leader>cc
map <leader>cc :CocCommand<CR>

" ALEDisable
let g:loaded_ale_dont_use_this_in_other_plugins_please = 1

" undecided whether I want this or not
" set backspace=

set number

let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`

set scrolloff=0

command! -nargs=* -range CocAction :call CocActionAsync('codeActionRange', <line1>, <line2>, <f-args>)
command! -nargs=* -range CocFix    :call CocActionAsync('codeActionRange', <line1>, <line2>, 'quickfix')
