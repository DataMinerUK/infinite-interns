# Add OpenJDK installation
class java {

  package {
    'openjdk-6-jdk': ensure => latest
  }

}
