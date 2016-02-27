define user::create (
  Hash          $authorized_keys = {},
  Array[String] $groups          = [],
  String        $shell           = '/bin/zsh',
) {

  include user

  group { $title:
    ensure => present,
  }

  user { $title:
    ensure         => present,
    gid            => $title,
    groups         => $groups,
    shell          => $shell,
    purge_ssh_keys => true,
    expiry         => absent,
    password       => '!',
    home           => "/home/${title}",
    managehome     => true,
  }

  $authorized_keys.each | $key, $value | {
    ssh_authorized_key { $key:
      user => $title,
      type => $value['type'],
      key  => $value[key],
    }
  }

}

