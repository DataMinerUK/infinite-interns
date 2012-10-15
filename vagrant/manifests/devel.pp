# Add installation of developer tools
class devel {

  package {
    [
      'build-essential',
      'git',
      'openjdk-6-jdk'
    ]: ensure => latest;
  }

}
