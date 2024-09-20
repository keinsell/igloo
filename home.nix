# Reference
# https://mynixos.com/
# https://searchix.alanpearce.eu/
{ config
, pkgs
, ...
}:
let
  sources = import ./npins;
  # isDarwin = pkgs.stdenv.isDarwin;
  # isLinux = pkgs.stdenv.isLinux;
in
{
  imports = [
    (sources.catppuccin + "/modules/home-manager")
    # (sources.stylix).homeManagerModules.stylix
    # ./desktop_environment
    ./fonts
    ./modal-editor
    ./shell
    ./terminal-multiplexer
    # ./web-browser
    ./programs
    ./music-player
  ];

  # Enable settings that make Home Manager work better on
  # GNU/Linux distributions other than NixOS.
  targets.genericLinux.enable = true;
  # stylix.enable = true;

  accounts = {
    email = {
      # TODO: Add hydroxide to systemd
      # TODO: Configure calendar
      accounts = {
        "keinsell@protonmail.com" = {
          primary = true;
          realName = "Jakub Olan";
          userName = "keinsell@protonmail.com";
          address = "keinsell@protonmail.com";
          passwordCommand = "secret-tool lookup email keinsell@protonmail.com";
          smtp = {
            host = "127.0.0.1";
            port = 1025;
            tls.enable = false;
          };
          imap = {
            host = "127.0.0.1";
            port = 1143;
            tls.enable = false;
          };
        };
      };
    };
  };

  home = {
    # Bibata by some reason is not the most
    # popular theme for cursors however I will
    # not deny the effort that was put into
    # release of these and they are literally
    # beautyful.
    #
    # https://www.bibata.live
    pointerCursor = {
      x11.enable = true;
      gtk.enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 8;
    };

    username = "keinsell";
    homeDirectory = "/home/${config.home.username}";
    stateVersion = "24.05";

    file = { };
    packages = [
      # System
      # pkgs.zstd
      # pkgs.xsel
      # pkgs.xclip
      # pkgs.lsof
      # pkgs.npins
      # pkgs.zk
      # pkgs.nb
      # pkgs.unar
      # pkgs.inshellisense
      # pkgs.jq
      # pkgs.poppler
      # pkgs.fd
      # pkgs.fzf
      # pkgs.mods
      # pkgs.gum
      # pkgs.glow
      # pkgs.wluma
      # pkgs._1password
      # pkgs._1password-gui-beta
      # pkgs.nh
      # pkgs.manix
      # pkgs.nil
      # pkgs.niv
      # pkgs.nixci
      # pkgs.nixd
      # pkgs.nixel
      # pkgs.nixpacks
      # pkgs.gleam
      # pkgs.yaml-language-server
      # pkgs.vdhcoapp
      # pkgs.aria2
      # pkgs.persepolis
      # pkgs.varia
      # pkgs.ariang
      # pkgs.ccache
      # pkgs.axel
      # pkgs.gcc
      # pkgs.automake
      # pkgs.pkgconf

      # Development Environemnt
      # pkgs.daytona-bin
      pkgs.devenv
      pkgs.deadnix
      pkgs.statix
      pkgs.comma
      pkgs.alejandra

      # Runtimes and Libraries
      # pkgs.go

      # ---------
      # Rust
      # ---------
      # pkgs.rustup
      # pkgs.rustfilt

      # ---------
      # Zig
      # ---------
      # pkgs.zls
      # pkgs.zig

      # ---------
      # Java
      # ---------
      # See programs.java
      # ---------
      # Kotlin
      # ---------
      # pkgs.kotlin
      # pkgs.kotlin-native
      # pkgs.kotlin-language-server
      # pkgs.detekt
      # pkgs.ktfmt
      # pkgs.ktlint

      ## Node.js
      # pkgs.nodejs
      # pkgs.typescript-language-server
      # pkgs.pnpm
      # pkgs.yarn
      # pkgs.bun
      # pkgs.deno
      # pkgs.typescript
      # pkgs.assemblyscript
      # pkgs.nodePackages.tsun
      # pkgs.nodePackages.ts-node
      # # pkgs.nodePackages.prisma
      # pkgs.turbo
      # pkgs.rslint
      # pkgs.oxlint
      # pkgs.ezno
      # # pkgs.edge-runtime
      # pkgs.tyson
      # pkgs.esbuild
      # pkgs.nerdctl
      # pkgs.docker
      # pkgs.docker-compose
      # pkgs.docker-buildx
      # pkgs.docker-sync
      # pkgs.lazydocker
      # pkgs.dapper
      # pkgs.cadvisor
      # pkgs.docui
      # pkgs.dive
      # pkgs.diffoci
      # pkgs.rootlesskit
      # pkgs.kind
      # pkgs.kompose
      # pkgs.containerd
      # pkgs.dockerfile-language-server-nodejs
      # pkgs.conmon
      # pkgs.gvisor
      # pkgs.earthly
      # pkgs.jetbrains-toolbox
      # pkgs.jetbrains.idea-ultimate
      # pkgs.vesktop
      # pkgs.spot
      # pkgs.psst
      # pkgs.bcachefs-tools
      # pkgs.tailscale

      # NetworkManager
      # pkgs.gnome.networkmanager-vpnc
      # pkgs.gnome.networkmanager-openvpn
      # pkgs.gnome.networkmanager-openconnect
      # pkgs.gnome.networkmanager-l2tp
      # pkgs.gnomeExtensions.tailscale-qs
      # pkgs.gnomeExtensions.wireguard-indicator

      # pkgs.gitmoji-cli
      # pkgs.lunarvim
      # pkgs.tokei
      # pkgs.scc
      # pkgs.gitstats
      # pkgs.git-town
      # pkgs.git-annex
      # pkgs.gitfs
      # pkgs.git-cliff
      # pkgs.git-codeowners
      # pkgs.gitleaks
      # pkgs.gitless
      # pkgs.jrnl
      # pkgs.gitu
      # pkgs.difftastic
      # pkgs.git-credential-manager
      # pkgs.meld
      # pkgs.resources
      # pkgs.gnome-calendar
      # pkgs.gnome-keysign
      # pkgs.cockpit
      # pkgs.papirus-icon-theme
      # pkgs.papirus-folders
      # pkgs.folder-color-switcher
      # pkgs.flatpak
      # pkgs.buku
      # pkgs.bukubrow
      # pkgs.oil-buku
      # pkgs.packer
      # pkgs.codeowners
      # pkgs.nu_scripts
      # pkgs.slint-lsp

      # TODO: Research database tools
      # https://github.com/pasqui23/nixpkgs/tree/5924e231b7bad42a56c2bcf0909ef163e246fac9/pkgs/development/tools/database

      pkgs.logseq
      pkgs.hydroxide
      pkgs.evolution
      pkgs.mailspring
      pkgs.cloudflared
      # pkgs.zettlr

      # A stright-forward modern application to create bootable drives.
      pkgs.impression
      # Fast and secure file transfering
      pkgs.warp
      pkgs.epiphany
      pkgs.shutter
      # pkgs.solanum
      # pkgs.pkg-config
      pkgs.openssl
      pkgs.rclone
      pkgs.blackbox-terminal
      pkgs.protonvpn-cli_2
    ];

    sessionVariables = {
      EDITOR = "hx";
      TERM = "xterm-256color";
      BROWSER = "firefox";
      LANG = "en_US.UTF-8";

      PNPM_HOME = "/home/keinsell/.cache/pnpm";
      COREPACK_HOME = "/home/keinsell/.cache/corepack";
      PAGER = "${pkgs.glow}/bin/glow";
      ZELLIJ_AUTO_ATTACH = "true";
      ZELLIJ_AUTO_EXIT = "true";
    };

    sessionPath = [
      "$HOME/.cache/pnpm/bin"
      "$HOME/.cargo/bin"
    ];

    shellAliases = {
      mux = "zellij";
    };

    extraOutputsToInstall = [
      "doc"
      "info"
      "devdoc"
    ];

    preferXdgDirectories = true;
  };

  programs = {
    home-manager.enable = true;
    browserpass.enable = true;
    jujutsu.enable = true;
    mpv.enable = true;
    scmpuff.enable = true;
    urxvt.enable = true;
    watson.enable = true;
    rofi.enable = true;

    bash = {
      enable = false;
      enableVteIntegration = true;
    };
    zsh = {
      enable = true;
      zsh-abbr.enable = true;
      autosuggestion.enable = true;
      enableCompletion = true;
      zprof.enable = false;
      syntaxHighlighting.enable = true;
      enableVteIntegration = true;

      dirHashes = {
        src = "/home/${config.home.username}/Projects";
        dots = "/home/${config.home.username}/.dotfiles";
      };
    };
    bottom = {
      enable = true;
      settings = {
        flags = {
          avg_cpu = true;
          temperature_type = "c";
        };

        colors = {
          low_battery_color = "red";
        };
      };
    };
    pandoc = {
      enable = true;
    };
    zoxide = {
      enable = true;
      options = [ "--cmd cd" ];
    };
    feh.enable = true;
    fastfetch = {
      enable = true;
      settings = {
        logo = {
          source = "nixos_small";
          padding = {
            right = 1;
          };
        };
        modules = [
          {
            type = "datetime";
            key = "Date";
            format = "{1}-{3}-{11}";
          }
          {
            type = "datetime";
            key = "Time";
            format = "{14}:{17}:{20}";
          }
          "break"
          "player"
          "media"
        ];
      };
    };
    himalaya = {
      enable = true;
    };
    notmuch = {
      enable = false;
    };
    broot.enable = true;
    carapace.enable = true;

    # starship = {
    #   enable = true;
    #   settings = {
    #     add_newline = false;
    #     line_break.disabled = false;
    #   };
    # };

    oh-my-posh = {
      enable = true;
    };

    gitui = {
      enable = true;
    };

    eza = {
      enable = true;
      enableZshIntegration = true;
    };

    fzf.enable = true;
    fzf.enableZshIntegration = true;

    tealdeer.enable = true;
    navi.enable = true;
    dircolors.enable = true;

    thefuck = {
      enable = true;
      enableInstantMode = true;
    };

    skim.enable = true;
    keychain.enable = true;
    gh.enable = true;

    texlive = {
      enable = true;
    };

    # There is additional need to symlink
    # mise directory into asdf for Jetbrains
    # support
    #
    # ln -s ~/.local/share/mise ~/.asdf
    mise = {
      enable = true;
      globalConfig = {
        tools = {
          nodejs = "lts";
        };
      };
      settings = {
        experimental = true;
      };
    };

    nix-index.enable = true;

    ripgrep.enable = true;
    bacon.enable = true;
    pylint.enable = true;
    poetry.enable = true;
    neovim.enable = true;
    ssh.enable = false;

    ncspot = {
      enable = true;
    };

    k9s = {
      enable = true;
    };

    zk = {
      enable = true;
    };

    password-store = {
      enable = true;
    };

    yt-dlp = {
      enable = true;
    };

    # taskwarrior = {
    #   enable = true;
    # };

    fuzzel = {
      enable = true;
    };

    java = {
      package = pkgs.zulu;
    };
  };

  services = {
    home-manager = {
      autoUpgrade.enable = true;
      autoUpgrade.frequency = "daily";
    };

    kbfs = {
      enable = true;
    };

    keybase.enable = true;

    gnome-keyring = {
      enable = true;
    };

    lorri = {
      enable = false;
    };

    mako = {
      enable = false;
    };

    spotifyd = {
      enable = true;
    };

    activitywatch = {
      enable = true;
      extraOptions = [
        "--port"
        "5600"
      ];
      settings = {
        port = 5600;
      };
    };
  };

  # ---------------------------------------------------
  # Theme
  # ---------------------------------------------------

  catppuccin = {
    flavor = "mocha";
    pointerCursor.enable = false;
  };

  gtk = {
    iconTheme = {
      name = "Papirus";
      package = pkgs.papirus-icon-theme;
    };
  };

  dconf.enable = true;

  systemd = {
    user.startServices = "sd-switch";
  };

  xsession.enable = true;

  fonts = {
    fontconfig = {
      enable = true;
    };
  };

  editorconfig = {
    enable = true;
    settings = {
      "*" = {
        max_line_width = 80;
      };
    };
  };

  xdg = {
    # mimeApps = {
    #   enable = true;
    #   defaultApplications = {
    #     "ts" = [ "helix.desktop" ];
    #   };
    # };
    portal = {
      enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-gnome
        pkgs.xdg-desktop-portal-gtk
      ];
      configPackages = [
        pkgs.gnome.gnome-session
      ];
    };
  };
}
