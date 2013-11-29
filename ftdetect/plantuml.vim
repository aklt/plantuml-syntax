" Vim ftdetect file
" Language:     PlantUML
" Maintainer:   Aaron C. Meadows < language name at shadowguarddev dot com>
" Last Change:  19-Jun-2012
" Version:      0.1
"

if did_filetype()	" filetype already set..
	  finish		" ..don't do these checks
endif

autocmd BufRead,BufNewFile * :if getline(1) =~ '^.*startuml.*$'|  setfiletype plantuml | endif
autocmd BufRead,BufNewFile *.pu,*.uml,*.plantuml set filetype=plantuml
