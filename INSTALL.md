# Installation Guide

## 1. Daemon Installation

```bash
curl -sSf -L https://install.lix.systems/lix | sh -s -- install --enable-flakes --force --no-confirm --extra-conf "trusted-users = $USER root"
```

If you installed `nix` via system package manager you should refer to [Multi-User Installation](https://nix.dev/manual/nix/2.24/installation/multi-user.html?highlight=%22nix-users%22#restricting-access) guide.

```
  sudo usermod -a -G nix-users keinsell
```


## 2. Home-Manager Installation

```bash
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install
```


## 3. Other

### Index Packages

```nu
nix run 'nixpkgs#nix-index'
```
