class user::install {

  package { 'sudo':
    ensure => installed,
  }

  group { 'wheel':
    ensure => present,
  }

}

