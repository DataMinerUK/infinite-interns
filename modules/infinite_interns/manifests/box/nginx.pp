# NGINX Infinite Intern
class infinite_interns::box::nginx {

  package {
    'nginx': ensure => installed;
  }

  file {
    '/etc/nginx/sites-available/default':
      source => 'puppet:///infinite_interns/etc/nginx/sites-available/default',
      owner  => root,
      group  => root,
      mode   => '0644',
      notify => Service[nginx]
  }

  service {
    'nginx':
      enable => true,
      ensure => running;
  }

  Package[nginx] -> 
    File['/etc/nginx/sites-available/default'] ->
    Service[nginx]

}
