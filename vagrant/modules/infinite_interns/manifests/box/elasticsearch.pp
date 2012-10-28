# ElasticSearch Infinite Intern
class infinite_interns::box::elasticsearch {

  require common::devel

  $url = 'https://github.com/downloads/elasticsearch/elasticsearch'
  $filename = 'elasticsearch-0.19.11.deb'

  exec {
    "download-elasticsearch-deb":
      command => "/usr/bin/wget ${url}/${filename}",
      cwd     => '/var/cache/apt/archives',
      creates => "/var/cache/apt/archives/${filename}",
      timeout => 0;
  }

  package {
    elasticsearch:
      ensure   => installed,
      provider => dpkg,
      source   => "/var/cache/apt/archives/${filename}";
  }

  exec {
    'install-elasticsearch-head':
      command => '/usr/share/elasticsearch/bin/plugin -install mobz/elasticsearch-head',
      creates => '/usr/share/elasticsearch/plugins/head',
      notify  => Service[elasticsearch];

    'install-elasticsearch-paramedic'
      command => '/usr/share/elasticsearch/bin/plugin -install karmi/elasticsearch-paramedic':
      creates => '/usr/share/elasticsearch/plugins/paramedic',
      notify => Service[elasticsearch];

    'install-elasticsearch-bigdesk':
      command =>'/usr/share/elasticsearch/bin/plugin -install lukas-vlcek/bigdesk':
      creates => '/usr/share/elasticsearch/plugins/bigdesk',
      notify => Service[elasticsearch];
  }

  service {
    elasticsearch:
      ensure => running,
      enable => true;
  }

  Exec[download-elasticsearch-deb] ->
    Package[elasticsearch] ->
    Exec[install-elasticsearch-head] ->	
    Exec[install-elasticsearch-paramedic] ->
    Exec[install-elasticsearch-bigdesk] ->
    Service[elasticsearch]

}