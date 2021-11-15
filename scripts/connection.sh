#!/usr/bin/env bash

# shellcheck disable=SC2034  # variables used via dynamic namind

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$CURRENT_DIR/helpers.sh"

wifi_connected_icon="W"
wifi_connected_fg_color="#[fg=darkgreen]"
wifi_connected_bg_color="#[fg=green]"
wifi_disconnected_icon=""
wifi_disconnected_fg_color="#[fg=darkred]"
wifi_disconnected_bg_color="#[fg=red]"

ethernet_connected_icon="E"
ethernet_connected_fg_color="#[fg=darkgreen]"
ethernet_connected_bg_color="#[fg=green]"
ethernet_disconnected_icon=""
ethernet_disconnected_fg_color="#[fg=darkred]"
ethernet_disconnected_bg_color="#[fg=red]"

vpn_connected_icon="V"
vpn_connected_fg_color="#[fg=darkgreen]"
vpn_connected_bg_color="#[fg=green]"
vpn_disconnected_icon=""
vpn_disconnected_fg_color="#[fg=darkred]"
vpn_disconnected_bg_color="#[fg=red]"

get_status() {
    local type
    type=$1

    nmcli --terse device status | grep "${type}" | head -n 1
}

print_for_status() {
    local status
    local connected
    local disconnected
    status="$1"
    connected="$2"
    disconnected="$3"

    if [ "$status" == "connected" ]; then
        echo "$connected"
    elif [ "$status" == "disconnected" ]; then
        echo "$disconnected"
    else
        echo "$disconnected"
    fi
}

main() {
    local type
    local what
    local connected
    local disconnected

    type=$1
    what=$2
    connected="${type}_connected_${what}"
    disconnected="${type}_disconnected_${what}"

    case "${what}" in
        "device")
            get_status "${type}" | cut -d: -f1
            ;;
        "ssid")
            get_status "${type}" | cut -d: -f4
            ;;
        "status")
            get_status "${type}" | cut -d: -f3
            ;;
        *)
            print_for_status \
                "$(get_status "${type}" | cut -d: -f3)" \
                "$(get_tmux_option \
                    "@${type}_connected_${what}" "${!connected}")" \
                "$(get_tmux_option \
                    "@${type}_disconnected_${what}" "${!disconnected}")"
            ;;
    esac

}

main "$@"
