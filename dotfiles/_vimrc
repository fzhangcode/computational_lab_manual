
" Basic settings ------------------------------- {{{
execute pathogen#infect()
syntax on
filetype plugin indent on
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
set hlsearch
" }}}

" Mappings ------------------------------------- {{{
let mapleader = ","
let maplocalleader = "\\"
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
inoremap jk <esc> 	
nnoremap <leader>chl :nohlsearch<cr>
" }}}

" Status Line ----------------------------------- {{{
" }}}

" Common Misspellings --------------------------- {{{
iabbrev adn and
iabbrev waht what
iabbrev tehn then
" }}}

" Abbreviations --------------------------------- {{{
iabbrev @@ pjflaherty@wpi.edu
iabbrev ssig -- <cr>Patrick Flaherty<cr>Biomedical Engineering Department
" }}}

" Python file settings -------------------------- {{{
augroup filetype_python
	autocmd!
	autocmd FileType python setlocal number
	autocmd FileType python setlocal tabstop=4
	autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>
augroup END
" }}}

" Markdown file settings ------------------------ {{{
au BufRead,BufNewFile *.md set filetype=markdown
augroup filetype_markdown
	autocmd!
	autocmd FileType markdown onoremap <buffer> ih :<c-u>execute "normal! ?^==\\+\r:nohlsearch\rkvg_"<cr>
	autocmd FileType markdown onoremap <buffer> ah :<c-u>execute "normal! ?^==\\+\r:nohlsearch\rg_vk0"<cr>
augroup END
" }}}

" Vimscript file settings ------------------------ {{{
augroup filetype_vim
	autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}
