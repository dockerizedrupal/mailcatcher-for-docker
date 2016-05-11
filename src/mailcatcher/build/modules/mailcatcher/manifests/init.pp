class mailcatcher {
  require mailcatcher::nginx
  require mailcatcher::packages
  require mailcatcher::supervisor

  bash_exec { 'gem install mailcatcher -v 0.6.4':
    timeout => 0
  }
}
