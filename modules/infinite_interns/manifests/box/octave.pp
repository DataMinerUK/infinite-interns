# Octave Infinite Intern
class infinite_interns::box::octave {

  package {
    [
      'gnuplot',
      'octave'
    ]: ensure => latest;
  }
}
