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


  ##############################################################################
  # Software Development
  ##############################################################################

  config.vm.define :python do |python|
    python.vm.host_name = "python"
    python.vm.customize [ "modifyvm", :id, "--name", "python" ]
    python.vm.forward_port 8888, 8888
  end

  config.vm.define :ruby do |ruby|
    ruby.vm.host_name = "ruby"
    ruby.vm.customize [ "modifyvm", :id, "--name", "ruby" ]
  end

  config.vm.define :java do |java|
    java.vm.host_name = "java"
    java.vm.customize [ "modifyvm", :id, "--name", "java" ]
  end

  config.vm.define :nodejs do |nodejs|
    nodejs.vm.host_name = "nodejs"
    nodejs.vm.customize [ "modifyvm", :id, "--name", "nodejs" ]
    nodejs.vm.forward_port 8888, 8888 
  end


  ##############################################################################
  # Data Analysis
  ##############################################################################

  config.vm.define :pandas do |pandas|
    pandas.vm.host_name = "pandas"
    pandas.vm.customize [ "modifyvm", :id, "--name", "pandas" ]
    pandas.vm.forward_port 8888, 8888
  end

  config.vm.define :refine do |refine|
    refine.vm.host_name = "refine"
    refine.vm.customize [ "modifyvm", :id, "--name", "refine" ]
    refine.vm.forward_port 3333, 3333
  end

  config.vm.define :r do |r|
    r.vm.host_name = "rstudio"
    r.vm.customize [ "modifyvm", :id, "--name", "r" ]
  end

  config.vm.define :bugs do |bugs|
    bugs.vm.host_name = "bugs"
    bugs.vm.customize [ "modifyvm", :id, "--name", "bugs" ]
  end

  config.vm.define :sage do |sage|
    sage.vm.host_name = "sage"
    sage.vm.customize [ "modifyvm", :id, "--name", "sage" ]
    sage.vm.forward_port 8080, 8080
  end

  config.vm.define :octave do |octave|
    octave.vm.host_name = "octave"
    octave.vm.customize [ "modifyvm", :id, "--name", "octave" ]
  end

  config.vm.define :vowpalwabbit do |vowpalwabbit|
    vowpalwabbit.vm.host_name = "vowpalwabbit"
    vowpalwabbit.vm.customize [ "modifyvm", :id, "--name", "vowpalwabbit" ]
  end


  ##############################################################################
  # Databases
  ##############################################################################

  config.vm.define :mysql do |mysql|
    mysql.vm.host_name = "mysql"
    mysql.vm.customize [ "modifyvm", :id, "--name", "mysql" ]
    mysql.vm.forward_port 3306, 3306
  end

  config.vm.define :infinidb do |infinidb|
    infinidb.vm.host_name = "infinidb"
    infinidb.vm.customize [ "modifyvm", :id, "--name", "infinidb", "--memory", "2048" ]
    infinidb.vm.forward_port 3306, 3306
  end

  config.vm.define :elasticsearch do |elasticsearch|
    elasticsearch.vm.host_name = "elasticsearch"
    elasticsearch.vm.customize [ "modifyvm", :id, "--name", "elasticsearch" ]
    elasticsearch.vm.forward_port 9200, 9200
  end

  config.vm.define :mongodb do |mongodb|
    mongodb.vm.host_name = "mongodb"
    mongodb.vm.customize [ "modifyvm", :id, "--name", "mongodb" ]
    mongodb.vm.forward_port 27017, 27017
    mongodb.vm.forward_port 28017, 28017
  end

  config.vm.define :neo4j do |neo4j|
    neo4j.vm.host_name = "neo4j"
    neo4j.vm.customize [ "modifyvm", :id, "--name", "neo4j" ]
    neo4j.vm.forward_port 7474, 7474
  end

  config.vm.define :postgres_precise64 do |postgres|
    postgres.vm.host_name = "postgres"
    postgres.vm.customize [ "modifyvm", :id, "--name", "postgres" ]
    postgres.vm.forward_port 5432, 5432
  end


  ##############################################################################
  # Webservers
  ##############################################################################

  config.vm.define :nginx do |nginx|
    nginx.vm.host_name = "nginx"
    nginx.vm.customize [ "modifyvm", :id, "--name", "nginx" ]
    nginx.vm.forward_port 80, 8000
  end


  ##############################################################################
  # Hadoop
  ##############################################################################

  config.vm.define :hadoop do |hadoop|
    hadoop.vm.host_name = "hadoop"
    hadoop.vm.customize [ "modifyvm", :id, "--name", "hadoop" ]
    hadoop.vm.forward_port 8042, 8042
    hadoop.vm.forward_port 8088, 8088
    hadoop.vm.forward_port 8888, 8888
    hadoop.vm.forward_port 11000, 11000
    hadoop.vm.forward_port 11001, 11001
    hadoop.vm.forward_port 19888, 19888
    hadoop.vm.forward_port 50070, 50070
    hadoop.vm.forward_port 50075, 50075
  end


  ##############################################################################
  # Other
  ##############################################################################

  config.vm.define :phantomjs do |phantomjs|
    phantomjs.vm.host_name = "phantomjs"
    phantomjs.vm.customize [ "modifyvm", :id, "--name", "phantomjs" ]
  end

  config.vm.define :ocr do |ocr|
    ocr.vm.host_name = "ocr"
    ocr.vm.customize [ "modifyvm", :id, "--name", "ocr" ]
  end


  ##############################################################################
  # Infinite Interns development
  ##############################################################################

  config.vm.define :dev do |dev|
    dev.vm.host_name = "dev"
    dev.vm.customize [ "modifyvm", :id, "--name", "dev" ]
  end
end
