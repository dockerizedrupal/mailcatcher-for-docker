class mailcatcher {
  require mailcatcher::packages
  require mailcatcher::supervisor

  bash_exec { 'gem install mailcatcher -v 0.6.1':
    timeout => 0
  }
}
