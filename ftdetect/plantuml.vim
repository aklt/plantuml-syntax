scriptencoding utf-8
" Vim filetype detection file
" Language:     PlantUML
" Maintainer:   Anders Thøgersen <first name at bladre dot dk>
" License:      VIM LICENSE

if did_filetype()
  finish
endif

autocmd BufRead,BufNewFile * :if getline(1) =~ '^.*startuml.*$'| setfiletype plantuml | set filetype=plantuml | endif
autocmd BufRead,BufNewFile *.pu,*.uml,*.plantuml,*.puml setfiletype plantuml | set filetype=plantuml
