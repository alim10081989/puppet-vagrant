## resource Template
define pkg_install::vhost (
  String $docroot = "/var/www/${name}",
  Variant[String, Integer] $port,
) {
  file { "/etc/httpd/conf.d/vhost_${name}.conf":
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    content => epp('pkg_install/vhost.epp', {
        'port'        => $port,
        'docroot'     => $docroot,
        'server_name' => $name
    }),
  }

  file { $docroot:
    ensure => directory,
    owner  => 'root',
    group  => 'root',
  }
}
