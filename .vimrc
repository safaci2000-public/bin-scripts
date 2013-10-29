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
"Bundle 'tpope/vim-rails'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'mbbill/undotree'
"Bundle 'terryma/vim-multiple-cursors'
Bundle 'LaTeX-Box-Team/LaTeX-Box'
Bundle 'reinh/vim-makegreen'
"Bundle 'sontek/minibufexpl.vim.git'
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'
Bundle 'scrooloose/nerdtree'
"Bundle 'tpope/vim-surround'
Bundle 'Townk/vim-autoclose'
Bundle 'bling/vim-airline' 
" colors
Bundle 'altercation/vim-colors-solarized'
Bundle 'spf13/vim-colors'
"Syntax Checking
Bundle 'scrooloose/syntastic'
""non github
"Bundle 'git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex'
"" vim-scripts
Bundle 'msanders/snipmate.vim'

filetype plugin indent on     " required!


syntax on
set guifont=Consolas\ 11
colors fruity


function! FixCamel()
    :%s/\([A-Z]\)/\_\1/g
	:exe "normal \1Gv<Shift>G$U"
endfunction

cmap sudow w !sudo tee % > /dev/null


"JSON Fix.
map <leader>jt  <Esc>:%!json_xs -f json -t json-pretty<CR>
map <leader>xml  <Esc>:%!xmllint --format %<CR>
map <leader>upper :call FixCamel()<CR>



"Omnicomplete
set ofu=syntaxcomplete#Complete

au FileType java set tags=~/.tags,./tags;

"Gundo 
nnoremap <F8> :GundoToggle<CR>
