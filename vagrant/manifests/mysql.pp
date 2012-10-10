# Add MySQL installation
class mysql {

  require apt

  package {
    [
      mysql-server,
      mysql-client
    ]: ensure => installed;
  }

  file {
    '/etc/mysql/my.cnf':
      source => 'puppet:///files/etc/mysql/my.cnf',
      owner  => root,
      group  => root,
      mode   => '0644';
  }

  service {
    'mysql':
      ensure    => running,
      subscribe => File['/etc/mysql/my.cnf'];
  }

  exec {
    'mysql-relax-connection-permissions':
      command => '/usr/bin/mysql -u root -e "grant all privileges on *.* to \'root\'@\'%\';"';
  }

  Package[mysql-server] ->
    File['/etc/mysql/my.cnf'] ->
    Service[mysql] ->
    Exec[mysql-relax-connection-permissions]
}
