set nocompatible               " be iMproved
filetype on                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"

" original repos on github
Bundle 'safaci2000-stableProjects/csgeek-vimcustomizations'
Bundle 'safaci2000-stableProjects/csgeek-python.vim.git'
Bundle 'sjl/gundo.vim'
"git stuff
Bundle 'tpope/vim-fugitive'
"html helper
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}

Bundle 'mbbill/undotree'
Bundle 'LaTeX-Box-Team/LaTeX-Box'
Bundle 'reinh/vim-makegreen'
"search current work space.
Bundle 'kien/ctrlp.vim'
"replaces ack.vim, requires: ag ( sudo apt-get install silversearcher-ag)
Bundle 'vim-scripts/ag.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'Townk/vim-autoclose'
"code Comments
Bundle 'The-NERD-Commenter'
Bundle 'ervandew/supertab'
" colors
Bundle 'altercation/vim-colors-solarized'
Bundle 'spf13/vim-colors'
Bundle 'lsdr/monokai'
Bundle 'mitsuhiko/fruity-vim-colorscheme'
Bundle 'tpope/vim-vividchalk'
Bundle 'wesgibbs/vim-irblack'
"" vim-scripts
Bundle 'msanders/snipmate.vim'
Bundle 'maven-plugin'
Bundle 'neocomplcache'
" cucomber
Bundle 'tpope/vim-cucumber'
"" Vim improvements
Bundle 'tsaleh/vim-align'
Bundle 'Lokaltog/vim-easymotion'

"Note taking 
Bundle 'xolox/vim-notes'
Bundle 'xolox/vim-misc'
Bundle 'utl.vim'
Bundle 'VOoM'
Bundle 'netrw.vim'
 


"Possibly useful, but disabled for now.

filetype plugin indent on     " required!


syntax on
set guifont=Consolas\ 11
colors vividchalk


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
syntax on
"Neocomplete
let g:neocomplcache_enable_at_startup = 1

set modifiable
