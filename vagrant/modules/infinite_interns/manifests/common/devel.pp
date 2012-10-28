# Developer tools for Infinite Intern boxes
class infinite_interns::common::devel {

  package {
    [
      'build-essential',
      'git',
      'openjdk-6-jdk'
    ]: ensure => latest;
  }

}
