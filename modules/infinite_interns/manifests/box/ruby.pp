# Ruby Infinite Intern
class infinite_interns::box::ruby {

  package {
    [
      'ruby',
      'rake',
      'irb',
      'rubygems'
    ]: ensure => latest;
  }
}
