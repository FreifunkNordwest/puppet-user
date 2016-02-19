class user::config {

  file_line { 'sudo_wheel_rule':
    path  => '/etc/sudoers',
    line  => '%wheel ALL=(ALL) ALL',
    match => '^%wheel',
  }

  file_line { 'useradd CREATE_HOME':
    path  => '/etc/default/useradd',
    line  => 'CREATE_HOME yes',
    match => '^CREATE_HOME',
  }

}

