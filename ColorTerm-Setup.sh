#!/usr/bin/env bash

# Define standard ANSI color codes
RED_CODE="\033[0;31m"
GREEN_CODE="\033[0;32m"
NC_CODE="\033[0m" # No Color

# Initialize color variables (Default: enabled)
RED=$RED_CODE
GREEN=$GREEN_CODE
NC=$NC_CODE

# Function to display usage instructions
usage() {
    echo "Usage: $0 [EnableColors | DisableColors | UnsetColors]"
    exit 1
}

# Ensure at least one argument is passed
if [ $# -eq 0 ]; then
    usage
fi

# Parse the color options
case "$1" in
    EnableColors)
        # Re-assign or confirm ANSI codes are active
        RED=$RED_CODE
        GREEN=$GREEN_CODE
        NC=$NC_CODE
        echo -e "${GREEN}Colors have been explicitly enabled.${NC}"
        ;;
        
    DisableColors)
        # Strip the variables of their ANSI codes (Print as plain text)
        RED=""
        GREEN=""
        NC=""
        echo "Colors have been disabled."
        ;;
        
    UnsetColors)
        # Completely remove/unset the variables from the shell environment
        unset RED
        unset GREEN
        unset NC
        echo "Color variables have been completely unset."
        ;;
        
    *)
        echo "Invalid option: $1"
        usage
        ;;
esac

# Example output to demonstrate the state of the variables
# (Note: if UnsetColors was used, these will print nothing extra)
echo -e "${RED}This text is conditionally red.${NC}"
