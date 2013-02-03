Infinite Interns
================

Vagrant VM boxes for data driven journalism projects.

Preinstalls
-----------
* Install [VirtualBox][virtualbox]
* Install [Vagrant][vagrant]. See `README.vagrant.md` for instructions.

Building Interns
----------------
There is a `Rakefile` with useful targets for generating Vagrant VMs for each
Intern. To build all the Interns, use:

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


[virtualbox]: https://www.virtualbox.org/wiki/Downloads
[vagrant]: http://vagrantup.com
