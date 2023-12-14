## Class: WebSever Params
class webserver::params {
  $packages = $operatingsystem ? {
    /(?i-mx:ubuntu|debian)/        => 'apache2',
    /(?i-mx:centos|fedora|redhat)/ => 'ntp',
  }
  $vhost_dir = $operatingsystem ? {
    /(?i-mx:ubuntu|debian)/        => '/etc/apache2/sites-enabled',
    /(?i-mx:centos|fedora|redhat)/ => '/etc/nginx/conf.d',
  }
}
