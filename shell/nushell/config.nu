$env.config = {
    hooks: {
            pre_prompt: [{ ||
      if (which direnv | is-empty) {
        return
      }

      direnv export json | from json | default {} | load-env
    }]
    }
    completions: {
        algorithm: 'fuzzy',
    },
    history: {
        file_format: 'sqlite',
        sync_on_enter: true,
        isolation: true,
    },
    show_banner: false,
}

# source ~/.cache/starship/init.nu
source ~/.cache/zoxide/init.nu
source ~/.cache/broot/init.nu
source ~/.cache/atuin/init.nu
source ~/.cache/oh-my-posh/init.nu
source ~/.cache/carapace/init.nu

# ---------------- inshellisense shell plugin ----------------
# if "ISTERM" not-in $env and $nu.is-interactive {
#     if $nu.is-login { is -s nu --login ; exit } else { is -s nu ; exit }
# }


# ---------------- zellij auto-activation --------------------
def start_zellij [] {
  if 'ZELLIJ' not-in ($env | columns) {
    if 'ZELLIJ_AUTO_ATTACH' in ($env | columns) and $env.ZELLIJ_AUTO_ATTACH == 'true' {
      zellij attach -c
    } else {
      zellij
    }

    if 'ZELLIJ_AUTO_EXIT' in ($env | columns) and $env.ZELLIJ_AUTO_EXIT == 'true' {
      exit
    }
  }
}
start_zellij
