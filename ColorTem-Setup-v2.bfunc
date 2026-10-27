#!/usr/bin/env bash

# ColorTerm-Setup.sh
# This adds export for all 16 colors.


function Define_ColorLoop() {
  # List of color variable names
  ColorLoop=(
    black
    red
    green
    yellowbrown
    blue
    magenta
    cyan
    whitelightgray
    brightblack_darkgray
    brightred
    brightgreen
    brightyellow
    brightblue
    brightmagenta
    brightcyan
    brightwhite
  )
}

function Define_ColorVars() {
# Use the export command to turn local shell variables into environment variables.

# Define Our Colors
# Define color variables WITH enclosed quotes.
  black="$(tput setaf 0)"
  red="$(tput setaf 1)"
  green="$(tput setaf 2)"
  yellowbrown="$(tput setaf 3)"
  blue="$(tput setaf 4)"
  magenta="$(tput setaf 5)"
  cyan="$(tput setaf 6)"
  whitelightgray="$(tput setaf 7)"
  whitelightgrey="$(tput setaf 7)"
  brightblack_darkgray="$(tput setaf 8)"
  brightblack_darkgrey="$(tput setaf 8)"
  brightred="$(tput setaf 9)"
  brightgreen="$(tput setaf 10)"
  brightyellow="$(tput setaf 11)"
  brightblue="$(tput setaf 12)"
  brightmagenta="$(tput setaf 13)"
  brightcyan="$(tput setaf 14)"
  brightwhite="$(tput setaf 15)"
  reset="$(tput sgr0)" # Reset to default 
  Cecho_Enabled=1
}

function ExportColors() {
  for color in "${ColorLoop[@]}"; do
  # Indirectly expand the variable value using ${!c}
    # echo -e "${!c}This is color: $c${reset}"
    export "$color"
  done
  echo "Colors Exported Successfully."
}

function UnExportColors() {
  for color in "${ColorLoop[@]}"; do
  # Indirectly expand the variable value using ${!c}
    # echo -e "${!c}This is color: $c${reset}"
    export -n "$color"
  done
  echo "Colors UnExported Successfully."
}

function UnSetColors() {
  for color in "${ColorLoop[@]}"; do
  # Indirectly expand the variable value using ${!c}
    # echo -e "${!c}This is color: $c${reset}"
    unset "$color"
  done
  echo "Colors UnExported Successfully."
}

function EnableColors() {
  Define_ColorLoop
  Define_ColorVars
  ExportColors
}

function DisableColors() {
  UnExportColors
  UnSetColors
}


usage() {
    echo "Usage: $0 [EnableColors | DisableColors | UnsetColors]"
    exit 1
}


###################################################################################################
# Main Program #                                                                                  #
###################################################################################################

# Ensure at least one argument is passed
if [ $# -eq 0 ]; then
    usage
fi

# Dynamically call the function if it matches our allowed list
case "$1" in
    EnableColors|DisableColors|UnsetColors)
        # Call the function directly by the name provided in the argument
        "$1"
        ;;
    *)
        echo "Invalid option: $1"
        usage
        ;;
esac

# Example output to demonstrate the current state
# echo -e "${RED}This text is conditionally red.${NC}"
