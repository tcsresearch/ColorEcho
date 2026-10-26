#!/usr/bin/env bash

# --- Reusable Custom Log Function ---
log_msg() {
  # Use local variables to isolate function flags from the parent script
  local OPTIND opt
  local enable_color=true
  local use_newline=true
  local text_style=""
  local bg_color=""
  local fg_color=""
  
  # ANSI Formatting Codes (Localized)
  local fg_reset='\033[0m'
  local fg_red='\033[0;31m'
  local fg_green='\033[0;32m'
  local fg_yellow='\033[0;33m'
  local fg_blue='\033[0;34m'
  local fg_white='\033[0;37m'
  local fg_orange='\033[38;5;208m'  # Extended 256-color code for orange

  local style_bold='\033[1m'
  local style_underline='\033[4m'

  local bg_red='\033[41m'
  local bg_green='\033[42m'
  local bg_yellow='\033[43m'
  local bg_blue='\033[44m'
  local bg_white='\033[47m'
  local bg_orange='\033[48;5;208m'

# --- Usage Helper ---
usage() {
  echo "Usage: $0 [OPTIONS] \"Your message here\""
  echo "Options:"
  echo "  -c <color>    Foreground color (red, green, yellow, blue)"
  echo "  -b <color>    Background color (red, green, yellow, blue)"
  echo "  -s <style>    Text style (bold, underline)"
  echo "  -n            Suppress trailing newline"
  echo "  -x            Disable all color/formatting entirely"
  return 1
}

  # Dynamic argument parsing internal to this function
  while getopts "c:b:s:nx" opt; do
    case "$opt" in
      c) fg_color="$OPTARG" ;;
      b) bg_color="$OPTARG" ;;
      s) text_style="$OPTARG" ;;
      n) use_newline=false ;;
      x) enable_color=false ;;
      *) usage ;;
      # *) return 1 ;;
    esac
  done
  shift $((OPTIND - 1))

  local message="$1"
  if [[ -z "$message" ]]; then
    echo "Error: No message provided to log_msg" >&2
    return 1
  fi

  # Construct Formatting
  local format_start=""
  local newline="\n"

  if [[ "$use_newline" = false ]]; then
    newline=""
  fi

  if [[ "$enable_color" = true ]]; then
    # Styles
    case "$text_style" in
      bold)      format_start+="$style_bold" ;;
      underline) format_start+="$style_underline" ;;
    esac

    # Foreground
    case "$fg_color" in
      red)    format_start+="$fg_red" ;;
      green)  format_start+="$fg_green" ;;
      yellow) format_start+="$fg_yellow" ;;
      blue)   format_start+="$fg_blue" ;;
      white)  format_start+="$fg_white" ;;
      orange) format_start+="$fg_orange" ;;
    esac

    # Background
    case "$bg_color" in
      red)    format_start+="$bg_red" ;;
      green)  format_start+="$bg_green" ;;
      yellow) format_start+="$bg_yellow" ;;
      blue)   format_start+="$bg_blue" ;;
      white)  format_start+="$bg_white" ;;
      orange) format_start+="$bg_orange" ;;
    esac
  fi

  # Output rendering
  if [[ -n "$format_start" ]]; then
    printf "${format_start}%s${fg_reset}${newline}" "$message"
  else
    printf "%s${newline}" "$message"
  fi
}

# --- Parent Script Context (Testing the Function) ---
  echo "--- Starting Script Steps ---"

  log_msg -c orange -s bold "[WARNING] This is bold orange text!"
  log_msg -c white -b blue " Info: White text on blue background "

# Testing string concatenation with no-newline (-n)
  log_msg -n -c orange "Connecting to server... "
  log_msg -c green "[SUCCESS]"

  log_msg -x -c green "Plain text strip test despite formatting flag"

  echo "--- Script Finished ---"
