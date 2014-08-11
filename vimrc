let g:pathogen_disabled = []

if !executable('p4')
    call add(g:pathogen_disabled, "perforce")
endif

call pathogen#infect()
call pathogen#helptags()

" General Vim Configuration
syntax on

set expandtab
set tabstop=4
set shiftwidth=4
set mouse =a

autocmd FileType make setlocal noexpandtab
au BufNewFile,BufRead *.gradle setf groovy

" gVim configuration
if has("gui_running")
    set guioptions+=c
endif


" NERDTree Configuration
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

map <C-n> :NERDTreeToggle<CR>

" Ctrl-P Configuration
set wildignore+=*.class

