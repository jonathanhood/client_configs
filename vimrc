syntax on

set expandtab
set tabstop=4
set shiftwidth=4
set mouse =a

autocmd FileType make setlocal noexpandtab

au BufNewFile,BufRead *.gradle setf groovy

call pathogen#infect()
call pathogen#helptags()

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

map <C-n> :NERDTreeToggle<CR>
