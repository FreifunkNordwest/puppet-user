class user {

  require user::install
  require user::config

  create_resources('user::create', hiera('user::create', {}))

}

