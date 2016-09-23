#!/bin/bash

if [ -z "${MARIADB_DATABASE}" ]; then
    MARIADB_DATABASE=mysql
fi

if [ ! -d "/var/lib/mysql/${MARIADB_DATABASE}" ]; then
    # No database exists
    export RANDOM_PASSWORD=$(pwgen -c -n -B 10 1)
    cd /install
    ansible-playbook -i inventory createdb.yml
    cd -
fi

"$@"
