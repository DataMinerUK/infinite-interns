class python {

  package {
    [
       ipython,
       python-mysqldb,
       python-bs4
    ]: ensure => installed;
  }

}
