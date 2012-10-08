# Add node.js installation
class nodejs {

  package { 'nodejs': ensure => latest; }

}