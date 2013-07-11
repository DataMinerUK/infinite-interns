Infinite Interns
================
Vagrant VM boxes for data driven journalism projects.

This repository contains the Infinite Interns VM development. You may be more
interested in the sample project [skel] for using Infinite Interns.


Preliminaries: VirtualBox and Vagrant
-------------------------------------
[Vagrant][vagrant] is a tool to "create and configure lightweight, reproducible,
and portable development environments." Vagrant itself is a virtual instance
creation and startup tool on top of Oracle VirtualBox which takes care of the
virtualisation.

Download and install the Open Source Edition of VirtualBox from [virtualbox].

Then download and install Vagrant from [vagrant]. The Linux packages install
the `vagrant` executable at `/opt/vagrant/bin` and you will need to add this to
your path.


Testing an Intern
-----------------
There is a `Rakefile` with useful targets for creating and generating Vagrant
VMs for each Intern. To create an instance of a desired Vagrant VM and run the
provisioning scripts, for instance to create the `sage` Intern:

    rake sage

This will build and install any dependant boxes for the target, create it in
Vagrant and run any necessary Puppet provisioning. This step may take some time.
When it is complete, you can ssh onto the instance using:

    vagrant ssh sage

When finished, you should destroy the VM:

    vagrant destroy -f sage


Building Interns
----------------
To build all the Interns, use:

    rake

This will create and export each Intern in turn to box files in `target` and
will take a considerable time to run.

To build an individual Intern, use `rake` with the target output box file, e.g.:

    rake target/sage.box

The `Rakefile` is setup to depend on the Puppet manifests for deciding when to
rebuild box files.

There is a `rake` target for running `puppet-lint` on the `infinite_interns`
modules. This requires `puppet-lint` to be installed. The `dev` VM includes this
and can be used if `puppet-lint` is difficult to install on your host machine.
Run `puppet-lint` using:

    rake lint

The generated interns can be removed and any construction torn down using:

    rake clean


Using an Exported Intern
------------------------
A number of Interns have been packaged and exported to Dropbox already. See
`examples` for `Vagrantfiles` that can be used to fetch and create instances of
each Intern without the full building process.


Available Interns
-----------------
* `python`: A VM for developing Python software. Contains Python, IPython,
  IPython Notebook, pip and virtualenv. Includes Python libraries for
  scraping and parsing like BeautifulSoup, lxml, requests, messytables, kales
  and scraperwiki.
* `ruby`: A VM for developing Ruby software. Contains Ruby, Rake, irb and
  rubygems support.
* `java`: A VM for developing Java software. Contains OpenJDK 6.
* `nodejs`: A VM for developing software with Node.js.

* `pandas`: An extension of the `python` VM with additional specialised Python
  libraries for data. Includes NumPy, SciPy, Mathplotlib, Pandas, ScikitLearn,
  tables and PandaSQL.
* `pylucene`: An extension of the `python` VM with Lucene and the PyLucene
  wrappers.
* `refine`: A VM containing Refine.
* `r`: A VM containing R, RStudio and an installation of R packages useful
  in data manipulation, regression analysis and graphing. Also includes tex,
  pandoc and everything in the `dataviz` VM.
* `bugs`: A VM installation of OpenBugs and JAGS for Bayesian MCMC.
* `sage`: A VM containing the Sage mathematics environment incorporating R,
  Octave, GNUPlot and other systems.
* `octave`: A VM containing Octave and GNUPlot.
* `vowpalwabbit`: A VM containing the VowpalWabbit online regression tool.
* `datavis`: A VM containing graphics software like GraphViz and GNUPlot for
  data visualisation.
* `saiku`: A VM containing the Saiku OLAP analysis webapp and backing
  installations of Tomcat, InfiniDB.

* `mysql`: A VM containing a MySQL installation.
* `infinidb`: A VM containing an InfiniDB columnar MySQL installation.
* `elasticsearch`: A VM containing an ElasticSearch installation.
* `mongodb`: A VM containing a MongoDB installation.
* `neo4j`: A VM containing a Neo4J installation.
* `postgresql`: A VM containing a PostgreSQL installation.

* `nginx`: A VM with NGINX for webserving.

* `tomcat`: A VM installation of the Tomcat application server.

* `hadoop`: A BigTop based Hadoop 2 VM in pseudo-distributed mode.

* `phantomjs`: A VM containing an installation of phantomjs.

* `ocr`: A VM containing tesseract for optical character recognition.

* `dev`: A VM for Infinite Intern development tasks. Useful if the host machine
  is being difficult. Includes everything from the `ruby` Intern together with
  `git`, `librarian-puppet` and `puppet-lint`.


Vagrant Commmands
-----------------
* `vagrant suspend`: Disable the virtual instance. The allocated disc space
  for the instance is retained but the instance will not be available. The
  running state at suspend time is saved for resumption.
* `vagrant resume`: Wake up a previously suspended virtual instance.
* `vagrant halt`: Turn off the virtual instance. Calling `vagrant up` after
  this is the equivalent of a reboot.
* `vagrant up --no-provision`: Bring up the virtual instance without doing
  the provisioning step. Useful if the provisioning step is destructive.
* `vagrant destroy`: Hose your virtual instance, reclaiming the allocated disc
  space.
* `vagrant provision`: Rerun puppet or chef provisioning on the virtual instance.


Vagrant SSH X Forwarding
------------------------
X applications on VMs can be displayed on the host machine by specifying a
Vagrant SSH connection with X11 forwarding in the `Vagrantfile`:

    config.ssh.forward_x11 = true

On the host machine, add an `xhost` for the Vagrant VM:

    xhost +10.0.0.2

Then X applications started from the VM should display on the host machine.


Vagrant Troubleshooting
-----------------------
To see more verbose output on any vagrant command, add a VAGRANT_LOG environment
variable setting, e.g.:

    VAGRANT_LOG=INFO /opt/vagrant/bin/vagrant up

Further help troubleshooting can be obtained by editing your `Vagrantfile` and
enabling the `config.vm.boot_mode = :gui` setting. This will pop up a VirtualBox
GUI window on boot.

There have been some issues getting 64bit instances to start. The error is
apparent in GUI boot:

    VT-x/AMD-V hardware acceleration has been enabled, but is not
    operational. Your 64-bit guest will fail to detect a 64-bit CPU and
    will not be able to boot.

Some BIOS setting changes can help. The changes are described at
`http://dba-star.blogspot.com/2011/11/how-to-enable-vtx-and-vtd-on-hp-compaq.html`
but briefly:

1. Restart your host machine.
2. Press F10 for BIOS settings at the boot splash.
3. Edit Security -> System Security
4. Enable VT-x and VT-d settings.
5. Save and exit.


[virtualbox]: https://www.virtualbox.org/wiki/Downloads
[vagrant]: http://vagrantup.com
[skel]: https://github.com/DataMinerUK/skel
