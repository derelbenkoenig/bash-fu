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
