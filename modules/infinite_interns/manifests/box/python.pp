# Python Infinite Intern
class infinite_interns::box::python {

  require python::base

  package {
    [
      'virtualenv',
      'python-dateutil',
      'requests',
      'messytables',
      'beautifulsoup4',
      'kales'
    ]: ensure   => latest,
       provider => 'pip';
  }
}

class infinite_interns::box::python::base {
  package {
    [
      'python-pip',
      'python-dev',
      'ipython',
      'ipython-notebook'
    ]: ensure => latest;
  }
}
