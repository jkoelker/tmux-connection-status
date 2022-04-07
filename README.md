# tmux-connection-status

Enables displaying Network connection icons.

## Installing

### Via TPM (recommended)

The easiest way to install `tmux-connection-status` is via the [Tmux Plugin
Manager](https://github.com/tmux-plugins/tpm).

1. Add plugin to the list of TPM plugins in `.tmux.conf`:

    ``` tmux
    set -g @plugin 'jkoelker/tmux-connection-status'
    ```

2. Use <kbd>prefix</kbd>–<kbd>I</kbd> to install `tmux-connection-status`.

### Manual Installation

1. Clone the repository

    ``` sh
    $ git clone https://github.com/jkoelker/tmux-connection-status ~/clone/path
    ```

2. Add this line to the bottom of `.tmux.conf`

    ``` tmux
    run-shell ~/clone/path/tmux-connection-status.tmux
    ```

3. Reload the `tmux` environment

    ``` sh
    # type this inside tmux
    $ tmux source-file ~/.tmux.conf
    ```

## Use

Edit your `status-left` or `status-right` setting to include one of:

- `#{wifi_device}` - display the wifi device name
- `#{wifi_status}` - display the wifi connection status
- `#{wifi_ssid}` - display the wifi ssid
- `#{wifi_icon}` - display icon when wifi connected
- `#{wifi_bg_color}` - wifi background color
- `#{wifi_fg_color}` - wifi forground color
- `#{ethernet_device}` - display the ethernet device name
- `#{ethernet_status}` - display the ethernet connection status
- `#{ethernet_icon}` - display icon when ethernet connected
- `#{ethernet_bg_color}` - ethernet background color
- `#{ethernet_fg_color}` - ethernet foreground color
- `#{vpn_device}` - display the vpn device name
- `#{vpn_status}` - display the vpn connection status
- `#{vpn_icon}` - display icon when vpn connected
- `#{vpn_bg_color}` - vpn background color
- `#{vpn_fg_color}` - vpn foreground color

## Customization

Here are all available options with their default values:

```shell
set-option -g @wifi_connected_icon "W"
set-option -g @wifi_connected_fg_color "#[fg=darkgreen]"
set-option -g @wifi_connected_bg_color "#[fg=green]"
set-option -g @wifi_disconnected_icon ""
set-option -g @wifi_disconnected_fg_color "#[fg=darkred]"
set-option -g @wifi_disconnected_bg_color "#[fg=red]"

set-option -g @ethernet_connected_icon "E"
set-option -g @ethernet_connected_fg_color "#[fg=darkgreen]"
set-option -g @ethernet_connected_bg_color "#[fg=green]"
set-option -g @ethernet_disconnected_icon ""
set-option -g @ethernet_disconnected_fg_color "#[fg=darkred]"
set-option -g @ethernet_disconnected_bg_color "#[fg=red]"

set-option -g @vpn_connected_icon "V"
set-option -g @vpn_connected_fg_color "#[fg=darkgreen]"
set-option -g @vpn_connected_bg_color "#[fg=green]"
set-option -g @vpn_disconnected_icon ""
set-option -g @vpn_disconnected_fg_color "#[fg=darkred]"
set-option -g @vpn_disconnected_bg_color "#[fg=red]"
```

Reload your configuration for it to take effect:
<kbd>prefix</kbd>-<kbd>R</kbd> with TPM, or

``` sh
$ tmux source-file ~/.tmux.conf
```
