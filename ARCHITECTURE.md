# Architecture

While this may seem to be overcomplicated for a simple configuration of home directory it have sense to have multiple individually managed modules intead one configuration, as some of my devices may require to use just console environment while other may require to have desktop environment.

The end result should allow to define single-level configuration of environment like `{ editor: "helix" }` which will use my helix configuration.

## Component-Oriented Configuration

### 1. `desktop_environment`

### 2. Shell

The problem with `shell` is related to integrations, it's easy to configure everything for one shell but when we asumme two shell configurations can be persistent it's unclear how to manage configurations of integrations.

#### 2.1 Nushell

#### 2.2 Zsh

### 3. Web Browser

#### 3.1 Firefox

### 4. Modal Editor

#### 4.1 Helix

#### 4.2 Neovim

#### 4.3 Pico

### 5. Editor

#### 5.1 Zed

Zed is using configuration file defined in `github:keinsell/dotfiles/zed/config.json`.
