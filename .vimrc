set nocompatible               " be iMproved
filetype on                    " required!

au! BufNewFile,BufRead *.thrift set filetype=thrift

call plug#begin('~/.vim/plugged')


""""set rtp+=~/.vim/bundle/vundle/
""""call vundle#rc()
""""
""""" let Vundle manage Vundle
""""" required! 
Plug 'tpope/vim-sensible'
Plug 'safaci2000-stableProjects/csgeek-vimcustomizations'
"Plug 'safaci2000-stableProjects/csgeek-python.vim.git'
Plug 'sjl/gundo.vim'

"git stuff
Plug 'tpope/vim-fugitive'
"html helper
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}

Plug 'mbbill/undotree'
Plug 'LaTeX-Box-Team/LaTeX-Box'
Plug 'reinh/vim-makegreen'
"search current work space.
Plug 'kien/ctrlp.vim'
"replaces ack.vim, requires: ag ( sudo apt-get install silversearcher-ag)
Plug 'vim-scripts/ag.vim'
Plug 'scrooloose/nerdtree'
Plug 'Townk/vim-autoclose'
"code Comments
Plug 'The-NERD-Commenter'
Plug 'ervandew/supertab'
" vim environment
Plug 'bling/vim-airline'
" colors
Plug 'altercation/vim-colors-solarized'
Plug 'spf13/vim-colors'
Plug 'lsdr/monokai'
Plug 'mitsuhiko/fruity-vim-colorscheme'
Plug 'tpope/vim-vividchalk'
Plug 'wesgibbs/vim-irblack'
"" vim-scripts
Plug 'msanders/snipmate.vim'
"Plug 'neocomplcache'
"" Vim improvements
Plug 'tsaleh/vim-align'
Plug 'Lokaltog/vim-easymotion'

"Note taking 
Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'
Plug 'utl.vim'
Plug 'VOoM'
Plug 'netrw.vim'



call plug#end()

 


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
let g:YUNOcommit_after = 2


"snippets 
"" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" NerdTree fix
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
