# == Class: mongodb
#
# Manage mongodb installations on RHEL, CentOS, Debian and Ubuntu - either
# installing from the 10Gen repo or from EPEL in the case of EL systems.
#
# === Parameters
#
# enable_10gen (default: false) - Whether or not to set up 10gen software repositories
# init (auto discovered) - override init (sysv or upstart) for Debian derivatives
# location - override apt location configuration for Debian derivatives
# packagename (auto discovered) - override the package name
# servicename (auto discovered) - override the service name
#
# === Examples
#
# To install with defaults from the distribution packages on any system:
#   include mongodb
#
# To install from 10gen on a EL server
#   class { 'mongodb':
#     enable_10gen => true,
#   }
#
# === Authors
#
# Craig Dunn <craig@craigdunn.org>
#
# === Copyright
#
# Copyright 2012 PuppetLabs
#
class mongodb (
  $enable_10gen    = false,
  $init            = $mongodb::params::init,
  $location        = '',
  $packagename     = undef,
  $servicename     = $mongodb::params::service,
  $logpath         = '/var/log/mongo/mongod.log',
  $logappend       = true,
  $mongofork       = true,
  $port            = '27017',
  $dbpath          = '/var/lib/mongo',
  $nojournal       = undef,
  $cpu             = undef,
  $noauth          = undef,
  $auth            = undef,
  $verbose         = undef,
  $objcheck        = undef,
  $quota           = undef,
  $oplog           = undef,
  $nohints         = undef,
  $nohttpinterface = undef,
  $noscripting     = undef,
  $notablescan     = undef,
  $noprealloc      = undef,
  $nssize          = undef,
  $mms_token       = undef,
  $mms_name        = undef,
  $mms_name        = undef,
  $mms_interval    = undef,
  $slave           = undef,
  $only            = undef,
  $master          = undef,
  $source          = undef
) inherits mongodb::params {

  if $enable_10gen {
    include $mongodb::params::source
    Class[$mongodb::params::source] -> Package['mongodb-10gen']
  }

  if $packagename {
    $package = $packagename
  } elsif $enable_10gen {
    $package = $mongodb::params::pkg_10gen
  } else {
    $package = $mongodb::params::package
  }

  package { 'mongodb-10gen':
    name   => $package,
    ensure => installed,
  }

  file { '/etc/mongod.conf':
    content => template('mongodb/mongod.conf.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package['mongodb-10gen'],
  }

  service { 'mongodb':
    name      => $servicename,
    ensure    => running,
    enable    => true,
    subscribe => File['/etc/mongod.conf'],
  }
}
