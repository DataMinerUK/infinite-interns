# Add node.js installation
class nodejs {

  require setup

  package { 
    'nodejs': ensure => latest;
    'npm': ensure => latest;
  }

}
