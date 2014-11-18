class mailcatcher {
  require mailcatcher::packages
  require mailcatcher::supervisor

  exec { '/bin/bash -l -c "gem install mailcatcher -v 0.5.12"':
    timeout => 0
  }
}
