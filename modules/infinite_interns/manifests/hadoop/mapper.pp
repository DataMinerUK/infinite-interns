# Start Hadoop mapper services
class infinite_interns::hadoop::mapper {

  require infinite_interns::hadoop::core
  require infinite_interns::hadoop::configuration

  service {
    'hadoop-jobtracker':
      ensure    => running,
      provider  => 'init',
      hasstatus => true,
      start     => '/etc/init.d/hadoop/jobtracker start',
      status    => '/etc/init.d/hadoop/jobtracker status',
      stop      => '/etc/init.d/hadoop/jobtracker stop';

    'hadoop-tasktracker':
      ensure    => running,
      provider  => 'init',
      hasstatus => true,
      start     => '/etc/init.d/hadoop/tasktracker start',
      status    => '/etc/init.d/hadoop/tasktracker status',
      stop      => '/etc/init.d/hadoop/tasktracker stop';
  }

  Service['hadoop-jobtracker'] -> Service['hadoop-tasktracker']
}