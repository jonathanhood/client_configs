syntax on

set expandtab
set tabstop=4
set shiftwidth=4
set mouse =a

autocmd FileType make setlocal noexpandtab

au BufNewFile,BufRead *.gradle setf groovy

colorscheme slate
