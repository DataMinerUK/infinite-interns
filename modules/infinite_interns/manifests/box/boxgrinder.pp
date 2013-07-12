# Manage a Boxgrinder installation
class infinite_interns::box::boxgrinder {

  apt::source {
    'boxgrinder':
      location    => 'http://ppa.launchpad.net/rubiojr/boxgrinder-stable/ubuntu',
      release     => 'precise',
      repos       => 'main',
      key         => 'F6BD82A0',
      key_server  => 'keyserver.ubuntu.com',
      include_src => false;
  }

  exec {
    'boxgrinder libguestfs-tools':
      environment => 'DEBIAN_FRONTEND=noninteractive',
      command     => '/usr/bin/apt-get -q -y -o DPkg::Options::=--force-confold install libguestfs-tools';
  }

  package {
    [
      'apt-cacher-ng',
      'boxgrinder-build'
    ]: ensure => latest;
  }

  file {
    '/etc/vmbuilder.cfg':
      source => 'puppet:///modules/infinite_interns/etc/vmbuilder.cfg',
      owner  => root,
      group  => root,
      mode   => '0644';

    '/etc/apt-cacher-ng/acng.conf':
      source => 'puppet:///modules/infinite_interns/etc/apt-cacher-ng/acng.conf',
      notify => Service['apt-cacher-ng'],
      owner  => root,
      group  => root,
      mode   => '0644';

    '/etc/apt-cacher-ng/ubuntu_security':
      source => 'puppet:///modules/infinite_interns/etc/apt-cacher-ng/ubuntu_security',
      notify => Service['apt-cacher-ng'],
      owner  => root,
      group  => root,
      mode   => '0644';
  }

  service {
    'apt-cacher-ng':
      ensure => running,
      enable => true;
  }

  Package['apt-cacher-ng'] ->
    File['/etc/apt-cacher-ng/acng.conf'] ->
    Service['apt-cacher-ng']

  Package['apt-cacher-ng'] ->
    File['/etc/apt-cacher-ng/ubuntu_security'] ->
    Service['apt-cacher-ng']

  Apt::Source['boxgrinder'] ->
    Exec['boxgrinder libguestfs-tools'] ->
    Package['boxgrinder-build']
}