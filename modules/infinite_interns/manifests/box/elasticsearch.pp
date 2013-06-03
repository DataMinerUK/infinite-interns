# ElasticSearch Infinite Intern
class infinite_interns::box::elasticsearch {

  require java

  $url = 'http://download.elasticsearch.org/elasticsearch/elasticsearch'
  $filename = 'elasticsearch-0.90.1.deb'

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

  file {
    '/etc/default/elasticsearch':
      source => 'puppet:///modules/infinite_interns/etc/default/elasticsearch',
      owner  => root,
      group  => root,
      mode   => '0644';
  }

  $head = 'mobz/elasticsearch-head'
  $paramedic = 'karmi/elasticsearch-paramedic'
  $bigdesk = 'lukas-vlcek/bigdesk'
  $segmentspy = 'polyfractal/elasticsearch-segmentspy'
  $inquisitor = 'polyfractal/elasticsearch-inquisitor'

  exec {
    'install-elasticsearch-head':
      command => "/usr/share/elasticsearch/bin/plugin -install ${head}",
      creates => '/usr/share/elasticsearch/plugins/head';

    'install-elasticsearch-paramedic':
      command => "/usr/share/elasticsearch/bin/plugin -install ${paramedic}",
      creates => '/usr/share/elasticsearch/plugins/paramedic';

    'install-elasticsearch-bigdesk':
      command => "/usr/share/elasticsearch/bin/plugin -install ${bigdesk}",
      creates => '/usr/share/elasticsearch/plugins/bigdesk';

    'install-elasticsearch-segmentspy':
      command => "/usr/share/elasticsearch/bin/plugin -install ${segmentspy}",
      creates => '/usr/share/elasticsearch/plugins/segmentspy';

    'install-elasticsearch-inquisitor':
      command => "/usr/share/elasticsearch/bin/plugin -install ${inquisitor}",
      creates => '/usr/share/elasticsearch/plugins/inquisitor';
  }

  service {
    'elasticsearch':
     ensure => running,
      enable => true;
  }

  Exec[download-elasticsearch] ->
    Package[elasticsearch] ->
    File['/etc/default/elasticsearch'] ->
    Exec[install-elasticsearch-head] ->
    Exec[install-elasticsearch-paramedic] ->
    Exec[install-elasticsearch-bigdesk] ->
    Exec[install-elasticsearch-segmentspy] ->
    Exec[install-elasticsearch-inquisitor] ->
    Service[elasticsearch]

}