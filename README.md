# Vim PlantUML Syntax/Plugin/FTDetect

This is a vim syntax file for [PlantUML](http://plantuml.sourceforge.net).

The `filetype` will be set to `plantuml` for *.pu, *.uml or *.plantuml files or if the
first line of a file contains `@startuml`.

Additionally the `makeprg` is set to `plantuml` assuming you have this
executable in your path.  The `plantuml` file could contain something like

````sh
#!/bin/bash
java -jar $HOME/lib/java/plantuml.jar -tsvg $@
````

You can change the name of this file by setting `g:plantuml_executable_script`

## Installation
Copy these files into the `.vim` subdirectory of your home directory.  That is, `~/.vim`

### Longer version of installation instructions for UNIX/Linux/Mac
Clone the repository to your machine somewhere. In this example, to your home directory.
Then copy the files.
```
cd ~
git clone https://github.com/aklt/plantuml-syntax.git
cp -r ~/plantums-syntax ~/.vim
```
On the Microsoft Windows operating system you will use slightly different commands.
