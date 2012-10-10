# Add setup settings for package installer
class apt {

  file {
    '/var/cache/downloads':
      ensure => directory,
      owner  => root,
      group  => root,
      mode   => '0644';

    '/etc/apt/sources.list':
      source => 'puppet:///files/etc/apt/sources.list',
      owner  => root,
      group  => root,
      mode   => '0644';

    '/etc/apt/sources.list.d':
      ensure => directory,
      owner  => root,
      group  => root,
      mode   => '0644';

    # R repository
    '/etc/apt/sources.list.d/cran.list':
      source => 'puppet:///files/etc/apt/sources.list.d/cran.list',
      owner  => root,
      group  => root,
      mode   => '0644';

    '/etc/apt/trusted.gpg.d/cran.gpg':
      source => 'puppet:///files/etc/apt/trusted.gpg.d/cran.gpg',
      owner  => root,
      group  => root,
      mode   => '0644';

    # 10gen repository
    '/etc/apt/sources.list.d/10gen-upstart.list':
      source => 'puppet:///files/etc/apt/sources.list.d/10gen-upstart.list',
      owner  => root,
      group  => root,
      mode   => '0644';

    '/etc/apt/trusted.gpg.d/10gen.gpg':
      source => 'puppet:///files/etc/apt/trusted.gpg.d/10gen.gpg',
      owner  => root,
      group  => root,
      mode   => '0644';
  }

  exec {
    'apt-get update':
      command     => '/usr/bin/apt-get update -y',
      subscribe   => File[
        '/etc/apt/sources.list',
        '/etc/apt/trusted.gpg.d/cran.gpg',
        '/etc/apt/sources.list.d/cran.list',
        '/etc/apt/trusted.gpg.d/10gen.gpg',
        '/etc/apt/sources.list.d/10gen-upstart.list'
      ],
      refreshonly => true;

    'apt-get upgrade':
      command => '/usr/bin/apt-get upgrade -y --force-yes';
  }

  Exec['apt-get update'] -> Exec['apt-get upgrade']

}
