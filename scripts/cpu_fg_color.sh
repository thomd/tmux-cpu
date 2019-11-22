#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

cpu_tier8_fg_color=""
cpu_tier7_fg_color=""
cpu_tier6_fg_color=""
cpu_tier5_fg_color=""
cpu_tier4_fg_color=""
cpu_tier3_fg_color=""
cpu_tier2_fg_color=""
cpu_tier1_fg_color=""

cpu_tier8_default_fg_color="#[fg=#ff0000]"
cpu_tier7_default_fg_color="#[fg=#ff4000]"
cpu_tier6_default_fg_color="#[fg=#ff8000]"
cpu_tier5_default_fg_color="#[fg=#ffc000]"
cpu_tier4_default_fg_color="#[fg=#ffff00]"
cpu_tier3_default_fg_color="#[fg=#aaff00]"
cpu_tier2_default_fg_color="#[fg=#55ff00]"
cpu_tier1_default_fg_color="#[fg=#00ff00]"

get_fg_color_settings() {
  cpu_tier8_fg_color=$(get_tmux_option "@cpu_tier8_fg_color" "$cpu_tier8_default_fg_color")
  cpu_tier7_fg_color=$(get_tmux_option "@cpu_tier7_fg_color" "$cpu_tier7_default_fg_color")
  cpu_tier6_fg_color=$(get_tmux_option "@cpu_tier6_fg_color" "$cpu_tier6_default_fg_color")
  cpu_tier5_fg_color=$(get_tmux_option "@cpu_tier5_fg_color" "$cpu_tier5_default_fg_color")
  cpu_tier4_fg_color=$(get_tmux_option "@cpu_tier4_fg_color" "$cpu_tier4_default_fg_color")
  cpu_tier3_fg_color=$(get_tmux_option "@cpu_tier3_fg_color" "$cpu_tier3_default_fg_color")
  cpu_tier2_fg_color=$(get_tmux_option "@cpu_tier2_fg_color" "$cpu_tier2_default_fg_color")
  cpu_tier1_fg_color=$(get_tmux_option "@cpu_tier1_fg_color" "$cpu_tier1_default_fg_color")
}

print_fg_color() {
  local cpu_percentage=$($CURRENT_DIR/cpu_percentage.sh | sed -e 's/%//')
  local cpu_load_status=$(cpu_load_status $cpu_percentage)
  if [ $cpu_load_status == "tier8" ]; then
    echo "$cpu_tier8_fg_color"
  elif [ $cpu_load_status == "tier7" ]; then
    echo "$cpu_tier7_fg_color"
  elif [ $cpu_load_status == "tier6" ]; then
    echo "$cpu_tier6_fg_color"
  elif [ $cpu_load_status == "tier5" ]; then
    echo "$cpu_tier5_fg_color"
  elif [ $cpu_load_status == "tier4" ]; then
    echo "$cpu_tier4_fg_color"
  elif [ $cpu_load_status == "tier3" ]; then
    echo "$cpu_tier3_fg_color"
  elif [ $cpu_load_status == "tier2" ]; then
    echo "$cpu_tier2_fg_color"
  elif [ $cpu_load_status == "tier1" ]; then
    echo "$cpu_tier1_fg_color"
  fi
}

main() {
  get_fg_color_settings
  print_fg_color
}
main
