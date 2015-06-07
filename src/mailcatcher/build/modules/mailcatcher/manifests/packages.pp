class mailcatcher::packages {
  package {[
      'build-essential',
      'libsqlite3-dev',
      'ruby-dev'
    ]:
    ensure => present
  }
}
