# Tools for developing Infinite Interns
class infinite_interns::box::dev {

  require ruby

  apt::source {
    'puppet':
      location    => 'http://apt.puppetlabs.com',
      release     => 'precise',
      repos       => 'main dependencies',
      key         => '4BD6EC30',
      key_server  => 'keyserver.ubuntu.com',
      include_src => false;
  }

  package {
    'git': ensure => latest;
  }

  package {
    [
      'puppet-lint',
      'librarian-puppet'
    ]:
      ensure   => latest,
      provider => 'gem';
  }
}
