#!/bin/env bash

# shellcheck source=/dev/null

cecho() {
    # Usage: cecho [-n] [style1] [style2] ... "Your text message"
    
    local newline=true
    
    # Check if the first argument is the -n flag
    if [ "$1" = "-n" ]; then
        newline=false
        shift # Remove -n from the argument list
    fi

    # The last remaining argument is ALWAYS the text string
    local text="${*:$#}" 
    local count="$(($# - 1))"
    local format=""

    # Only apply styles if Cecho_Enabled is 1 AND writing to a terminal
    if [ "${Cecho_Enabled:-0}" -eq 1 ] && [ -t 1 ]; then
    # Loop through all styling arguments except the last one
        for ((i=1; i<=count; i++)); do
            # 1. Get the value of the positional parameter (e.g., "RED")
                local current_arg="${!i}"
        
            # 2. Construct the name of the target style variable (e.g., "_C_RED")
                local style_name="_C_${current_arg}"
        
            # 3. Pull the style value indirectly using the constructed name
                format+="${!style_name}"
        done
    fi

        
        # Output styled text and force a clean formatting reset
        if [ "$newline" = true ]; then
            printf "%s%s%s\n" "$format" "$text" "$_C_Reset"
        else
            printf "%s%s%s" "$format" "$text" "$_C_Reset"
        fi
    
        # Fallback: Plain text only
        if [ "$newline" = true ]; then
            printf "%s\n" "$text"
        else
            printf "%s" "$text"
        fi
    }
