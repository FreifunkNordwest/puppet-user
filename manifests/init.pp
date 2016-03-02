class user (
  String $group   = $user::params::group,
  String $sudoers = $user::params::sudoers,
) inherits {

  class { 'user::install': } ->
  class { 'user::config': }

  contain user::install
  contain user::config

  create_resources('user::create', hiera('user::create', {}))

}

