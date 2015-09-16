class mailcatcher::timezone {
  bash_exec { "timedatectl set-timezone $timezone": }
}
