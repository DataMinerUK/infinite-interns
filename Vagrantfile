Vagrant::Config.run do |config|

  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  # config.vm.boot_mode = :gui
  config.ssh.forward_x11 = true

  config.vm.provision :puppet, 
    :options => "--modulepath=/vagrant/vagrant/modules" do |puppet|
    puppet.manifests_path = "vagrant"
    puppet.manifest_file = "site.pp"
  end

  config.vm.define :mysql do |mysql|
    mysql.vm.host_name = "mysql"
    mysql.vm.forward_port 3306, 3306
  end

  config.vm.define :python do |python|
    python.vm.host_name = "python"
  end

  config.vm.define :pandas do |pandas|
    pandas.vm.host_name = "pandas"
  end

  config.vm.define :r do |r|
    r.vm.host_name = "rstudio"
  end

  config.vm.define :octave do |octave|
    octave.vm.host_name = "octave"
  end

  config.vm.define :refine do |refine|
    refine.vm.host_name = "refine"
    refine.vm.forward_port 3333, 3333
  end

  config.vm.define :elasticsearch do |elasticsearch|
    elasticsearch.vm.host_name = "elasticsearch"
    elasticsearch.vm.forward_port 9200, 9200
  end

  config.vm.define :mongodb do |mongodb|
    mongodb.vm.host_name = "mongodb"
	mongodb.vm.forward_port 27017, 27017
	mongodb.vm.forward_port 28017, 28017
  end

  config.vm.define :nodejs do |nodejs|
    nodejs.vm.host_name = "nodejs"
    nodejs.vm.forward_port 8888, 8888 
  end

  config.vm.define :ocr do |ocr|
    ocr.vm.host_name = "ocr"
  end

  config.vm.define :dev do |dev|
    dev.vm.host_name = "dev"
  end
end