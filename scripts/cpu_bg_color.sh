#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

cpu_tier8_bg_color=""
cpu_tier7_bg_color=""
cpu_tier6_bg_color=""
cpu_tier5_bg_color=""
cpu_tier4_bg_color=""
cpu_tier3_bg_color=""
cpu_tier2_bg_color=""
cpu_tier1_bg_color=""

cpu_tier8_default_bg_color="#[bg=#ff0000]"
cpu_tier7_default_bg_color="#[bg=#ff4000]"
cpu_tier6_default_bg_color="#[bg=#ff8000]"
cpu_tier5_default_bg_color="#[bg=#ffc000]"
cpu_tier4_default_bg_color="#[bg=#ffff00]"
cpu_tier3_default_bg_color="#[bg=#aaff00]"
cpu_tier2_default_bg_color="#[bg=#55ff00]"
cpu_tier1_default_bg_color="#[bg=#00ff00]"

get_bg_color_settings() {
  cpu_tier8_bg_color=$(get_tmux_option "@cpu_tier8_bg_color" "$cpu_tier8_default_bg_color")
  cpu_tier7_bg_color=$(get_tmux_option "@cpu_tier7_bg_color" "$cpu_tier7_default_bg_color")
  cpu_tier6_bg_color=$(get_tmux_option "@cpu_tier6_bg_color" "$cpu_tier6_default_bg_color")
  cpu_tier5_bg_color=$(get_tmux_option "@cpu_tier5_bg_color" "$cpu_tier5_default_bg_color")
  cpu_tier4_bg_color=$(get_tmux_option "@cpu_tier4_bg_color" "$cpu_tier4_default_bg_color")
  cpu_tier3_bg_color=$(get_tmux_option "@cpu_tier3_bg_color" "$cpu_tier3_default_bg_color")
  cpu_tier2_bg_color=$(get_tmux_option "@cpu_tier2_bg_color" "$cpu_tier2_default_bg_color")
  cpu_tier1_bg_color=$(get_tmux_option "@cpu_tier1_bg_color" "$cpu_tier1_default_bg_color")
}

print_bg_color() {
  local cpu_percentage=$($CURRENT_DIR/cpu_percentage.sh | sed -e 's/%//')
  local cpu_load_status=$(cpu_load_status $cpu_percentage)
  if [ $cpu_load_status == "tier8" ]; then
    echo "$cpu_tier8_bg_color"
  elif [ $cpu_load_status == "tier7" ]; then
    echo "$cpu_tier7_bg_color"
  elif [ $cpu_load_status == "tier6" ]; then
    echo "$cpu_tier6_bg_color"
  elif [ $cpu_load_status == "tier5" ]; then
    echo "$cpu_tier5_bg_color"
  elif [ $cpu_load_status == "tier4" ]; then
    echo "$cpu_tier4_bg_color"
  elif [ $cpu_load_status == "tier3" ]; then
    echo "$cpu_tier3_bg_color"
  elif [ $cpu_load_status == "tier2" ]; then
    echo "$cpu_tier2_bg_color"
  elif [ $cpu_load_status == "tier1" ]; then
    echo "$cpu_tier1_bg_color"
  fi
}

main() {
  get_bg_color_settings
  print_bg_color
}
main
