## Class: PKG_INSTALL
class pkg_install (
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
    content => epp('pkg_install/httpd.conf.epp', {
        'port'    => $port,
        'docroot' => $docroots
    }),
    require => Package[$package_name],
  }

  service { $service_name:
    ensure    => running,
    enable    => true,
    subscribe => File[$config_file],
  }

  file { '/var/www/html':
    ensure => directory,
  }
}
