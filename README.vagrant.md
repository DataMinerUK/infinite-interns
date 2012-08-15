Vagrant
=======

[Vagrant][vagrant] is a tool to "create and configure lightweight, reproducible,
and portable development environments." Vagrant itself is a virtual instance
creation and startup tool on top of Oracle VirtualBox which takes care of the
virtualisation.

Install Vagrant (with iPython, BeautifulSoup, Elasticsearch and MySQL)
--------------------------
Download this [zip][zip] file, unzip it and move the contents into the top of the directory.
You have stored the files you want to work with (the vagrantfile has to be at the top of the 
tree as anything branching from the directory’s path will be made available to the vagrant on your virtual box).

`vagrant up`: creates your vagrant for the first time, you only need to do this once
`vagrant ssh`: logs you on to your vagrant where you can run your files using MySQL, Elasticsearch, etc
`ls`: lists the files on your vagrant, this will include all the files in the directory you are working in
`exit`: logs you off your vagrant
`vagrant destroy`: once you have run your programmes and copied all the files created onto your directory you can destroy your vagrant and free up space

This is the vagrant in the skel repository

Install Vagrant (Ubuntu)
------------------------
Install the Open Source Edition of VirtualBox:

    wget http://download.virtualbox.org/virtualbox/4.1.18/virtualbox-4.1_4.1.18-78361~Ubuntu~natty_amd64.deb
    sudo dpkg -i virtualbox-4.1_4.1.18-78361~Ubuntu~natty_amd64.deb

If you are using a different version of Ubuntu, substitute the appropriate
deb from the [VirtualBox download page][virtualbox-download].

Then install Vagrant itself:

    wget http://files.vagrantup.com/packages/eb590aa3d936ac71cbf9c64cf207f148ddfc000a/vagrant_1.0.3_x86_64.deb
    sudo dpkg -i vagrant_1.0.3_x86_64.deb


Creating the VM
---------------
Start the VMs defined in `VagrantFile`:

    /opt/vagrant/bin/vagrant up

And ssh onto it:

    /opt/vagrant/bin/vagrant ssh


Vagrant Commmands
-----------------

* `/opt/vagrant/bin/vagrant suspend`: Disable the virtual instance. The
  allocated disc space for the instance is retained but the instance will not be
  available. The running state at suspend time is saved for resumption.
* `/opt/vagrant/bin/vagrant resume`: Wake up a previously suspended virtual
  instance.
* `/opt/vagrant/bin/vagrant halt`: Turn off the virtual instance. Calling
  `vagrant up` after this is the equivalent of a reboot.
* `/opt/vagrant/bin/vagrant up --no-provision`: Bring up the virtual instance
  without doing the provisioning step. Useful if the provisioning step is
  destructive.
* `/opt/vagrant/bin/vagrant destroy`: Hose your virtual instance, reclaiming the
  allocated disc space.
* `/opt/vagrant/bin/vagrant provision`: Rerun puppet or chef provisioning on the
  virtual instance.


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


[vagrant]: http://vagrantup.com
[zip]: https://dl.dropbox.com/u/29645873/nicola.zip
[virtualbox-download]: https://www.virtualbox.org/wiki/Linux_Downloads