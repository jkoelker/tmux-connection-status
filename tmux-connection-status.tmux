#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$CURRENT_DIR/scripts/helpers.sh"

interpolation=(
  "\#{wifi_device}"
  "\#{wifi_status}"
  "\#{wifi_ssid}"
  "\#{wifi_icon}"
  "\#{wifi_bg_color}"
  "\#{wifi_fg_color}"
  "\#{ethernet_device}"
  "\#{ethernet_status}"
  "\#{ethernet_icon}"
  "\#{ethernet_bg_color}"
  "\#{ethernet_fg_color}"
  "\#{vpn_device}"
  "\#{vpn_status}"
  "\#{vpn_icon}"
  "\#{vpn_bg_color}"
  "\#{vpn_fg_color}"
)

commands=(
  "#($CURRENT_DIR/scripts/connection.sh wifi device)"
  "#($CURRENT_DIR/scripts/connection.sh wifi status)"
  "#($CURRENT_DIR/scripts/connection.sh wifi ssid)"
  "#($CURRENT_DIR/scripts/connection.sh wifi icon)"
  "#($CURRENT_DIR/scripts/connection.sh wifi bg_color)"
  "#($CURRENT_DIR/scripts/connection.sh wifi fg_color)"
  "#($CURRENT_DIR/scripts/connection.sh ethernet device)"
  "#($CURRENT_DIR/scripts/connection.sh ethernet status)"
  "#($CURRENT_DIR/scripts/connection.sh ethernet icon)"
  "#($CURRENT_DIR/scripts/connection.sh ethernet bg_color)"
  "#($CURRENT_DIR/scripts/connection.sh ethernet fg_color)"
  "#($CURRENT_DIR/scripts/connection.sh vpn device)"
  "#($CURRENT_DIR/scripts/connection.sh vpn status)"
  "#($CURRENT_DIR/scripts/connection.sh vpn icon)"
  "#($CURRENT_DIR/scripts/connection.sh vpn bg_color)"
  "#($CURRENT_DIR/scripts/connection.sh vpn fg_color)"
)

set_tmux_option() {
  local option=$1
  local value=$2
  tmux set-option -gq "$option" "$value"
}

do_interpolation() {
  local interpolated="$1"
  for ((i = 0; i < ${#commands[@]}; i++)); do
    interpolated=${interpolated//${interpolation[$i]}/${commands[$i]}}
  done
  echo "$interpolated"
}

update_tmux_option() {
  local option
  local option_value
  local new_option_value
  option=$1
  option_value=$(get_tmux_option "$option")
  new_option_value=$(do_interpolation "$option_value")
  set_tmux_option "$option" "$new_option_value"
}

main() {
  update_tmux_option "status-right"
  update_tmux_option "status-left"
}
main
