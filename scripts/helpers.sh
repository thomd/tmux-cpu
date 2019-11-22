get_tmux_option() {
  local option="$1"
  local default_value="$2"
  local option_value="$(tmux show-option -gqv "$option")"
  if [ -z "$option_value" ]; then
    echo "$default_value"
  else
    echo "$option_value"
  fi
}

is_osx() {
  [ $(uname) == "Darwin" ]
}

is_freebsd() {
  [ $(uname) == "FreeBSD" ]
}

is_openbsd() {
  [ $(uname) == "OpenBSD" ]
}

is_linux() {
  [ $(uname) == "Linux" ]
}

is_cygwin() {
  command -v WMIC &> /dev/null
}

is_linux_iostat() {
  # Bug in early versions of linux iostat -V return error code
  iostat -c &> /dev/null
}

# is second float bigger?
fcomp() {
  awk -v n1=$1 -v n2=$2 'BEGIN {if (n1<n2) exit 0; exit 1}'
}

cpu_load_status() {
  local percentage=$1
  if fcomp 80 $percentage; then
    echo "tier8"
  elif fcomp 55 $percentage && fcomp $percentage 80; then
    echo "tier7"
  elif fcomp 40 $percentage && fcomp $percentage 55; then
    echo "tier6"
  elif fcomp 25 $percentage && fcomp $percentage 40; then
    echo "tier5"
  elif fcomp 20 $percentage && fcomp $percentage 25; then
    echo "tier4"
  elif fcomp 15 $percentage && fcomp $percentage 20; then
    echo "tier3"
  elif fcomp 8 $percentage && fcomp $percentage 15; then
    echo "tier2"
  else
    echo "tier1"
  fi
}

cpus_number() {
  if is_linux; then
    nproc
  else
    sysctl -n hw.ncpu
  fi
}

command_exists() {
  local command="$1"
  command -v "$command" &> /dev/null
}
