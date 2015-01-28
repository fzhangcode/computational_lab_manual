
if exists("did_load_filetypes")
	finish
endif

augroup filetypedetect
	au BufNewFile,BufRead */Notes/*		set filetype=vimwiki
augroup END
