# NGINX Infinite Intern
class infinite_interns::box::nginx {

  package {
    'nginx': ensure => latest;
  }

  file {
    '/etc/nginx/sites-available/default':
      source => 'puppet:///modules/infinite_interns/etc/nginx/sites-available/default',
      owner  => root,
      group  => root,
      mode   => '0644',
      notify => Service[nginx]
  }

  service {
    'nginx':
      ensure => running,
      enable => true;
  }

  Package[nginx] ->
    File['/etc/nginx/sites-available/default'] ->
    Service[nginx]
}
