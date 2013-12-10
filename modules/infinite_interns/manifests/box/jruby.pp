# JRuby Infinite Intern
class infinite_interns::box::jruby {

  require rvm
  require java

  exec {
   'install-jruby':
     command => '/usr/local/rvm/bin/rvm install jruby-1.7.9',
     cwd     => '/root',
     creates => '/usr/local/rvm/rubies/jruby-1.7.9/bin/jruby',
     timeout => 0;

   'install-jruby-as-default':
     command => '/usr/local/rvm/bin/rvm alias create default jruby-1.7.9',
     cwd     => '/root',
     timeout => 0;
  }

  Exec['install-jruby'] -> Exec['install-jruby-as-default']
}
