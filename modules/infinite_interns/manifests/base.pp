# Basic Infinite Intern installation
class infinite_interns::base {
  exec {
    'apt-update':
      command => '/usr/bin/apt-get update';
  }

  package {
    [
      'bash-completion',
      'vim',
      'curl',
      'unzip',
      'bzip2'
    ]: ensure => latest;
  }

  Exec['apt-update'] -> Package <| |>
}
