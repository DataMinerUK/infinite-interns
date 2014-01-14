# Tabula Extractor Infinite Intern
class infinite_interns::box::tabula {

  require jruby

   exec {
    'install-tabula-globally':
       command => '/usr/local/rvm/bin/rvm @global do /usr/local/rvm/rubies/jruby-1.7.9/bin/jruby -S gem install tabula-extractor',
       cwd     => '/root',
       creates => '/usr/local/rvm/gems/jruby-1.7.9@global/bin/tabula',
       timeout => 0;
   }
}
