# Tools for developing Infinite Interns
class infinite_interns::box::dev {

  require ruby

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
