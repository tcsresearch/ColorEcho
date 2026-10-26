#!/usr/bin/env bash

# Get the directory where this script lives to find the helper file
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

# Source the color setup functions
if [ -f "$SCRIPT_DIR/ColorTerm-Setup.bfunc" ]; then
    source "$SCRIPT_DIR/ColorTerm-Setup.bfunc"
else
    echo "Error: $SCRIPT_DIR/ColorTerm-Setup.bfunc not found." >&2
    exit 1
fi

usage() {
    echo "Usage: $0 [EnableColors | DisableColors | UnsetColors]"
    exit 1
}

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
