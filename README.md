# puppet-user

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with user](#setup)
    * [Beginning with user](#beginning-with-user)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

Manages user accounts with ssh authorized keys.

## Usage

```puppet
user::managed { 'username':
  authorized_keys => {
    'username@localmachine' => {
      type => 'ssh-rsa',
      key  => 'someawesomekey',
    },
  },
  groups => [ 'wheel' ],
  shell  => '/bin/zsh',
  status => 'present',
}
```

## Hiera
All the data used by this module is managed in hierra. If you want to allow all users to access all servers, then it is a good choice to define the data for this module in a `/etc/puppetlabs/code/environments/<ENVIRONMENT>/data/common.yaml` hierra file.

```hiera
user::managed:
  username:
    status: present
    groups:
      - sudo
    authorized_keys:
      username:
        type: ssh-rsa
        key: someawesomekey
```

## Managing users
### Adding users
To add a new user, just add a new user line in hierra.

### Modifying users
To modify a user (i.e. add new group) just edit the line in hierra.

### Deleting users
To delete a new user, just set `status` of a user to `absent` in the hierra data.

## Reference

* define user::managed
  * $authorized_keys (optional, default [])
  * $groups (optional, default [])
  * $shell (optional, default '/bin/zsh')
  * $status (optional, default 'present', option, 'present' or 'absent' or 'role')

## Limitations

### OS compatibility
* Debian 8

## Development

### How to contribute
Fork the project, work on it and submit pull requests, please.
