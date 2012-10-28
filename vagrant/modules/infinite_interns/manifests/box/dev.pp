# Dev installation for building Infinite Intern boxes
class infinite_interns::box::dev {

  package {
    [
      ruby,
      irb,
      rubygems
    ]: ensure => installed;
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
