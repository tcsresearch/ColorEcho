#!/bin/env bash

# Define the command based on the condition
if [ "$Var_Colors_Loaded" = "1" ]; then
    print_cmd="echo"
else
    print_cmd="cecho"


$print_cmd "This is your message."
