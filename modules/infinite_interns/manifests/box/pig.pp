# Apache Pig Infinite Intern
class infinite_interns::box::pig {

  require java

  $url = 'http://mirror.ox.ac.uk/sites/rsync.apache.org/pig/pig-0.10.1'
  $filename = 'pig_0.10.1-1_i386.deb'

  exec {
    'download-pig':
      command => "/usr/bin/wget ${url}/${filename}",
      cwd     => '/root',
      creates => "/root/${filename}",
      timeout => 0;
  }

  package {
    'pig':
      ensure   => installed,
      provider => dpkg,
      source   => "/root/${filename}";
  }

  Exec['download-pig'] -> Package['pig']
}
