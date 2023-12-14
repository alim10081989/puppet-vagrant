## Class Install_Package
class install_package {
  Package { ensure => 'purged' }
  $enhancers = ['screen', 'strace']
  package { $enhancers: }
}

class { 'install_package' : }
