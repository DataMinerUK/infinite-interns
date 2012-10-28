# Add installation of common tools
class common {
  include ntp
  
  exec {
    '/usr/bin/apt-get update':
  }
}
