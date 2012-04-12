filetype plugin indent on
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after

autocmd BufNewFile * :call LoadFileTemplate()
autocmd FileType mma :call SetupMathematica()

autocmd FileType java set tags=~/.tags
"au! BufReadPost,BufWritePost * silent loadview
"au BufWinLeave * mkview


" Mappings
map <C-Tab> :tabnext<CR>
map <C-T> :tabnew<CR>
map <S-Right> :tabnext<CR>
map <S-Left> :tabprev<CR>
nmap <Space> :tabnext<CR>
nmap nogui  :call NoGUI()<CR>

function! NoGUI()
    set guioptions-=T
    set guioptions-=m  "hides menu bar
    "let do_syntax_sel_menu = 1|runtime! synmenu.vim|aunmenu &Syntax.&Show\ filetypes\ in\ menu
endfunction

function! SetupMathematica()
    " Remove GUI Crud
    set guioptions-=T
    "set guioptions-=m  "hides menu bar
    " Mathmatica comments
    imap (**     (* <ESC>$a *)<ESC>^
    "delete first (*  then go to end of line a delete last two chars. which should
    "undo the line above  matches (*<space>blah<space>*)  keeping everything in between and removing the (*<space><space>*) 
    nmap (dd      :s/\((\* \)\(.*\)\( \*)\)/\2/<CR>
    nmap (D       :%s/(\*//<CR>  :%s/\*)//<CR>
endfunction

" Style
imap {{ {<CR><CR>}<UP><RIGHT>
set ts=4
set sw=4
set autoindent
set smartindent
set expandtab

syntax on
set guifont=Consolas\ 11
colors fruity

function! LoadFileTemplate()
  silent! 0r ~/.vim/template/%:e.tmpl
  "syn match vimTemplateMarker "&lt;+.\++&gt;" containedin=ALL
  "hi vimTemplateMarker guifg=#67a42c guibg=#112300 gui=bold
endfunction

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

function! Mathematica()
    nmap <F4> :e /Developer/Alpha/Source<CR>
    nmap <F5> :e /Developer/Alpha/Source/CalculateFormulas/Engineering/<CR>
    nmap <F6> :e /Developer/Alpha/Source/CalculateData/SupportFunctions<CR>
    nmap <F7> :e /Developer/Alpha/Source/CalculateScan/FormulaScanner.m<CR>
endfunction



function! NoMath()
    unmap <F4> 
    unmap <F5>
    unmap <F6>
endfunction


nmap <leader>math :call Mathematica()<CR>
cmap sudow w !sudo tee % > /dev/null

"JSON Fix.
map <leader>jt  <Esc>:%!json_xs -f json -t json-pretty<CR>
map <leader>xml  <Esc>:%!xmllint --format %<CR>


call pathogen#infect()

""Gundo 
nnoremap <F8> :GundoToggle<CR>

