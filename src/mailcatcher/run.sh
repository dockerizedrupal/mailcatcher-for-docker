#!/usr/bin/env bash

puppet apply --modulepath=/src/mailcatcher/run/modules /src/mailcatcher/run/run.pp

supervisord -c /etc/supervisor/supervisord.conf
