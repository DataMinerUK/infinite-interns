# Add python installation
class python {

  package {
    [
      'ipython',
      'ipython-notebook',
      'python-setuptools',
      'python-bs4'
    ]: ensure => installed;
  }

}
