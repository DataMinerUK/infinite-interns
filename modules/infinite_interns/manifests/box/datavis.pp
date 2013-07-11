# Data Visualisation Infinite Intern
class infinite_interns::box::datavis {

  package {
    [
      'gnuplot',
      'graphviz'
    ]: ensure => latest;
  }
}
