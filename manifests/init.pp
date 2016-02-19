class user {

  contain user::install
  contain user::config

  class { 'user::install': }
  class { 'user::config': }

  create_resources('user::create', hiera('user::create', {}))

}

