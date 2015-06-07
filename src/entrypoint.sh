#!/usr/bin/env bash

case "${1}" in
  build)
    /bin/su - root -mc "apt-get update && /src/mailcatcher/build.sh && /src/mailcatcher/clean.sh"
    ;;
  run)
    /bin/su - root -mc "source /src/mailcatcher/variables.sh && /src/mailcatcher/run.sh"
    ;;
esac
