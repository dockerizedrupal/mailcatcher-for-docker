class packages {
  package {[
      'build-essential',
      'sqlite3',
      'libsqlite3-dev',
      'ruby1.9.1-dev',
      'rubygems'
    ]:
    ensure => present
  }
}

class mailcatcher_supervisor {
  file { '/etc/supervisor/conf.d/mailcatcher.conf':
    ensure => present,
    source => '/tmp/build/etc/supervisor/conf.d/mailcatcher.conf'
  }
}

class mailcatcher {
  include mailcatcher_supervisor

  exec { '/bin/bash -l -c "gem install mailcatcher"':
    timeout => 0
  }
}

node default {
  file { '/run.sh':
    ensure => present,
    source => '/tmp/build/run.sh',
    mode => 755
  }

  include packages
  include mailcatcher

  Class['packages'] -> Class['mailcatcher']

  exec { 'apt-get update':
    path => ['/usr/bin'],
    before => Class['packages']
  }
}