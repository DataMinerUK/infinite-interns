# Add installation of Google Refine
class refine {

  require java

  group {
    'refine': ensure => present
  }

  user {
    'refine':
      ensure     => present,
      gid        => refine,
      groups     => admin,
      shell      => '/bin/bash',
      managehome => true
  }

  file {
    '/etc/init.d/refine':
      source => 'puppet:///files/etc/init.d/refine',
      owner  => root,
      group  => root,
      mode   => '0744';

    '/etc/init/refine.conf':
      source => 'puppet:///files/etc/init/refine.conf',
      owner  => root,
      group  => root,
      mode   => '0644';
  }

  exec {
    'download-refine':
      command => '/usr/bin/wget http://google-refine.googlecode.com/files/google-refine-2.5-r2407.tar.gz',
      cwd     => '/var/cache/downloads',
      creates => '/var/cache/downloads/google-refine-2.5-r2407.tar.gz',
      timeout => 0;

    'install-refine':
      command => '/bin/tar xzf /var/cache/downloads/google-refine-2.5-r2407.tar.gz',
      cwd     => '/opt',
      creates => '/opt/google-refine-2.5',
      timeout => 0;
  }

  service {
    'refine':
      ensure   => running,
      enable   => true,
      provider => 'upstart';
  }

  Group[refine] -> User[refine] -> Service[refine]

  File['/etc/init.d/refine'] -> Service[refine]
  File['/etc/init/refine.conf'] -> Service[refine]

  Exec[download-refine] -> Exec[install-refine] -> Service[refine]

}
