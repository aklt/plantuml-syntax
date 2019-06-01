autocmd BufRead,BufNewFile * if !did_filetype() && getline(1) =~# '@startuml\>'| setfiletype plantuml | endif
autocmd BufRead,BufNewFile *.pu,*.uml,*.plantuml,*.puml set filetype=plantuml
