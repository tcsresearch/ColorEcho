#!/usr/bin/env bash

# --- Default Configurations ---
ENABLE_COLOR=true
USE_NEWLINE=true
TEXT_STYLE=""
BG_COLOR=""
FG_COLOR=""

# --- ANSI Formatting Codes ---
# Foreground Colors
FG_RED='\033[0;31m'
FG_GREEN='\033[0;32m'
FG_YELLOW='\033[0;33m'
FG_BLUE='\033[0;34m'

# Text Styles
STYLE_BOLD='\033[1m'
STYLE_UNDERLINE='\033[4m'

# Background Colors
BG_RED='\033[41m'
BG_GREEN='\033[42m'
BG_YELLOW='\033[43m'
BG_BLUE='\033[44m'

NC='\033[0m' # No Color / Reset

# --- Usage Helper ---
usage() {
  echo "Usage: $0 [OPTIONS] \"Your message here\""
  echo "Options:"
  echo "  -c <color>    Foreground color (red, green, yellow, blue)"
  echo "  -b <color>    Background color (red, green, yellow, blue)"
  echo "  -s <style>    Text style (bold, underline)"
  echo "  -n            Suppress trailing newline"
  echo "  -x            Disable all color/formatting entirely"
  exit 1
}

# --- Command Line Parsing via getopts ---
while getopts "c:b:s:nx" opt; do
  case "$opt" in
    c) FG_COLOR="$OPTARG" ;;
    b) BG_COLOR="$OPTARG" ;;
    s) TEXT_STYLE="$OPTARG" ;;
    n) USE_NEWLINE=false ;;
    x) ENABLE_COLOR=false ;;
    *) usage ;;
  esac
done

shift $((OPTIND - 1))

# Check if a message argument was actually passed
if [ -z "$1" ]; then
  usage
fi

MESSAGE="$1"

# --- Format Construction ---
FORMAT_START=""
NEWLINE="\n"

if [ "$USE_NEWLINE" = false ]; then
  NEWLINE=""
fi

if [ "$ENABLE_COLOR" = true ]; then
  # Apply Style
  case "$TEXT_STYLE" in
    bold)      FORMAT_START+="$STYLE_BOLD" ;;
    underline) FORMAT_START+="$STYLE_UNDERLINE" ;;
  esac

  # Apply Foreground Color
  case "$FG_COLOR" in
    red)    FORMAT_START+="$FG_RED" ;;
    green)  FORMAT_START+="$FG_GREEN" ;;
    yellow) FORMAT_START+="$FG_YELLOW" ;;
    blue)   FORMAT_START+="$FG_BLUE" ;;
  esac

  # Apply Background Color
  case "$BG_COLOR" in
    red)    FORMAT_START+="$BG_RED" ;;
    green)  FORMAT_START+="$BG_GREEN" ;;
    yellow) FORMAT_START+="$BG_YELLOW" ;;
    blue)   FORMAT_START+="$BG_BLUE" ;;
  esac
fi

# --- Execution ---
if [ -n "$FORMAT_START" ]; then
  printf "${FORMAT_START}%s${NC}${NEWLINE}" "$MESSAGE"
else
  printf "%s${NEWLINE}" "$MESSAGE"
fi
