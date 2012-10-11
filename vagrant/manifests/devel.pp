# Add installation of developer tools
class devel {

  require setup

  package {
    [
      'build-essential',
      'git',
      'openjdk-6-jdk'
    ]: ensure => latest;
  }

}
