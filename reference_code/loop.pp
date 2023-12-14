$users = ['kate', 'susan', 'fred', 'tom', 'harry']

$users.each | String $u | {
  user { $u:
    ensure     => present,
    managehome => true,
  }

  file { "/home/${u}/.bashrc":
    ensure  => file,
    owner   => $u,
    group   => $u,
    content => 'export PATH=$PATH:/opt/puppetlabs/puppet/bin',
  }
}
