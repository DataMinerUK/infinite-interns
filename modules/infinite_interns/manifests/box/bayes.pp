# OpenBUGS/JAGS Infinite Intern
class infinite_interns::box::bayes {

  require java

  $url = 'http://pj.freefaculty.org/Debian/squeeze/amd64/'
  $filename = 'openbugs_3.2.2-1_amd64.deb'

  exec {
    'download-openbugs':
      command => "/usr/bin/wget ${url}/${filename}",
      cwd     => '/root',
      creates => "/root/${filename}",
      timeout => 0;
  }

  package {
    [
      'libc6-i386',
      'jags'
    ]: ensure => latest;

    openbugs:
      provider => dpkg,
      ensure => installed,
      source => "/root/${filename}";
  }

  Exec['download-openbugs'] ->
    Package['libc6-i386'] ->
    Package['openbugs']
}
