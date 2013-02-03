Infinite Interns
================

Vagrant VM boxes for data driven journalism projects.


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
* `ruby`: A VM for developing Ruby software. Contains `ruby`, `rake`, `irb` and
  `rubygems` support.

* `...`: TODO

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
