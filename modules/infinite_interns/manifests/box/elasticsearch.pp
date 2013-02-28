# ElasticSearch Infinite Intern
class infinite_interns::box::elasticsearch {

  require java

  $url = 'http://download.elasticsearch.org/elasticsearch/elasticsearch'
  $filename = 'elasticsearch-0.20.4.deb'

  exec {
    'download-elasticsearch':
      command => "/usr/bin/wget ${url}/${filename}",
      cwd     => '/root',
      creates => "/root/${filename}",
      timeout => 0;
  }

  package {
    'elasticsearch':
      ensure   => installed,
      provider => dpkg,
      source   => "/root/${filename}";
  }

  $head = 'mobz/elasticsearch-head'
  $paramedic = 'mobz/elasticsearch-head'
  $bigdesk = 'mobz/elasticsearch-head'

  exec {
    'install-elasticsearch-head':
      command => "/usr/share/elasticsearch/bin/plugin -install ${head}",
      creates => '/usr/share/elasticsearch/plugins/head',
      notify  => Service[elasticsearch];

    'install-elasticsearch-paramedic':
      command => "/usr/share/elasticsearch/bin/plugin -install ${paramedic}",
      creates => '/usr/share/elasticsearch/plugins/paramedic',
      notify  => Service[elasticsearch];

    'install-elasticsearch-bigdesk':
      command => "/usr/share/elasticsearch/bin/plugin -install ${bigdesk}",
      creates => '/usr/share/elasticsearch/plugins/bigdesk',
      notify  => Service[elasticsearch];
  }

  service {
    'elasticsearch':
      ensure => running,
      enable => true;
  }

  Exec[download-elasticsearch] ->
    Package[elasticsearch] ->
    Exec[install-elasticsearch-head] ->
    Exec[install-elasticsearch-paramedic] ->
    Exec[install-elasticsearch-bigdesk] ->
    Service[elasticsearch]

}