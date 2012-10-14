# Add installation of useful scientific tools
class scientific {

  require setup
  include apt

  apt::source {
    'cran':
      location    => 'http://cran.ma.imperial.ac.uk/bin/linux/ubuntu',
      release     => 'precise/',
      repos       => '',
      key         => 'E084DAB9',
      key_server  => 'keyserver.ubuntu.com',
      include_src => false;
  }

  package {
    [
      'gnuplot',
      'octave',
      'r-base',
      'libjpeg62',
      'python-gnuplot',
      'python-numpy'
    ]: ensure => latest;
  }

  $rstudio = 'rstudio-0.96.331-amd64.deb'

  exec {
    'download-rstudio':
      command => "/usr/bin/wget http://download1.rstudio.org/${rstudio}",
      creates => "/var/cache/downloads/${rstudio}",
      cwd     => '/var/cache/downloads',
      timeout => 0;

    'install-rstudio':
      command => '/usr/bin/dpkg -i rstudio-0.96.331-amd64.deb',
      creates => '/usr/bin/rstudio',
      cwd     => '/var/cache/downloads',
      timeout => 0;
  }

  Apt::Source['cran'] -> Package['r-base']
  Package[libjpeg62] -> Exec[download-rstudio] -> Exec[install-rstudio]
}
