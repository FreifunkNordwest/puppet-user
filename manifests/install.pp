class user::install {

  package { 'sudo':
    ensure => installed,
  }

  package { 'zsh':
    ensure => installed,
  }

  group { 'wheel':
    ensure => present,
  }

}
