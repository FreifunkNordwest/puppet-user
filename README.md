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

## Setup

### Beginning with user

```puppet
user::create { 'username':
  authorized_keys => {
    'username@localmachine' => {
      type => 'ssh-rsa',
      key  => 'someawesomekey',
    },
  },
  groups => [ 'sudo' ],
}
```

## Usage

```puppet
user::create { 'username':
  authorized_keys => {
    'username@localmachine' => {
      type => 'ssh-rsa',
      key  => 'someawesomekey',
    },
  },
  groups => [ 'sudo' ],
  shell  => '/bin/zsh',
}
```

## Reference

* class user
  * $group (optional, default 'sudo')
  * $sudoers (optional, default 'ALL = NOPASSWD: ALL')

* define user::create
  * $authorized_keys (optional, default [])
  * $groups (optional, default [])
  * $shell (optional, default '/bin/zsh')

## Limitations

### OS compatibility
* Debian 8

## Development

### How to contribute
Fork the project, work on it and submit pull requests, please.

