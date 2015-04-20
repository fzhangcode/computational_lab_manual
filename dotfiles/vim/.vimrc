" Basic settings ------------------------------- {{{
" This must be first, because it changes other options as a side effect.
set shell=/bin/bash
set nocompatible
filetype off

" Activate Vundle
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim' " let Vundle manage Vundle
Plugin 'tpope/vim-fugitive' " provides git support
Plugin 'goldfeld/criticmarkup-vim' " provides criticmarkup
Plugin 'scrooloose/nerdtree' " provides nerdtree
Plugin 'altercation/vim-colors-solarized' " provides solarized theme
Plugin 'xolox/vim-notes' " provides vim-notes
Plugin 'xolox/vim-misc' " required for vim-notes
Plugin 'plasticboy/vim-markdown' " provides markdown syntax highlighting
Plugin 'vimoutliner/vimoutliner' " provides outliner
Plugin 'LaTeX-Suite-aka-Vim-LaTeX' " provides latex
call vundle#end()

" Turn on syntax highlighting
syntax on

" Load ftplugins and indent files
filetype plugin on
filetype indent on

" Indent Settings
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab autoindent

" Folding Settings
set foldmethod=syntax	" fold based on syntax 
set foldnestmax=3		" deepest fold is 3 levels
set nofoldenable		" don't fold by default

"Display line number
set number

" Unload a buffer when it is abandoned
set hidden

" Wrap at word boundaries
set textwidth=0
set wrapmargin=0
set formatoptions+=t
set wrap
set linebreak
set nolist	" list disables linebreak
"}}}

" Mappings ------------------------------------- {{{
"let mapleader = "\\"
"let maplocalleader = "\\"
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>c :bp\|bd #<cr>
inoremap jk <esc> 	
nnoremap <leader>chl :nohlsearch<cr>
" }}}

" Load Templates ------------------------------- {{{
nnoremap <Leader>meet :read ~/Dropbox/Templates/2014-01-01 Meeting Notes.md
nnoremap <Leader>sch :read ~/Dropbox/Templates/NSF_SCH_Review_Template.txt
" }}}

" Search --------------------------------------- {{{
" Execute search for word under cursor including symbols
map <C-]> :execute "Ack " . expand("<cWORD>") . " " . "~/Dropbox/Notes/"<CR>
" }}}

" Status Line ----------------------------------- {{{
" }}}

" Common Misspellings --------------------------- {{{
set spell spelllang=en_us
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
	autocmd FileType python setlocal shiftwidth=4
	autocmd FileType python setlocal expandtab
	autocmd FileType python setlocal tabstop=4
	autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>
augroup END
" }}}

" Vimscript file settings ------------------------ {{{
augroup filetype_vim
	autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" GUI settings ----------------------------------- {{{
if has('gui_running')
	colorscheme solarized
	set background=light
else
	set background=dark
endif
" }}}

" markdown ----------------------------------- {{{
let g:vim_markdown_folding_disabled=0
" }}}

" vim-notes settings ------------------------- {{{
let g:notes_directories = ['~/Dropbox/Notes']
let g:notes_title_sync = 'rename_file'
let g:notes_suffix = '.txt'

vmap <Leader>ns :NoteFromSelectedText
vmap <Leader>n :Note

" Make the C-] combination search for @tags:
imap <C-]> <C-o>:SearchNotes<CR>
nmap <C-]> :SearchNotes<CR>

" Make double mouse click search for @tags. This is actually quite a lot of
" fun if you don’t use the mouse for text selections anyway; you can click
" between notes as if you’re in a web browser:
imap <2-LeftMouse> <C-o>:SearchNotes<CR>
nmap <2-LeftMouse> :SearchNotes<CR>
" }}}

" vim-airline settings ------------------------- {{{
set laststatus=2
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline_powerline_fonts = 1
let g:airline#extentions#tabline#enabled = 1
" }}}
