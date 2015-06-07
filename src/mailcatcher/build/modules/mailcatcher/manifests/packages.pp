class mailcatcher::packages {
  package {[
      'build-essential',
      'libsqlite3-dev',
      'ruby1.9.1-dev'
    ]:
    ensure => present
  }
}
