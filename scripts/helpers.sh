#!/usr/bin/env bash

export LANG=C
export LC_ALL=C

get_tmux_option() {
  local option
  local default_value
  local option_value
  option="$1"
  default_value="$2"
  option_value="$(tmux show-option -qv "$option")"
  if [ -z "$option_value" ]; then
    option_value="$(tmux show-option -gqv "$option")"
  fi
  if [ -z "$option_value" ]; then
    echo "$default_value"
  else
    echo "$option_value"
  fi
}

is_osx() {
  [ "$(uname)" == "Darwin" ]
}

is_freebsd() {
  [ "$(uname)" == "FreeBSD" ]
}

is_openbsd() {
  [ "$(uname)" == "OpenBSD" ]
}

is_linux() {
  [ "$(uname)" == "Linux" ]
}

is_cygwin() {
  command -v WMIC &>/dev/null
}
