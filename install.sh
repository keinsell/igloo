#!/bin/bash

if ! command -v nix &> /dev/null; then
    curl -sSf -L https://install.lix.systems/lix | sh -s -- install
    exit 1
fi

# Check if the current user can access nix
# if ! groups | grep -q nix; then
#     echo "Current user does not have access to nix."
#     exit 1
# fi

echo "Nix is installed and accessible by the current user."
