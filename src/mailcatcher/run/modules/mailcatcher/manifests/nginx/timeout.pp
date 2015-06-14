class mailcatcher::nginx::timeout {
  file { '/etc/nginx/conf.d/timeout.conf':
    ensure => present,
    content => template('mailcatcher/timeout.conf.erb'),
    mode => 644
  }
}
