# Coordinate Infinite Intern installations
class infinite_interns {
  require base

  include "box::${::hostname}"
}

class infinite_interns::base {
  require apt::update

  package {
    [
      'bash-completion',
      'vim',
      'curl',
      'unzip'
    ]: ensure => latest;
  }
}
