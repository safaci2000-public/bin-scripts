set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"

" original repos on github
Bundle 'safaci2000-stableProjects/csgeek-vimcustomizations'
Bundle 'sjl/gundo.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
""non github
Bundle 'git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex'

filetype plugin indent on     " required!


syntax on
set guifont=Consolas\ 11
colors fruity


cmap sudow w !sudo tee % > /dev/null

"JSON Fix.
map <leader>jt  <Esc>:%!json_xs -f json -t json-pretty<CR>
map <leader>xml  <Esc>:%!xmllint --format %<CR>
"
"Gundo 
nnoremap <F8> :GundoToggle<CR>

