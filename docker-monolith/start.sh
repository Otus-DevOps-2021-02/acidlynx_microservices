#!/bin/bash

sleep 15

/usr/bin/mongod --fork --logpath /var/log/mongod.log --config /etc/mongodb.conf

source /reddit/db_config

sleep 20

cd /reddit && puma || exit

