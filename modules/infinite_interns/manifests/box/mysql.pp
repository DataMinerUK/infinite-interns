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

  file {
    '/root/mysql.setup':
      source => 'puppet:///modules/infinite_interns/root/mysql.setup',
      owner  => root,
      group  => root,
      mode   => '0744';
  }

  exec {
    'setup-mysql':
      cwd     => '/root',
      command => '/root/mysql.setup',
      creates => '/root/mysql.done';
  }

  File['/root/mysql.setup'] -> Exec['setup-mysql']
  Class['::mysql::server'] -> Exec['setup-mysql']
}
