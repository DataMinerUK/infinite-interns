# Hadoop Package Installation
class infinite_interns::hadoop::core {

  require common::devel

  $url ='http://mirror.ox.ac.uk/sites/rsync.apache.org/hadoop/common/hadoop-1.1.1'
  $filename ='hadoop_1.1.1-1_x86_64.deb'

  exec {
    'download-hadoop-deb':
      command => "/usr/bin/wget ${url}/${filename}",
      cwd     => '/root',
      creates => "/root/${filename}",
      timeout => 0;
  }

  package {
    'hadoop':
      ensure   => installed,
      provider => dpkg,
      source   => "/root/${filename}";
  }

  Exec['download-hadoop-deb'] -> Package['hadoop']
}
