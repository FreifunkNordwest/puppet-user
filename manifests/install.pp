class user::install {

  group { 'wheel':
    ensure => present,
  }

}

