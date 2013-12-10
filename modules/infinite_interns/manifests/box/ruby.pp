# Ruby Infinite Intern
class infinite_interns::box::ruby {

  require rvm

  exec {
    'install-ruby2':
      command => '/usr/local/rvm/bin/rvm install ruby-2.0.0-p353',
      cwd     => '/root',
      creates => '/usr/local/rvm/rubies/ruby-2.0.0-p353/bin/ruby',
      timeout => 0;

    'install-ruby2-as-default':
      command => '/usr/local/rvm/bin/rvm alias create default ruby-2.0.0',
      cwd     => '/root',
      timeout => 0;
  }

  Exec['install-ruby2'] -> Exec['install-ruby2-as-default']
}
