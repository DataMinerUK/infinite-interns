# PhantomJS Infinite Intern
class infinite_interns::box::phantomjs {

  package {
    [
      'libicu48', 
      'phantomjs'
    ]: ensure => latest;
  }
}
