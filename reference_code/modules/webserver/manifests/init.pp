## Class: WebServer
class webserver (
  String $packages  = $webserver::params::packages,
  String $vhost_dir = $webserver::params::vhost_dir
) inherits webserver::params {
  package { $packages: ensure => present }

  file { 'vhost_dir':
    ensure => directory,
    path   => $vhost_dir,
    mode   => '0750',
    owner  => 'root',
    group  => 'root',
  }
}
