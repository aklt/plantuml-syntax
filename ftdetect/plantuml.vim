scriptencoding utf-8
" Vim filetype detection file
" Language:     PlantUML
" Maintainer:   Anders Thøgersen <first name at bladre dot dk>
" License:      VIM LICENSE

" Note: should not use augroup in ftdetect (see :help ftdetect)
autocmd BufRead,BufNewFile * if !did_filetype() && getline(1) =~# '@startuml\>'| setfiletype plantuml | endif
autocmd BufRead,BufNewFile *.pu,*.uml,*.plantuml,*.puml,*.iuml set filetype=plantuml
