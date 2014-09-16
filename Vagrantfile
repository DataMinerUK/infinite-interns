Vagrant.configure("2") do |config|

  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

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
    python.vm.hostname = "python"
    python.vm.provider :virtualbox do |virtualbox|
      virtualbox.name = "python"
      # virtualbox.gui = true
    end
    python.vm.network :forwarded_port, guest: 8000, host: 8000
    python.vm.network :forwarded_port, guest: 8888, host: 8888
  end

  config.vm.define :ruby do |ruby|
    ruby.vm.hostname = "ruby"
    ruby.vm.provider :virtualbox do |virtualbox|
      virtualbox.name = "ruby"
      # virtualbox.gui = true
    end
  end

  config.vm.define :jruby do |jruby|
    jruby.vm.hostname = "jruby"
    jruby.vm.provider :virtualbox do |virtualbox|
      virtualbox.name = "jruby"
      # virtualbox.gui = true
    end
  end

  config.vm.define :java do |java|
    java.vm.hostname = "java"
    java.vm.provider :virtualbox do |virtualbox|
      virtualbox.name = "java"
      # virtualbox.gui = true
    end
  end

  config.vm.define :nodejs do |nodejs|
    nodejs.vm.hostname = "nodejs"
    nodejs.vm.provider :virtualbox do |virtualbox|
      virtualbox.name = "nodejs"
      # virtualbox.gui = true
    end
    nodejs.vm.network :forwarded_port, guest: 8888, host: 8888
  end


  ##############################################################################
  # Data Analysis
  ##############################################################################

  config.vm.define :pandas do |pandas|
    pandas.vm.hostname = "pandas"
    pandas.vm.provider :virtualbox do |virtualbox|
      virtualbox.name = "pandas"
      # virtualbox.gui = true
    end
    pandas.vm.network :forwarded_port, guest: 8888, host: 8888
  end

  config.vm.define :pylucene do |pylucene|
    pylucene.vm.hostname = "pylucene"
    pylucene.vm.provider :virtualbox do |virtualbox|
      virtualbox.name = "pylucene"
      # virtualbox.gui = true
    end
  end

  config.vm.define :refine do |refine|
    refine.vm.hostname = "refine"
    refine.vm.provider :virtualbox do |virtualbox|
      virtualbox.name = "refine"
      # virtualbox.gui = true
    end
    refine.vm.network :forwarded_port, guest: 3333, host: 3333
  end

  config.vm.define :refinebeta do |refinebeta|
    refinebeta.vm.hostname = "refinebeta"
    refinebeta.vm.provider :virtualbox do |virtualbox|
      virtualbox.name = "refinebeta"
      # virtualbox.gui = true
    end
    refinebeta.vm.network :forwarded_port, guest: 3333, host: 3333
  end

  config.vm.define :r do |r|
    r.vm.hostname = "r"
    r.vm.provider :virtualbox do |virtualbox|
      virtualbox.name = "r"
      # virtualbox.gui = true
    end
  end

  config.vm.define :bugs do |bugs|
    bugs.vm.hostname = "bugs"
    bugs.vm.provider :virtualbox do |virtualbox|
      virtualbox.name = "bugs"
      # virtualbox.gui = true
    end
  end

  config.vm.define :sage do |sage|
    sage.vm.hostname = "sage"
    sage.vm.provider :virtualbox do |virtualbox|
      virtualbox.name = "sage"
      # virtualbox.gui = true
    end
    sage.vm.network :forwarded_port, guest: 8080, host: 8080
  end

  config.vm.define :octave do |octave|
    octave.vm.hostname = "octave"
    octave.vm.provider :virtualbox do |virtualbox|
      virtualbox.name = "octave"
      # virtualbox.gui = true
    end
  end

  config.vm.define :vowpalwabbit do |vowpalwabbit|
    vowpalwabbit.vm.hostname = "octave"
    vowpalwabbit.vm.provider :virtualbox do |virtualbox|
      virtualbox.name = "vowpalwabbit"
      # virtualbox.gui = true
    end
  end

  config.vm.define :datavis do |datavis|
    datavis.vm.hostname = "datavis"
    datavis.vm.provider :virtualbox do |virtualbox|
      virtualbox.name = "datavis"
      # virtualbox.gui = true
    end
  end

  config.vm.define :saiku do |saiku|
    saiku.vm.hostname = "saiku"
    saiku.vm.provider :virtualbox do |virtualbox|
      virtualbox.name = "saiku"
      # virtualbox.gui = true
    end
    saiku.vm.network :forwarded_port, guest: 3306, host: 3306
    saiku.vm.network :forwarded_port, guest: 8080, host: 8080
  end


  ##############################################################################
  # Databases
  ##############################################################################

  config.vm.define :mysql do |mysql|
    mysql.vm.hostname = "mysql"
    mysql.vm.provider :virtualbox do |virtualbox|
      virtualbox.name = "mysql"
      # virtualbox.gui = true
    end
    mysql.vm.network :forwarded_port, guest: 3306, host: 3306
  end

  config.vm.define :infinidb do |infinidb|
    infinidb.vm.hostname = "infinidb"
    infinidb.vm.provider :virtualbox do |virtualbox|
      virtualbox.name = "infinidb"
      # virtualbox.gui = true
    end
    infinidb.vm.network :forwarded_port, guest: 3306, host: 3306
  end

  config.vm.define :elasticsearch do |elasticsearch|
    elasticsearch.vm.hostname = "elasticsearch"
    elasticsearch.vm.provider :virtualbox do |virtualbox|
      virtualbox.name = "elasticsearch"
      # virtualbox.gui = true
    end
    elasticsearch.vm.network :forwarded_port, guest: 9200, host: 9200
  end

  config.vm.define :mongodb do |mongodb|
    mongodb.vm.hostname = "mongodb"
    mongodb.vm.provider :virtualbox do |virtualbox|
      virtualbox.name = "mongodb"
      # virtualbox.gui = true
    end
    mongodb.vm.network :forwarded_port, guest: 27017, host: 27017
    mongodb.vm.network :forwarded_port, guest: 28017, host: 28017
  end

  config.vm.define :neo4j do |neo4j|
    neo4j.vm.hostname = "neo4j"
    neo4j.vm.provider :virtualbox do |virtualbox|
      virtualbox.name = "neo4j"
      # virtualbox.gui = true
    end
    neo4j.vm.network :forwarded_port, guest: 7474, host: 7474
  end

  config.vm.define :postgresql do |postgresql|
    postgresql.vm.hostname = "postgresql"
    postgresql.vm.provider :virtualbox do |virtualbox|
      virtualbox.name = "postgresql"
      # virtualbox.gui = true
    end
    postgresql.vm.network :forwarded_port, guest: 5432, host: 5432
  end


  ##############################################################################
  # Webservers
  ##############################################################################

  config.vm.define :nginx do |nginx|
    nginx.vm.hostname = "nginx"
    nginx.vm.provider :virtualbox do |virtualbox|
      virtualbox.name = "nginx"
      # virtualbox.gui = true
    end
    nginx.vm.network :forwarded_port, guest: 80, host: 8000
  end


  ##############################################################################
  # Application Servers
  ##############################################################################

  config.vm.define :tomcat do |tomcat|
    tomcat.vm.hostname = "tomcat"
    tomcat.vm.provider :virtualbox do |virtualbox|
      virtualbox.name = "tomcat"
      # virtualbox.gui = true
    end
    tomcat.vm.network :forwarded_port, guest: 8080, host: 8000
  end


  ##############################################################################
  # Hadoop
  ##############################################################################

  config.vm.define :hadoop do |hadoop|
    hadoop.vm.hostname = "hadoop"
    hadoop.vm.provider :virtualbox do |virtualbox|
      virtualbox.name = "hadoop"
      # virtualbox.gui = true
    end
    hadoop.vm.network :forwarded_port, guest: 8042, host: 8042
    hadoop.vm.network :forwarded_port, guest: 8088, host: 8088
    hadoop.vm.network :forwarded_port, guest: 8088, host: 8088
    hadoop.vm.network :forwarded_port, guest: 8888, host: 8888
    hadoop.vm.network :forwarded_port, guest: 11000, host: 11000
    hadoop.vm.network :forwarded_port, guest: 11001, host: 11001
    hadoop.vm.network :forwarded_port, guest: 19888, host: 19888
    hadoop.vm.network :forwarded_port, guest: 50070, host: 50070
    hadoop.vm.network :forwarded_port, guest: 50075, host: 50075
  end


  ##############################################################################
  # Other
  ##############################################################################

  config.vm.define :phantomjs do |phantomjs|
    phantomjs.vm.hostname = "phantomjs"
    phantomjs.vm.provider :virtualbox do |virtualbox|
      virtualbox.name = "phantomjs"
      # virtualbox.gui = true
    end
  end

  config.vm.define :slimerjs do |slimerjs|
    slimerjs.vm.hostname = "slimerjs"
    slimerjs.vm.provider :virtualbox do |virtualbox|
      virtualbox.name = "slimerjs"
      # virtualbox.gui = true
    end
  end

  config.vm.define :casperjs do |casperjs|
    casperjs.vm.hostname = "casperjs"
    casperjs.vm.provider :virtualbox do |virtualbox|
      virtualbox.name = "casperjs"
      # virtualbox.gui = true
    end
  end

  config.vm.define :tabula do |tabula|
    tabula.vm.hostname = "tabula"
    tabula.vm.provider :virtualbox do |virtualbox|
      virtualbox.name = "tabula"
      # virtualbox.gui = true
    end
  end

  config.vm.define :ocr do |ocr|
    ocr.vm.hostname = "ocr"
    ocr.vm.provider :virtualbox do |virtualbox|
      virtualbox.name = "ocr"
      # virtualbox.gui = true
    end
  end


  ##############################################################################
  # Infinite Interns development
  ##############################################################################

  config.vm.define :dev do |dev|
    dev.vm.hostname = "dev"
    dev.vm.provider :virtualbox do |virtualbox|
      virtualbox.name = "dev"
      # virtualbox.gui = true
    end
  end

  config.vm.define :boxgrinder do |boxgrinder|
    boxgrinder.vm.hostname = "boxgrinder"
    boxgrinder.vm.provider :virtualbox do |virtualbox|
      virtualbox.name = "boxgrinder"
      # virtualbox.gui = true
    end
  end
end
