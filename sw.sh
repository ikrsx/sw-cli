#!/usr/bin/env bash

check_connection() {
  ping -c1 1.1.1.1 &> /dev/null && return 0
}

read_cache() {
  local CACHE_FILE="$HOME/.cache/sw"

  [[ -e $CACHE_FILE ]] && cat "$CACHE_FILE" && return 0
}

get_weather() {
  local CACHE_DIR="$HOME/.cache"
  local CACHE_FILE="$CACHE_DIR/sw"

  [[ -d  $CACHE_DIR ]] || mkdir -p "$CACHE_DIR"
  curl "wttr.in/$1" 2> /dev/null > "$CACHE_FILE" && cat "$CACHE_FILE"
}

if check_connection;then
  get_weather "$1"
else
  echo "Cannot create connection." > /dev/stderr
  if ! read_cache; then
    echo "Cannot read from cache." > /dev/stderr
  fi
  exit 1
fi
