#!/bin/bash

monitor=${1?"must specify a monitor"}

disabled=$(hyprctl -j monitors all | jq --arg name "$monitor" '.[] | select(.name == $name) | .disabled')

if [ -z "$disabled" ] || [ "$disabled" = "true" ]; then
  systemctl start enable-tv.service
  hyprctl keyword monitor "$monitor,enable"
else
  hyprctl keyword monitor "$monitor,disable"
fi
