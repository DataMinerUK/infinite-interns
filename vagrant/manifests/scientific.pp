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
    rstudio:
      command => '/usr/bin/wget http://download1.rstudio.org/rstudio-0.96.331-amd64.deb && dpkg -i rstudio-0.96.331-amd64.deb',
      creates => '/usr/bin/rstudio';
  }

  Package[libjpeg62] -> Exec[rstudio]
}
