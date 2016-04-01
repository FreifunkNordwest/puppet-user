class user::config inherits user {

  file_line { 'sudo_rule':
    path  => '/etc/sudoers',
    line  => "%${group} ${sudoers}",
    match => "^%${group}",
  }

  file {
    default:
      ensure => file,
      owner  => 'root',
      group  => 'root',
      mode   => '0644';
      '/etc/default/useradd':
        source => 'puppet:///modules/user/useradd';
  }

}
