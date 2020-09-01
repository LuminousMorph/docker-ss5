#!/bin/bash

USER='default'
PWD='default'

if [ -z $S5_USER ]; then
  USER=$S5_USER
fi

if [ -z $S5_PASSWORD ]; then
  PWD=$S5_PASSWORD
fi

echo '$USER $S5_PASSWORD'>>/etc/opt/ss5/ss5.passwd

service ss5 start

tail -f /dev/null