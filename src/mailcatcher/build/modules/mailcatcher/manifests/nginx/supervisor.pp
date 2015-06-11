class mailcatcher::nginx::supervisor {
  file { '/etc/supervisor/conf.d/nginx.conf':
    ensure => present,
    source => 'puppet:///modules/mailcatcher/etc/supervisor/conf.d/nginx.conf',
    mode => 644
  }
}
