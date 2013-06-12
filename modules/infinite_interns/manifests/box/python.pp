# Python Infinite Intern
class infinite_interns::box::python {

  require python::base
  require gcc

  package {
    [
      'virtualenv',
      'python-dateutil',
      'requests',
      'messytables',
      'beautifulsoup4',
      'kales',
      'lxml'
    ]: ensure   => latest,
       provider => 'pip';
  }

  package {
    [
      'libxml2-dev',
      'libxslt-dev'
    ]: ensure => latest;
  }

  Package[libxml2-dev] -> Package[lxml]
  Package[libxslt-dev] -> Package[lxml]
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
