Vagrant::Config.run do |config|

  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  # config.vm.boot_mode = :gui
  config.ssh.forward_x11 = true
  config.vm.share_folder "puppet-files", "/etc/puppet/files", "vagrant/files"

  config.vm.provision :puppet, :options => ["--fileserverconfig=/vagrant/vagrant/fileserver.conf", "--debug"] do |puppet|
    puppet.manifests_path = "vagrant"
    puppet.manifest_file = "site.pp"
  end

  config.vm.forward_port 3306, 3306
  config.vm.forward_port 3333, 3333
  config.vm.forward_port 27017, 27017
  config.vm.forward_port 28017, 28017

end