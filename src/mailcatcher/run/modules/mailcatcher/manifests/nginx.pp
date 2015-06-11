class mailcatcher::nginx {
  if ! file_exists('/mailcatcher/ssl/certs/mailcatcher.crt') {
    require mailcatcher::nginx::ssl
  }

  file { '/etc/nginx/conf.d/default.conf':
    ensure => present,
    content => template('mailcatcher/default.conf.erb'),
    mode => 644
  }

  file { '/etc/nginx/conf.d/default-ssl.conf':
    ensure => present,
    content => template('mailcatcher/default-ssl.conf.erb'),
    mode => 644
  }
}
