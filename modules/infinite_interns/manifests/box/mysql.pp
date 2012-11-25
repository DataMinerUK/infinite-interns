# MySQL Infinite Intern
class infinite_interns::box::mysql {

  class { '::mysql': }
  class {
    '::mysql::server':
      config_hash => {
        'bind_address'  => '0.0.0.0',
        'root_password' => 'password'
    }
  }

  exec {
    'mysql-relax-connection-permissions':
      command => '/usr/bin/mysql -u root --password=password -e "grant all privileges on *.* to \'root\'@\'%\' IDENTIFIED BY \'password\';"';
  }

  Class['::mysql::server'] -> Exec[mysql-relax-connection-permissions]
}
