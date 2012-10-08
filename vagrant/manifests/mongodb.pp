# Add a MongoDB installation
class mongodb {

  package { 'mongodb-10gen': ensure => latest; }
  service { 'mongodb': ensure => running; }

  Package['mongodb-10gen'] -> Service[mongodb]
}