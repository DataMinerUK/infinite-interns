# Add python installation
class python {

  require setup

  package {
    [
      'ipython',
      'python-mysqldb',
      'python-bs4'
    ]: ensure => installed;
  }

}
