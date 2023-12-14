## Class: Verify
class nginx::verify {
  notify { 'verify':
    message => 'Currently in verify class under nginx module',
  }
}
