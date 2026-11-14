#!/usr/bin/env bash

check_connection() {
  ping -c1 1.1.1.1 &> /dev/null && return 0
}

if ! check_connection;then
  echo "Cannot create connection." 
  exit 1
fi
