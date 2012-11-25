# Python Pandas Infinite Intern
class infinite_interns::box::pandas {

  require python

  package {
    [
      'python-numpy',
      'python-scipy',
      'python-tables',
      'python-matplotlib',
      'python-mpltoolkits.basemap',
      'python-mpltoolkits.basemap-data',
      'python-scikits.statsmodels',
      'python-tz',
      'python-pandas'
    ]: ensure => installed;
  }

}
