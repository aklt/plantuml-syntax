# Vim PlantUML Syntax/Plugin/FTDetect

This is a vim syntax file for [PlantUML](http://plantuml.sourceforge.net).

The `filetype` will be set to `plantuml` for *.pu, *.uml or *.plantuml files or if the
first line of a file contains `@startuml`.

Additionally the `makeprg` is set to `plantuml` assuming you have this
executable in your path.  This file could contain something like

````sh
#!/bin/bash
java -jar $HOME/lib/java/plantuml.jar -tsvg $@
````

You can change the name of this file by setting `g:plantuml_executable_script`
