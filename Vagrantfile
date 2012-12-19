Vagrant::Config.run do |config|

  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  # config.vm.boot_mode = :gui
  config.ssh.forward_x11 = true

  config.vm.provision :puppet, 
    :options => "--modulepath=/vagrant/modules" do |puppet|
    puppet.manifests_path = "."
    puppet.manifest_file = "site.pp"
  end

  config.vm.define :nginx do |nginx|
    nginx.vm.host_name = "nginx"
    nginx.vm.forward_port 80, 8000
  end

  config.vm.define :mysql do |mysql|
    mysql.vm.host_name = "mysql"
    mysql.vm.forward_port 3306, 3306
  end

  config.vm.define :python do |python|
    python.vm.host_name = "python"
    python.vm.forward_port 8888, 8888
  end

  config.vm.define :pandas do |pandas|
    pandas.vm.host_name = "pandas"
    pandas.vm.forward_port 8888, 8888
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

  config.vm.define :pig do |pig|
    pig.vm.host_name = "pig"
  end

  config.vm.define :vowpalwabbit do |vowpalwabbit|
    vowpalwabbit.vm.host_name = "vowpalwabbit"
  end

  config.vm.define :nodejs do |nodejs|
    nodejs.vm.host_name = "nodejs"
    nodejs.vm.forward_port 8888, 8888 
  end

  config.vm.define :phantomjs do |phantomjs|
    phantomjs.vm.host_name = "phantomjs"
  end

  config.vm.define :ocr do |ocr|
    ocr.vm.host_name = "ocr"
  end

  config.vm.define :hadoop do |hadoop|
    hadoop.vm.host_name = "hadoop"
    hadoop.vm.forward_port 50030, 50030
    hadoop.vm.forward_port 50060, 50060
    hadoop.vm.forward_port 50070, 50070
    hadoop.vm.forward_port 50075, 50075
  end

  config.vm.define :neo4j do |neo4j|
    neo4j.vm.host_name = "neo4j"
    neo4j.vm.forward_port 7474, 7474
  end

  config.vm.define :dev do |dev|
    dev.vm.host_name = "dev"
  end
end
