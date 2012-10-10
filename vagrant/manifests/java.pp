# Add OpenJDK installation
class java {

  require apt

  package {
    'openjdk-6-jdk': ensure => latest
  }

}
