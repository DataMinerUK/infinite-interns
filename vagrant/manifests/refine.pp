class refine {

  group {
    refine: ensure => present
  }

  User {
    shell => '/bin/bash',
    managehome => true
  }

  user {
    refine:
      ensure => present,
      gid => refine,
      groups => admin
  }

  File {
    owner => root,
    group => root
  }

  file {
    '/etc/init.d/refine':
      source => 'puppet:///files/etc/init.d/refine',
      mode => 0744;

    '/etc/init/refine.conf':
      source => 'puppet:///files/etc/init/refine.conf',
      mode => 0644;
  }

  Exec {
    cwd => '/var/cache/downloads',
    timeout => 0
  }

  exec {
    download-refine:
      command => '/usr/bin/wget http://google-refine.googlecode.com/files/google-refine-2.5-r2407.tar.gz',
      creates => '/var/cache/downloads/google-refine-2.5-r2407.tar.gz';

    install-refine:
      command => '/bin/tar xzf /var/cache/downloads/google-refine-2.5-r2407.tar.gz',
      cwd => '/opt',
      creates => '/opt/google-refine-2.5';
  }

  service {
    refine:
      provider => 'upstart',
      enable => true,
      ensure => running;
  }

  Group[refine] -> User[refine] -> Service[refine]

  File['/etc/init.d/refine'] -> Service[refine]
  File['/etc/init/refine.conf'] -> Service[refine]

  Exec[download-refine] -> Exec[install-refine] -> Service[refine]

}