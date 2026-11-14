#!/usr/bin/env bash

check_connection() {
  ping -c1 1.1.1.1 &> /dev/null && return 0
}

read_cache() {
  local CACHE_FILE="$HOME/.cache/sw"

  [[ -e $CACHE_FILE ]] && cat "$CACHE_FILE" && return 0
}

if ! check_connection;then
  echo "Cannot create connection." > /dev/stderr
  if ! read_cache; then
    echo "Cannot read from cache." > /dev/stderr
    exit 1
  fi
fi
