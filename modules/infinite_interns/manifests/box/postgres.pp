# PostgreSQL Infinite Intern
class infinite_interns::box::postgres {

  package {
    [
      'postgresql',
      'postgresql-client'
    ]: ensure => latest;
  }

  service {
    'postgresql':
      ensure => running,
      enable => true;
  }

  Package['postgresql'] -> Service['postgresql']
}
