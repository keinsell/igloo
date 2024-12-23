# Nushell Environment Config File

# Specifies how environment variables are:
# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)
# Note: The conversions happen *after* config.nu is loaded
$env.ENV_CONVERSIONS = {
  "PATH": {
    from_string: { |s| $s | split row (char esep) | path expand -n }
    to_string: { |v| $v | path expand -n | str join (char esep) }
  }
  "Path": {
    from_string: { |s| $s | split row (char esep) | path expand -n }
    to_string: { |v| $v | path expand -n | str join (char esep) }
  }
}

# Directories to search for scripts when calling source or use
#
# By default, <nushell-config-dir>/scripts is added
$env.NU_LIB_DIRS = [
    ($nu.config-path | path dirname | path join 'scripts')
]

# Directories to search for plugin binaries when calling register
#
# By default, <nushell-config-dir>/plugins is added
$env.NU_PLUGIN_DIRS = [
    ($nu.config-path | path dirname | path join 'plugins')
]

# Adjust environment for Nix-based environment and
# compatibility between darwin/linux architectures.

$env.PATH = (
    $env.PATH
    | split row (char esep)
    | prepend $"/home/($env.USER)/.local/bin"
    | prepend $"/etc/profiles/per-user/($env.USER)/bin"
    | prepend '/run/current-system/sw/bin/'
    | prepend '/Applications/Docker.app/Contents/Resources/bin/'
)

$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense'
$env.EDITOR = "helix"

fastfetch
