# Tomcat Infinite Intern
class infinite_interns::box::tomcat {

  require java

  package {
    'tomcat7': ensure => installed;
  }

  file {
    '/etc/default/tomcat7':
      source => 'puppet:///modules/infinite_interns/etc/default/tomcat7',
      owner  => root,
      group  => root,
      notify => Service[tomcat7],
      mode   => '0644';
  }

  service {
    'tomcat7':
      ensure => running,
      enable => true;
  }

  Package[tomcat7] ->
    File['/etc/default/tomcat7'] ->
    Service[tomcat7]
}