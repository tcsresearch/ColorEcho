#!/bin/env bash

# Define the wrapper function
say() {
    if [ "$Var_Colors_Loaded" = "1" ]; then
        echo "$@"
    else
        cecho "$@"
    fi
}

# Use it anywhere in your script
say "This is your message"
