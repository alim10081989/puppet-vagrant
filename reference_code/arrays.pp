$users = ['bob', 'susan', 'kate', 'fred']

user { $users:
  ensure => present,
}

notify { 'Test':
  message => 'Working with notify message',
}
