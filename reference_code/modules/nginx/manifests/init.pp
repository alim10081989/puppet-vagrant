## Class: NGINX
class nginx {
  $app = 'nginx'

  package { 'uninstall_httpd':
    ensure => 'purged',
    name   => 'httpd',
  }

  package { 'epel-release':
    ensure => 'installed',
    notify => Package[$app],
  }

  package { $app:
    ensure  => 'installed',
    require => Package['uninstall_httpd'],
  }

  file { '/var/www/bogo':
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
    notify => File['/var/www/bogo/index.html'],
  }

  file { '/var/www/bogo/index.html':
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    content => 'bogo site',
    notify  => File["/etc/${app}/conf.d/default"],
  }

  service { $app:
    ensure  => 'running',
    enable  => true,
    require => Package[$app],
  }

  file { "/etc/${app}/conf.d/default":
    source => "puppet:///modules/${app}/bogo.conf",
    notify => Service[$app],
  }
}
