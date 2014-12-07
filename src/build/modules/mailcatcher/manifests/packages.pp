class mailcatcher::packages {
  exec { 'apt-get update':
    path => ['/usr/bin']
  }

  package {[
      'build-essential',
      'libsqlite3-dev',
      'ruby1.9.1-dev'
    ]:
    ensure => present,
    require => Exec['apt-get update'],
    before => Exec['rm -rf /var/lib/apt/lists']
  }

  exec { 'apt-get clean':
    path => ['/usr/bin']
  }

  exec { 'rm -rf /var/lib/apt/lists':
    path => ['/bin'],
    require => Exec['apt-get clean']
  }
}
