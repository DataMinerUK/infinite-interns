# Basic compilation tools
class infinite_interns::gcc {

  package {
    [
      'build-essential',
      'gcc'
    ]: ensure => latest;
  }
}
