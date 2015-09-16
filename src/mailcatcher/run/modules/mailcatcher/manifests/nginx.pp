class mailcatcher::nginx {
  include mailcatcher::nginx::timeout

  if $http_basic_auth_password {
    include mailcatcher::nginx::http_basic_auth
  }

  if $http and $https {
    if ! file_exists('/mailcatcher/ssl/certs/mailcatcher.crt') {
      require mailcatcher::nginx::ssl
    }

    file { '/etc/nginx/conf.d/http_https.conf':
      ensure => present,
      content => template('mailcatcher/http_https.conf.erb'),
      mode => 644
    }

    file { '/etc/nginx/conf.d/http_https-ssl.conf':
      ensure => present,
      content => template('mailcatcher/http_https-ssl.conf.erb'),
      mode => 644
    }
  }
  elsif $http {
    file { '/etc/nginx/conf.d/http.conf':
      ensure => present,
      content => template('mailcatcher/http.conf.erb'),
      mode => 644
    }
  }
  elsif $https {
    if ! file_exists('/mailcatcher/ssl/certs/mailcatcher.crt') {
      require mailcatcher::nginx::ssl
    }

    file { '/etc/nginx/conf.d/https.conf':
      ensure => present,
      content => template('mailcatcher/https.conf.erb'),
      mode => 644
    }

    file { '/etc/nginx/conf.d/https-ssl.conf':
      ensure => present,
      content => template('mailcatcher/https-ssl.conf.erb'),
      mode => 644
    }
  }
}
