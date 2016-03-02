define user::managed (
  Hash          $authorized_keys = {},
  Array[String] $groups          = [],
  String        $status          = 'present',
  String        $shell           = '/bin/zsh',
) {

  include user

  group { $title:
    ensure => $status,
  }

  user { $title:
    ensure         => $status,
    gid            => $title,
    groups         => $groups,
    shell          => $shell,
    purge_ssh_keys => true,
    expiry         => absent,
    password       => '*',
    home           => "/home/${title}",
    managehome     => true,
  }

  if $status == 'present' {
    $authorized_keys.each | $key, $value | {
      ssh_authorized_key { $key:
        user => $title,
        type => $value['type'],
        key  => $value[key],
      }
    }
  }
}
