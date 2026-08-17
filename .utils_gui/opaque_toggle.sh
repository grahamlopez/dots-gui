#!/usr/bin/env bash

active_class="$(hyprctl -j activewindow | jq -r '.class')"

if [ "$active_class" = "kitty" ]; then
  # Focused window is kitty → use kitten toggle
  #kitten @ set-background-opacity --toggle 1.0 2>&1 ~/kitten_log.txt
  kitty @ --to unix:/tmp/kitty_remote kitten set-background-opacity --toggle 1.0
else
  # Any other window → use Hyprland property toggle
  hyprctl dispatch setprop active opaque toggle
fi
