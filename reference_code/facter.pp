$whoami = $::facts['os']['family']
$certname = $::trusted['certname']

notify { "I am running on ${whoami}":
  message => "Trusted : ${certname}",
}
