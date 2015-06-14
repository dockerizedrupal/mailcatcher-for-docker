class mailcatcher::nginx {
  require mailcatcher::nginx::packages
  require mailcatcher::nginx::supervisor

  file { '/etc/nginx/conf.d/example_ssl.conf':
    ensure => absent
  }

  file { '/etc/nginx/conf.d/default.conf':
    ensure => absent
  }

  file { '/etc/nginx/nginx.conf':
    ensure => present,
    source => 'puppet:///modules/mailcatcher/etc/nginx/nginx.conf',
    mode => 644
  }
}
