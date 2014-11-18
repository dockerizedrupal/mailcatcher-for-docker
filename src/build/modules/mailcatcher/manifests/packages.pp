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
    require => Exec['apt-get update']
  }
}
