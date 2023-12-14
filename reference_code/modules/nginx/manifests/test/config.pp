## Class: Config
class nginx::config::config {
  notify { 'config':
    message => 'Currentl inside config class of nginx module',
  }
}
