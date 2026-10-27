#!/usr/bin/env bash
# shellcheck disable=SC2034,SC2329  # Unused variables left for readability

# Now compatible with BASH and Zsh.  Should fix SC2059.

cecho(){
    # Color Definitions
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Universal Print Function
print_color() {
    local color_name="$1"
    local message="$2"
    local color_code=""

    if [ -n "$ZSH_VERSION" ]; then
        # Zsh Indirect Variable Expansion
        color_code="${(P)color_name}"
    elif [ -n "$BASH_VERSION" ]; then
        # Bash Indirect Variable Expansion
        color_code="${!color_name}"
    else
        # Fallback if variable expansion fails
        color_code=""
    fi

    printf "${color_code}%s${NC}\n" "$message"
}

}
