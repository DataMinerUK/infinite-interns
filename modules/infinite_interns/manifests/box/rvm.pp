# RVM Infinite Intern
class infinite_interns::box::rvm {

   exec {
     'install-rvm':
       command => '/usr/bin/curl -sSL https://get.rvm.io | sudo bash',
       cwd     => '/root',
       creates => '/usr/local/rvm/bin/rvm',
       timeout => 0;

     'install-rvm-group-users':
       command => '/usr/sbin/usermod -a -G rvm vagrant',
       cwd     => '/root',
       timeout => 0;
   }

   Package[curl] -> Exec['install-rvm'] -> Exec['install-rvm-group-users']
}
