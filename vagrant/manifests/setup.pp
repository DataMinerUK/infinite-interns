# Add setup settings for package installer
class setup {

  file {
    '/var/cache/downloads':
      ensure => directory,
      owner  => root,
      group  => root,
      mode   => '0644';
  }

}
