## Class: HTTPD
class httpd (
  Integer $port = 80,
  String $docroot = '/var/www/html'
) {

  $package_name = 'httpd'
  $service_name = 'httpd'
  $config_file = '/etc/httpd/conf/httpd.conf'

  package { $package_name:
    ensure => 'installed',
  }

  file { $config_file:
    ensure  => file,
    content => epp('httpd/httpd.conf.epp', {
        'port'    => $port,
        'docroot' => $docroot
    }),
    require => Package[$package_name],
  }

  service { $service_name:
    ensure    => running,
    enable    => true,
    subscribe => File[$config_file],
  }

  file { $docroot:
    ensure => directory,
  }
}
