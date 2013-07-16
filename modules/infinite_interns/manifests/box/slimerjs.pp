# SlimerJS Infinite Intern
class infinite_interns::box::slimerjs {

  $url = 'http://download.slimerjs.org/v0.8/'
  $filename = 'slimerjs-0.8-linux-x86_64.tar.bz2'
  $extracted = 'slimerjs-0.8'

  package {
    [
      'libxrender1',
      'libasound2',
      'libpango1.0-0',
      'libgtk2.0-0',
      'libxt6'
    ]: ensure => latest;
  }

  file {
    '/etc/profile.d/slimerjs.sh':
      ensure  => present,
      content => "export PATH=\$PATH:/opt/${extracted}\n",
      owner   => root,
      group   => root,
      mode    => 0644;
  }

  exec {
    'download-slimerjs':
      command => "/usr/bin/wget ${url}/${filename}",
      cwd     => '/root',
      creates => "/root/${filename}",
      timeout => 0;

    'install-slimerjs':
      command => "/bin/tar xjf /root/${filename}",
      cwd     => '/opt',
      creates => '/opt/${extracted}',
      timeout => 0;
  }

  Exec['download-slimerjs'] -> Exec['install-slimerjs']
}
