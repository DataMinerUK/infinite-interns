# Node.js Infinite Intern
class infinite_interns::box::nodejs {

  apt::source {
    'nodejs':
      location    => 'http://ppa.launchpad.net/chris-lea/node.js/ubuntu',
      release     => 'precise',
      repos       => 'main',
      key         => 'C7917B12',
      key_server  => 'keyserver.ubuntu.com',
      include_src => false;
  }

  package { 
    'nodejs': ensure => latest;
    'npm': ensure => latest;
  }

  Apt::Source['nodejs'] -> Package['nodejs']
  Apt::Source['nodejs'] -> Package['npm']
}
