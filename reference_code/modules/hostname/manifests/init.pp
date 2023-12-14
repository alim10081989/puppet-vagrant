## Class:: HOSTNAME
class hostname {
  $server_name = 'oradb-d-001'
  $environment_name = hostname::environment($server_name)
  notify { "My environment is ${environment_name}": }
}
