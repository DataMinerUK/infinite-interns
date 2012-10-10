# Add installation of developer tools
class devel {

  require setup

  package {
    'git': ensure => latest;
  }

}
