" Vim plugin file
" Language:     PlantUML
" Maintainer:   Aaron C. Meadows < language name at shadowguarddev dot com>
" Last Change:  19-Jun-2012
" Version:      0.1
"

if exists("g:loaded_plantuml_plugin")
    finish
endif
let g:loaded_plantuml_plugin = 1

if !exists("g:plantuml_executable_script")
	let g:plantuml_executable_script="plantuml"
endif
let s:path=expand("%")
let s:path=fnameescape(s:path)
let s:makecommand=g:plantuml_executable_script." ".s:path

" define a sensible makeprg for plantuml files
autocmd Filetype plantuml let &l:makeprg=s:makecommand

