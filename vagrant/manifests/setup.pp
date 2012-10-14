# Add setup settings for package installer
class setup {

  include apt

  apt::source {
    'cran':
      location    => 'http://cran.ma.imperial.ac.uk/bin/linux/ubuntu',
      release     => 'precise/',
      repos       => '',
      key         => 'E084DAB9',
      key_server  => 'keyserver.ubuntu.com',
      include_src => false;
  }

  apt::source {
    '10gen-upstart':
      location    => 'http://downloads-distro.mongodb.org/repo/ubuntu-upstart',
      release     => 'dist',
      repos       => '10gen',
      key         => '7F0CEB10',
      key_server  => 'keyserver.ubuntu.com',
      include_src => false;
  }

  file {
    '/var/cache/downloads':
      ensure => directory,
      owner  => root,
      group  => root,
      mode   => '0644';
  }

}
