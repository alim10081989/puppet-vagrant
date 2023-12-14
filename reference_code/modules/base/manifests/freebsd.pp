## Class: FreeBSD
class base::freebsd inherits base::linux {
  File['/etc/passwd'] {
    group => 'wheel'
  }
  File['/etc/shadow'] {
    group => 'wheel'
  }
}
