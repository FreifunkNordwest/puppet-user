class user::config {

  file {
    default:
      ensure => file,
      owner  => 'root',
      group  => 'root',
      mode   => '0440';
      '/etc/sudoers':
        source => 'puppet:///modules/user/sudoers';
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
