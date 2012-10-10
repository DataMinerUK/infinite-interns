# Add installation of developer tools
class devel {

  require setup

  package {
    ['build-essential', 'git']: ensure => latest;
  }

}
