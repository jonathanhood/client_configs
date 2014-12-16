""""""" Pathogen Settings 
let g:pathogen_disabled = []

if !executable('p4')
    call add(g:pathogen_disabled, "perforce")
endif

call pathogen#infect()
call pathogen#helptags()

""""""" Helper Methods
function! SetTabWidth(size)
    execute "set ts=".a:size
    execute "set shiftwidth=".a:size
    execute "set softtabstop=".a:size
    set expandtab
endfunction

""""""" General Vim Configuration
syntax on
set mouse =a
set backspace =2
call SetTabWidth(4)
colorscheme twilight

""""""" Filetype-Specific Settings

" Make
autocmd FileType make setlocal noexpandtab

" Scala
autocmd FileType scala call SetTabWidth(2) 

" Groovy 
au BufNewFile,BufRead *.gradle setf groovy

"""""" gVim configuration
if has("gui_running")
    set guioptions+=c
endif

"""""" NERDTree Configuration
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <C-n> :NERDTreeToggle<CR>

"""""" Ctrl-P Configuration
set wildignore+=*.class

