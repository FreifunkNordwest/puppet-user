class user {

  class { 'user::install': } ->
  class { 'user::config': }

  contain user::install
  contain user::config

  create_resources('user::create', hiera('user::create', {}))

}

