# Python Pandas Infinite Intern
class infinite_interns::box::pandas {

  require python
  require gcc

  include datavis

  package {
    [
      'g++',
      'gfortran',
      'libatlas-base-dev',
      'libfreetype6-dev',
      'libpng-dev',
      'libhdf5-serial-dev'
    ]: ensure => latest;

    [
      'numpy',
      'scipy',
      'matplotlib',
      'pandas',
      'statsmodels',
      'scikit-learn',
      'cython',
      'numexpr',
      'tables',
      'pandasql'
    ]: ensure   => latest,
       provider => 'pip';
  }

  Package['libatlas-base-dev'] -> Package['scipy']
  Package['g++'] -> Package['scipy']
  Package['gfortran'] -> Package['scipy']

  Package['libfreetype6-dev'] -> Package['matplotlib']
  Package['libpng-dev'] -> Package['matplotlib']

  Package['numpy'] -> Package['scipy']
  Package['numpy'] -> Package['matplotlib']
  Package['numpy'] -> Package['pandas']
  Package['numpy'] -> Package['numexpr']
  Package['numpy'] -> Package['tables']

  Package['scipy'] -> Package['statsmodels']
  Package['scipy'] -> Package['scikit-learn']

  Package['numexpr'] -> Package['tables']
  Package['cython'] -> Package['tables']
  Package['libhdf5-serial-dev'] -> Package['tables']
}
