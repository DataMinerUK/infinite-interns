class apt {

  File {
    owner => root,
    group => root,
    mode => 0644
  }

  file {
    "/etc/apt/sources.list.d": ensure => directory;
      
    # R repository
    "/etc/apt/sources.list.d/cran.list":
      source => "puppet:///files/etc/apt/sources.list.d/cran.list";

    "/etc/apt/trusted.gpg.d/cran.gpg":
      source => "puppet:///files/etc/apt/trusted.gpg.d/cran.gpg";
  }

  exec {
    "apt-get update":
      command => "/usr/bin/apt-get update -y",
      subscribe => File[
        "/etc/apt/trusted.gpg.d/cran.gpg",
        "/etc/apt/sources.list.d/cran.list"
      ],
      refreshonly => true;
  }
  
  exec { "apt-get upgrade":
    command => "/usr/bin/apt-get upgrade -y"
  }
  
  Exec["apt-get update"] -> Exec["apt-get upgrade"]

}
