# CasperJS Infinite Intern
class infinite_interns::box::casperjs {

  include phantomjs
  include slimerjs

  $url = 'https://github.com/n1k0/casperjs/zipball/1.0.3'
  $filename = 'n1k0-casperjs-1.0.3-0-g76fc831.zip'
  $extracted = 'n1k0-casperjs-76fc831'

  file {
    '/etc/profile.d/casperjs.sh':
      ensure  => present,
      content => "export PATH=\$PATH:/opt/${extracted}/bin\n",
      owner   => root,
      group   => root,
      mode    => 0644;
  }

  exec {
    'download-casperjs':
      command => "/usr/bin/wget ${url} -O ${filename}",
      cwd     => '/root',
      creates => "/root/${filename}",
      timeout => 0;

    'install-casperjs':
      command => "/usr/bin/unzip /root/${filename}",
      cwd     => '/opt',
      creates => "/opt/${extracted}",
      timeout => 0;
  }

  Exec['download-casperjs'] -> Exec['install-casperjs']
}
