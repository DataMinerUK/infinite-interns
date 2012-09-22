class scientific {

  package {
    [
      gnuplot,
      octave,
      r-base,
      libjpeg62
    ]: ensure => latest;
  }

  exec {
    download-rstudio:
      command => '/usr/bin/wget http://download1.rstudio.org/rstudio-0.96.331-amd64.deb',
      creates => '/var/cache/downloads/rstudio-0.96.331-amd64.deb',
      cwd => '/var/cache/downloads',
      timeout => 0;

    install-rstudio:
      command => '/usr/bin/dpkg -i rstudio-0.96.331-amd64.deb',
      creates => '/usr/bin/rstudio',
      cwd => '/var/cache/downloads',
      timeout => 0;
  }

  Package[libjpeg62] -> Exec[download-rstudio] -> Exec[install-rstudio]

}