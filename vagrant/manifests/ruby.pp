# Add Ruby installation for building Infinite Intern boxes
class ruby {

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
