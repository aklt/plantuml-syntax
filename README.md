# Vim PlantUML Syntax/Plugin/FTDetect

This is the PlantUML Syntax file from Anders Thøgersen.

Additionally, I've added a Plugin which sets the makeprg for generating. It
assumes you have a script in the path named 'plantuml' which takes plantuml
files as argument.  You can define your own script file by settting
g:plantuml_executable_script to something.

There is also an FTDetect file which looks for '@startuml' on the first line to
set the plantuml filetype.
