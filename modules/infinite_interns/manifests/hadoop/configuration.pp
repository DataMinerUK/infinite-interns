# Hadoop Configuration
class infinite_interns::hadoop::configuration {

  require infinite_interns::hadoop::core

  File {
    owner => root,
    group => root,
    mode => 644
  }

  file {
    '/etc/hadoop/hadoop-env.sh':
      source    => 'puppet:///modules/infinite_interns/etc/hadoop/hadoop-env.sh',
      subscribe => Package['hadoop'];

    '/etc/hadoop/core-site.xml':
      source    => 'puppet:///modules/infinite_interns/etc/hadoop/core-site.xml',
      subscribe => Package['hadoop'];

    '/etc/hadoop/hdfs-site.xml':
      source    => 'puppet:///modules/infinite_interns/etc/hadoop/hdfs-site.xml',
      subscribe => Package['hadoop'];

    '/etc/hadoop/mapred-site.xml':
      source    => 'puppet:///modules/infinite_interns/etc/hadoop/mapred-site.xml',
      subscribe => Package['hadoop'];

    '/etc/init.d/hadoop':
      ensure => directory,
      mode   => '0755';

    '/etc/init.d/hadoop/common':
      source  => 'puppet:///modules/infinite_interns/etc/init.d/hadoop/common',
      require => File['/etc/init.d/hadoop'],
      mode    => '4755';

    '/etc/init.d/hadoop/namenode':
      source  => 'puppet:///modules/infinite_interns/etc/init.d/hadoop/namenode',
      require => File['/etc/init.d/hadoop'],
      mode    => '4755';

    '/etc/init.d/hadoop/secondarynamenode':
      source  => 'puppet:///modules/infinite_interns/etc/init.d/hadoop/secondarynamenode',
      require => File['/etc/init.d/hadoop'],
      mode    => '4755';

    '/etc/init.d/hadoop/datanode':
      source  => 'puppet:///modules/infinite_interns/etc/init.d/hadoop/datanode',
      require => File['/etc/init.d/hadoop'],
      mode    => '4755';

    '/etc/init.d/hadoop/jobtracker':
      source  => 'puppet:///modules/infinite_interns/etc/init.d/hadoop/jobtracker',
      require => File['/etc/init.d/hadoop'],
      mode    => '4755';

    '/etc/init.d/hadoop/tasktracker':
      source  => 'puppet:///modules/infinite_interns/etc/init.d/hadoop/tasktracker',
      require => File['/etc/init.d/hadoop'],
      mode    => '4755';
  }
}
