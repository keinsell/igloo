#!/bin/bash

if ! command -v nix &> /dev/null; then
    curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install --determinate
    exit 1
fi

echo "Nix is installed and accessible by the current user."
