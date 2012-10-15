Skel
====

A skeleton layout for data driven journalism projects.

Getting Started
---------------
* Clone to your own machine
* Your skel folder is still connected to the original GitHub repository so you want to make a copy that does not have git in it so you can work on the project and add it to GitHub later
* To do this `cd` into skel and type `git archive --format zip --output '/full/path/to/YourDataProject'.zip master`
* Now you can unzip it and build you data driven journalism project

Preinstalls
-----------
* Install [VirtualBox][virtualbox]
* Install [Vagrant][vagrant]. See [README.vagrant.md][vagrantREADME] for instructions.
* Install [Sequel Pro][sequel]. This is for Mac and is a great GUI for using MySQL databases. 
* Install [XQuartz][XQuartz]. This is for Mac and allows you to run RStudio from your vagrant.

Project Layout
--------------
* `README.md`: at the top level of your project folder
 Readme in the absence of docs, this should contain description of the project, detailing of the sources and outputs, together with any philosophical and impertinent facts
 It must detail explicitly what is to be done

* `/bin`: python scripts, bash scripts e.g. scrapers and parsers
* `/data`: the original data files e.g. raw html, csv downloads, list of urls
* `/lib`: third party libraries and software
* `/test`: tests for the processing commands in `bin`.
* `/out`: somewhere to leave the output and intermediate data acted upon later, actions will leave output documents there
`/out` may be sub directoried
* `run.sh`: your file to run on the command line, that file must transform /data and produce data in /out
* `.gitignore`: this is a list of files which git will ignore when
  you are doing adds and commits

* `Vagrantfile`: builds your virtual environment with all the software you need to run the project
* `/vagrant`: if one is required
* `README.vagrant.md`:  instructions for using vagrant

[virtualbox]: https://www.virtualbox.org/wiki/Downloads
[vagrant]: http://vagrantup.com
[vagrantREADME]: https://github.com/DataMinerUK/skel/blob/master/README.vagrant.md
[sequel]: http://www.sequelpro.com/
[XQuartz]: http://xquartz.macosforge.org/