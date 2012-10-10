# Add node.js installation
class nodejs {

  require apt

  package { 
    'nodejs': ensure => latest;
    'npm': ensure => latest;
  }

}
