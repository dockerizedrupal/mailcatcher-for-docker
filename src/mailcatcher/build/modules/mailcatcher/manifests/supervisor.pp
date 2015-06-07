class mailcatcher::supervisor {
  file { '/etc/supervisor/conf.d/mailcatcher.conf':
    ensure => present,
    source => 'puppet:///modules/mailcatcher/etc/supervisor/conf.d/mailcatcher.conf',
    mode => 644
  }
}
