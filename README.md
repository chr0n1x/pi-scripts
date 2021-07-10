# pi-scripts

Raspbian OS Scripts &amp; systemd Things

# Installation

`make` should just work. So just make sure that you have `make`.

# List of Features

- Bluetooth Auto-Pairing
  - `pair-all-bt`: a simple/stupid script that batches `bluetoothctl` commands to start-up bluetooth and connect to trusted devices.
    - note that this does not actually scan & pairs/trusts your devices.
    - For more info on how to do that, [check out this unix.stackexchange post](https://unix.stackexchange.com/a/101422)
  - systemd unit to auto-run `pair-all-bt` right before start-up so that things like your BT Keyboard register.
- Auto-Starting internet connection for specific devices
  - dumb wrapper to run `wpa_supplicant` on startup

# Misc

I use this with [`pssh`](https://github.com/lilydjwg/pssh) to update my entire RPi cluster. Ansible scripts to come soon. Maybe.

# K8s

Various K8s resources coming later.

## Misc Notes

- Tried [this calico configuration on my cluster](https://gist.github.com/joshrosso/7eda940337a89c97b690bc855139ca61)
- Using [this Traefik config](https://raw.githubusercontent.com/traefik/traefik/v1.7/examples/k8s/traefik-ds.yaml)
