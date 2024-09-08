# Installation Guide

## 1. Daemon Installation

```bash
curl -sSf -L https://install.lix.systems/lix | sh -s -- install --enable-flakes --force --no-confirm --extra-conf "trusted-users = $USER root"
```

## 2. Home-Manager Installation
## 3. Other

### Index Packages

```nu
nix run 'nixpkgs#nix-index'
```
