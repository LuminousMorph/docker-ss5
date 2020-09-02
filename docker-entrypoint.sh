#!/bin/bash

if [[ `cat /etc/opt/ss5/ss5.passwd |wc -l` -eq 0 ]]; then 
  USER='default'
  PWD='default'
  if [[ -z $S5_USER ]]; then
    USER='default'
  else
    USER=$S5_USER
  fi
  if [[ -z $S5_PASSWORD ]]; then
    PWD='default'
  else
    PWD=$S5_PASSWORD
  fi
  echo $USER' '$PWD>>/etc/opt/ss5/ss5.passwd
else
  echo "inited"
fi

service ss5 start

tail -f /dev/null