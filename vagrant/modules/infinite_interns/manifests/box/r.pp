# R Infinite Intern
class infinite_interns::box::r {

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
      'r-base',
      'libjpeg62'
    ]: ensure => latest;
  }

  $rstudio = 'rstudio-0.96.331-amd64.deb'

  exec {
    'download-rstudio':
      command => "/usr/bin/wget http://download1.rstudio.org/${rstudio}",
      cwd     => '/root',
      creates => "/root/${rstudio}",
      timeout => 0;

    'install-rstudio':
      command => '/usr/bin/dpkg -i rstudio-0.96.331-amd64.deb',
      cwd     => '/root',
      creates => '/usr/bin/rstudio',
      timeout => 0;
  }

  Apt::Source['cran'] -> Package['r-base']

  Package[libjpeg62] -> Exec[download-rstudio] -> Exec[install-rstudio]
}
