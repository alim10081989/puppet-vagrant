# Install Packages #
class install_package {
  Package { ensure => 'installed' }   ## 'purged' for uninstalling pkgs 
  $enhancers = ['screen', 'strace']
  package { $enhancers: }
}

class { 'install_package' : }
