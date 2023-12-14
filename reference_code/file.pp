# Class: http
class http {
  # resources
  file { '/etc/httpd/conf/httpd.conf':
    ensure  => file,
    content => 'Hi this is working',
  }
}
