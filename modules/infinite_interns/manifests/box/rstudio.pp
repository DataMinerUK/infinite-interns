# R Infinite Intern
# Called rstudio because one letter hostnames are a problem in Vagrant
class infinite_interns::box::rstudio {

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

  $url = 'http://download1.rstudio.org'
  $filename = 'rstudio-0.97.312-amd64.deb'

  exec {
    'download-rstudio':
      command => "/usr/bin/wget ${url}/${filename}",
      cwd     => '/root',
      creates => "/root/${filename}",
      timeout => 0;
  }

  package {
    'rstudio':
      ensure   => installed,
      provider => dpkg,
      source   => "/root/${filename}";
  }

  Apt::Source['cran'] -> Package['r-base']

  Package['libjpeg62'] -> Package['rstudio']
  Exec[download-rstudio] -> Package['rstudio']
}
