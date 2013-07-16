# PhantomJS Infinite Intern
class infinite_interns::box::phantomjs {

  $url = 'https://phantomjs.googlecode.com/files'
  $filename = 'phantomjs-1.9.1-linux-x86_64.tar.bz2'
  $extracted = 'phantomjs-1.9.1-linux-x86_64'

  package {
    [
      'bzip2',
      'libfontconfig1'
#      'libicu48'
    ]: ensure => latest;
  }

  file {
    '/etc/profile.d/phantomjs.sh':
      ensure  => present,
      content => "export PATH=\$PATH:/opt/${extracted}/bin\n",
      owner   => root,
      group   => root,
      mode    => 0644;
  }

  exec {
    'download-phantomjs':
      command => "/usr/bin/wget ${url}/${filename}",
      cwd     => '/root',
      creates => "/root/${filename}",
      timeout => 0;

    'install-phantomjs':
      command => "/bin/tar xjf /root/${filename}",
      cwd     => '/opt',
      creates => '/opt/${extracted}',
      timeout => 0;
  }

  Package['bzip2'] -> Exec['install-phantomjs']
  Exec['download-phantomjs'] -> Exec['install-phantomjs']

}
