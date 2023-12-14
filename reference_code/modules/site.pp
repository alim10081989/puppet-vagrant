node 'agent.localdomain' {
  include sysadmins
  class { 'pkg_install' :
    port    => 80,
    docroot => '/var/www/html',
  }
  include motd

  pkg_install::vhost { 'acme.com':
    port    => '8080',
    docroot => '/var/www/acme.com',
  }

  pkg_install::vhost { 'foo.com':
    port    => '8080',
    docroot => '/var/www/foo.com',
  }

  pkg_install::vhost { 'tango.com':
    port    => '8080',
    docroot => '/var/www/tango.com',
  }

  include ['nginx', 'nginx::verify', 'nginx::config::config']
  include webserver
  include ['base', 'base::freebsd']
}
