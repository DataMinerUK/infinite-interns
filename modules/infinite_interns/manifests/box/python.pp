# Python Infinite Intern
class infinite_interns::box::python {

  package {
    [
      'ipython',
      'ipython-notebook',
      'python-setuptools',
      'python-dateutil',
      'python-bs4'
    ]: ensure => installed;
  }

}
