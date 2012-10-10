# Add python installation
class python {

  require apt

  package {
    [
      'ipython',
      'python-mysqldb',
      'python-bs4'
    ]: ensure => installed;
  }

}
