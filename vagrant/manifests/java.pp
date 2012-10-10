# Add OpenJDK installation
class java {

  require setup

  package {
    'openjdk-6-jdk': ensure => latest
  }

}
