class user {

  require user::install
  require user::config

  create_resources('user::managed', hiera('user::managed', {}))

}

