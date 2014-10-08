# Python Infinite Intern
class infinite_interns::box::python {

  require python::base
  require gcc

  package {
    [
      'virtualenv',
      'python-dateutil',
      'requests',
      'messytables',
      'beautifulsoup4',
      'kales',
      'lxml',
      'scraperwiki',
      'dumptruck',
      'dataset',
      'nltk',
      'jinja2',
      'pyzmq',
      'tornado',
      'ipython',
      'pdfminer',
      'python-documentcloud',
      'django',
      'Flask',
      'Flask-SQLAlchemy'
    ]: ensure   => latest,
       provider => 'pip';
  }

  package {
    [
      'libxml2-dev',
      'libxslt-dev',
      'qpdf',
      'sqlite3'
    ]: ensure => latest;
  }

  file {
    '/etc/init.d/ipython-notebook':
      source => 'puppet:///modules/infinite_interns/etc/init.d/ipython-notebook',
      owner  => root,
      group  => root,
      mode   => '0744';

    '/etc/init/ipython-notebook.conf':
      source => 'puppet:///modules/infinite_interns/etc/init/ipython-notebook.conf',
      owner  => root,
      group  => root,
      mode   => '0644';
  }

  service {
    'ipython-notebook':
      ensure   => running,
      enable   => true,
      provider => 'upstart';
  }

  Package['jinja2', 'pyzmq', 'tornado'] -> Package['ipython']
  File['/etc/init.d/ipython-notebook'] -> Service[ipython-notebook]
  File['/etc/init/ipython-notebook.conf'] -> Service[ipython-notebook]

  Package[libxml2-dev] -> Package[lxml]
  Package[libxslt-dev] -> Package[lxml]

  Package[lxml] -> Package[messytables]
  Package[lxml] -> Package[scraperwiki]
}

class infinite_interns::box::python::base {
  package {
    [
      'python-pip',
      'python-dev'
    ]: ensure => latest;
  }
}
