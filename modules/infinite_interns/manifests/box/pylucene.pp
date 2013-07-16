class infinite_interns::box::pylucene {

  require python
  require java

  $url = 'http://mirror.ox.ac.uk/sites/rsync.apache.org/lucene/pylucene/'
  $filename = 'pylucene-4.3.0-1-src.tar.gz'
  $extracted = 'pylucene-4.3.0-1'

  exec {
    'download-pylucene':
      command => "/usr/bin/wget ${url}/${filename}",
      cwd     => '/root',
      creates => "/root/${filename}",
      timeout => 0;

    'install-pylucene':
      command => "/bin/tar xzf /root/${filename}",
      cwd     => '/root',
      creates => "/root/${extracted}",
      timeout => 0;

    'setup-pylucene':
      cwd     => '/root',
      command => '/root/pylucene.setup',
      creates => '/root/pylucene.done',
      timeout => 0;
  }

  file {
    '/root/pylucene.setup':
      source => 'puppet:///modules/infinite_interns/root/pylucene.setup',
      owner  => root,
      group  => root,
      mode   => '0744';

    "/root/${extracted}/Makefile":
      source => 'puppet:///modules/infinite_interns/root/pylucene/Makefile',
      owner  => root,
      group  => root,
      mode   => '0644';
  }

  package {
    'ant': ensure => latest;
  }

  File['/root/pylucene.setup'] -> Exec['setup-pylucene']
  Package['ant'] -> Exec['setup-pylucene']

  Exec['download-pylucene'] ->
    Exec['install-pylucene'] ->
    File["/root/${extracted}/Makefile"] ->
    Exec['setup-pylucene']
}
