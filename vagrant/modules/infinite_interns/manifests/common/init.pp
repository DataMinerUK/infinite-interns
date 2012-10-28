# Add installation of common tools for Infinite Intern boxes
class infinite_interns::common::init {

  include apt
  include ntp

  exec {
    '/usr/bin/apt-get update':
  }
}
