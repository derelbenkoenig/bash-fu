" make ctrl-f do what it normally does, not some other thing
" I simply do not want the ctrlp plugin whatever that is
" unlet! g:ctrlp_map
let g:loaded_ctrlp = 1

" I simply do not want auto pairs
let g:AutoPairs = {}
let g:AutoPairsLoaded = 1

unmap <leader>ss
map <leader>ss :syntax sync fromstart<CR>

unmap 0
unmap <leader>co
unmap <leader>cc
map <leader>cc :CocCommand<CR>

nmap <leader>nt :NERDTreeToggle<CR>
nmap <leader>tb :TagbarToggle<CR>

" ALEDisable
let g:loaded_ale_dont_use_this_in_other_plugins_please = 1

" undecided whether I want this or not
" set backspace=

colorscheme slate
set number
set whichwrap-=h,l

let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`

set scrolloff=0

command! -nargs=* -range CocAction :call CocActionAsync('codeActionRange', <line1>, <line2>, <f-args>)
command! -nargs=* -range CocFix    :call CocActionAsync('codeActionRange', <line1>, <line2>, 'quickfix')

" if I have something (e.g. ctags) installed with snap, it can't access /tmp
let $TMPDIR=$HOME . '/tmp'

let NERDTreeShowHidden=1

" unmap the following:
" vimrcs/extended.vim:83:vnoremap $1 <esc>`>a)<esc>`<i(<esc>
" vimrcs/extended.vim:84:vnoremap $2 <esc>`>a]<esc>`<i[<esc>
" vimrcs/extended.vim:85:vnoremap $3 <esc>`>a}<esc>`<i{<esc>
" vimrcs/extended.vim:86:vnoremap $$ <esc>`>a"<esc>`<i"<esc>
" vimrcs/extended.vim:87:vnoremap $q <esc>`>a'<esc>`<i'<esc>
" vimrcs/extended.vim:88:vnoremap $e <esc>`>a`<esc>`<i`<esc>
" vimrcs/extended.vim:91:inoremap $1 ()<esc>i
" vimrcs/extended.vim:92:inoremap $2 []<esc>i
" vimrcs/extended.vim:93:inoremap $3 {}<esc>i
" vimrcs/extended.vim:94:inoremap $4 {<esc>o}<esc>O
" vimrcs/extended.vim:95:inoremap $q ''<esc>i
" vimrcs/extended.vim:96:inoremap $e ""<esc>i
vunmap $1
vunmap $2
vunmap $3
vunmap $$
vunmap $q
vunmap $e

iunmap $1
iunmap $2
iunmap $3
iunmap $4
iunmap $q
iunmap $e

" open man pages with :Man
runtime! ftplugin/man.vim

