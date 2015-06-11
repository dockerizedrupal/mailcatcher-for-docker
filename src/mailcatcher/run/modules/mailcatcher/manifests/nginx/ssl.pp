class mailcatcher::nginx::ssl {
  bash_exec { 'mkdir -p /mailcatcher/ssl': }

  bash_exec { 'mkdir -p /mailcatcher/ssl/private':
    require => Bash_exec['mkdir -p /mailcatcher/ssl']
  }

  bash_exec { 'mkdir -p /mailcatcher/ssl/certs':
    require => Bash_exec['mkdir -p /mailcatcher/ssl/private']
  }

  file { '/root/opensslCA.cnf':
    ensure => present,
    content => template('mailcatcher/opensslCA.cnf.erb'),
    require => Bash_exec['mkdir -p /mailcatcher/ssl/certs']
  }

  bash_exec { 'openssl genrsa -out /mailcatcher/ssl/private/mailcatcherCA.key 4096':
    timeout => 0,
    require => File['/root/opensslCA.cnf']
  }

  bash_exec { "openssl req -sha256 -x509 -new -days 3650 -extensions v3_ca -config /root/opensslCA.cnf -key /mailcatcher/ssl/private/mailcatcherCA.key -out /mailcatcher/ssl/certs/mailcatcherCA.crt":
    timeout => 0,
    require => Bash_exec['openssl genrsa -out /mailcatcher/ssl/private/mailcatcherCA.key 4096']
  }

  bash_exec { 'openssl genrsa -out /mailcatcher/ssl/private/mailcatcher.key 4096':
    timeout => 0,
    require => Bash_exec["openssl req -sha256 -x509 -new -days 3650 -extensions v3_ca -config /root/opensslCA.cnf -key /mailcatcher/ssl/private/mailcatcherCA.key -out /mailcatcher/ssl/certs/mailcatcherCA.crt"]
  }

  file { '/root/openssl.cnf':
    ensure => present,
    content => template('mailcatcher/openssl.cnf.erb'),
    require => Bash_exec['openssl genrsa -out /mailcatcher/ssl/private/mailcatcher.key 4096']
  }

  bash_exec { "openssl req -sha256 -new -config /root/openssl.cnf -key /mailcatcher/ssl/private/mailcatcher.key -out /mailcatcher/ssl/certs/mailcatcher.csr":
    timeout => 0,
    require => File['/root/openssl.cnf']
  }

  bash_exec { "openssl x509 -req -sha256 -CAcreateserial -days 3650 -extensions v3_req -extfile /root/opensslCA.cnf -in /mailcatcher/ssl/certs/mailcatcher.csr -CA /mailcatcher/ssl/certs/mailcatcherCA.crt -CAkey /mailcatcher/ssl/private/mailcatcherCA.key -out /mailcatcher/ssl/certs/mailcatcher.crt":
    timeout => 0,
    require => Bash_exec["openssl req -sha256 -new -config /root/openssl.cnf -key /mailcatcher/ssl/private/mailcatcher.key -out /mailcatcher/ssl/certs/mailcatcher.csr"]
  }
}
