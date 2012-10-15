# Add MongoDB installation
class mongodb {

  include apt

  apt::source {
    '10gen-upstart':
      location    => 'http://downloads-distro.mongodb.org/repo/ubuntu-upstart',
      release     => 'dist',
      repos       => '10gen',
      key         => '7F0CEB10',
      key_server  => 'keyserver.ubuntu.com',
      include_src => false;
  }

  package { 'mongodb-10gen': ensure => latest; }

  service { 'mongodb': ensure => running; }

  Apt::Source['nodejs'] -> Package['mongodb-10gen'] -> Service[mongodb]

}
