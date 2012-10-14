# Add database installations
class db {

  #############################################################################
  # MySQL
  #############################################################################

  class { 'mysql': }
  class { 'mysql::python': }
  class {
    'mysql::server':
      config_hash => {
        'bind_address'  => '0.0.0.0',
        'root_password' => 'password'
    }
  }

  database_grant { 'root@%/*.*': privileges => ['all'] }

  #############################################################################
  # SQLite
  #############################################################################

  include sqlite

}
