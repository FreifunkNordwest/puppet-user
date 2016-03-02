class user::config inherits user {

  file_line { 'sudo_rule':
    path  => '/etc/sudoers',
    line  => "%${group} ${sudoers}",
    match => "^%${group}",
  }

  file_line { 'useradd CREATE_HOME':
    path  => '/etc/default/useradd',
    line  => 'CREATE_HOME yes',
    match => '^CREATE_HOME',
  }

}

