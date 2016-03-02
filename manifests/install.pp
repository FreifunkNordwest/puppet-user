class user::install inherits user {

  package { 'sudo':
    ensure => installed,
  }

  group { $group:
    ensure => present,
    system => true,
  }

}

