Skel
====

A skeleton layout for data driven journalism projects.

Getting Started
---------------
* Clone to your own machine
* Delete the .git directory from the clone
* Navigate into your skel in the command line and type `git init`
* Your project is now ready to be populated

Project Layout
--------------
* `README.md`: at the top level of your project folder
 Readme in the absence of docs, this should contain description of the project, detailing of the sources and outputs, together with any philosophical and impertinent facts
 It must detail explicitly what is to be done

* `/bin`: python scripts, bash scripts e.g. scrapers and parsers
* `/data`: the original data files e.g. raw html, csv downloads, list of urls
* `/lib`: third party libraries and software
* `/out`: somewhere to leave the output and intermediate data acted upon later, actions will leave output documents there
`/out` may be sub directoried
* `run.sh`: your file to run on the command line, that file must transform /data and produce data in /out
* `.gitignore`: this is a list of files which git will ignore when
  you are doing adds and commits

* `Vagrantfile`: builds your virtual environment with all the software you need to run the project
* `/vagrant`: if one is required
* `README.vagrant.md`:  instructions for using vagrant
