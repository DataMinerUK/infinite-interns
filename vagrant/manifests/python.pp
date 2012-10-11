# Add python installation
class python {

  require setup

  package {
    [
      'ipython',
      'python-setuptools',
      'python-bs4',
      'python-chardet',
      'python-dateutil',
      'python-enchant',
      'python-facebook',
      'python-feedparser',
      'python-fs',
      'python-gdata',
      'python-geohash',
      'python-geoip',
      'python-gps',
      'python-html2text',
      'python-htmlgen',
      'python-httplib2',
      'python-imaging',
      'python-lxml',
      'python-libxml2',
      'python-markdown',
      'python-markupsafe',
      'python-prettytable',
      'python-scour',
      'python-scrapy',
      'python-simplejson',
      'python-tz',
      'python-urlgrabber',
      'python-yaml'
    ]: ensure => installed;
  }

}
