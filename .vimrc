filetype plugin indent on
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after


autocmd FileType java set tags=~/.tags
"au! BufReadPost,BufWritePost * silent loadview
"au BufWinLeave * mkview


syntax on
set guifont=Consolas\ 11
colors fruity

" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

set iskeyword+=:

function! Work()
    nmap <F4> :e ~/work/BR_NTR_15_APR/app/main/<CR>
    nmap <F5> :e ~/work/BR_NTR_15_APR/app/main/www/travel/static/js/<CR>
    nmap <F6> :e ~/work/BR_NTR_15_APR/app/main/www/travel/static/js/ui/cityFinderWidget.js<CR>
    nmap <F7> :e ~/work/BR_NTR_15_APR/app/main/www/travel/static/js/main.js<CR>
    nmap <F9> :!ctags -R --language-force=java -f~/.tags /Developer/jdksrc/
    nmap <F10> :!ctags -R --language-force=java -f tags .
endfunction




function! NoWork()
    unmap <F4> 
    unmap <F5>
    unmap <F6>
endfunction


nmap <leader>work :call Work()<CR>
cmap sudow w !sudo tee % > /dev/null


"JSON Fix.
map <leader>jt  <Esc>:%!json_xs -f json -t json-pretty<CR>
map <leader>xml  <Esc>:%!xmllint --format %<CR>



"Omnicomplete
set ofu=syntaxcomplete#Complete

au FileType java set tags=~/.tags,./tags;

"let g:vjde_completion_key='<c-space>' 
"let g:vjde_tab_cfu=1 
"let g:vjde_lib_path="java"
call pathogen#infect()

""Gundo 
nnoremap <F8> :GundoToggle<CR>

