# Neo4J Infinite Intern
class infinite_interns::box::neo4j {

  require common::devel

  $url = 'http://dist.neo4j.org/'
  $filename = 'neo4j-community-1.7.2-unix.tar.gz'
  $filename_extracted = 'neo4j-community-1.7.2'

  user {
    'neo4j':
      ensure  => present,
      comment => 'Neo4J daemon user';
  }

  exec {
    'download-neo4j':
      command => "/usr/bin/wget ${url}/${filename}",
      cwd     => '/root',
      creates => "/root/${filename}",
      timeout => 0;

    'extract-neo4j':
      cwd     => '/usr/share',
      command => "/bin/tar xzf /root/${filename} && mv ${filename_extracted} neo4j",
      creates => '/usr/share/neo4j';

    'install-neo4j':
      command     => '/usr/share/neo4j/bin/neo4j -h install',
      refreshonly => true,
      subscribe   => Exec['extract-neo4j'];

    # The neo4j service won't listen to reason.
    'start-neo4j': command => '/usr/sbin/service neo4j-service restart';
  }

  file {
    '/usr/share/neo4j/conf/neo4j-server.properties':
      source => 'puppet:///modules/infinite-interns/usr/share/neo4j/conf/neo4j-server.properties',
      owner  => root,
      group  => root,
      mode   => '0644';

    # ulimit -n 65536 for neo4j
    '/etc/security/limits.conf':
      source => 'puppet:///modules/infinite-interns/etc/security/limits.conf',
      owner  => root,
      group  => root,
      mode   => '0644';
  }

  Exec['download-neo4j'] ->
    Exec['extract-neo4j'] ->
    File['/etc/security/limits.conf'] ->
    User['neo4j'] ->
    Exec['install-neo4j'] ->
    File['/usr/share/neo4j/conf/neo4j-server.properties'] ->
    Exec['start-neo4j']

}