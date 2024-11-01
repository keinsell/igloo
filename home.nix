# Reference
# https://mynixos.com/
# https://searchix.alanpearce.eu/
{
  config,
  pkgs,
  ...
}:
let
  sources = import ./npins;
  helixConfigurationFile = builtins.fromTOML (builtins.readFile ./helix/config.toml);
  helixLanguagesFile = builtins.fromTOML (builtins.readFile ./helix/languages.toml);
in
{
  imports = [
    (sources.catppuccin + "/modules/home-manager")
    ./fonts
    ./shell
    ./terminal-multiplexer
    ./programs
  ];

  # Enable settings that make Home Manager work better on
  # GNU/Linux distributions other than NixOS.
  targets.genericLinux.enable = true;
  # stylix.enable = true;

  nix = {
    package = pkgs.nix;
    gc.automatic = true;
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      warn-dirty = true;
      sandbox = true;
      system-features = [
        "kvm"
        "big-parallel"
        "gccarch-skylake"
      ];
      trusted-users = [
        "root"
        "keinsell"
      ];
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

    # https://searchix.alanpearce.eu/packages/nixpkgs/

    sessionVariables = {
      EDITOR = "hx";
      TERM = "xterm-256color";
      BROWSER = "firefox";
      LANG = "en_US.UTF-8";
      PNPM_HOME = "/home/keinsell/.local/share/pnpm";
      COREPACK_HOME = "/home/keinsell/.cache/corepack";
      ZELLIJ_AUTO_ATTACH = "true";
      ZELLIJ_AUTO_EXIT = "true";
    };

    sessionPath = [
      "$HOME/.cache/pnpm/bin"
      "$HOME/.cargo/bin"
      "$HOME/.local/bin"
    ];

    shellAliases = {
      mux = "zellij";
      nd = "nix develop";
    };

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

    helix = {
      enable = true;
      settings = helixConfigurationFile;
      languages = helixLanguagesFile;
      ignores = [
        "/build/"
        "/target/"
        "/node_modules/"
        "/dist/"
      ];
    };

    lazygit = {
      enable = true;
      settings = {
        update.method = "never";
        gui = {
          nerdFontsVersion = 3;
          lightTheme = false;
          filterMode = "fuzzy";
        };
        git = {
          paging = {
            colorArg = "always";
            useConfig = false;
            externalDiffCommand = "difft --color=always";
          };
        };
      };
    };

    bash = {
      enable = false;
      enableVteIntegration = true;
    };
    
    zsh = {
      enable = true;
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
      enableNushellIntegration = true;
      enableZshIntegration = true;
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

    fuzzel = {
      enable = true;
    };

    java = {
      package = pkgs.zulu;
    };
  };

  services = {
    home-manager = {
      autoUpgrade.enable = false;
      autoUpgrade.frequency = "daily";
    };

    kbfs.enable = true;
    keybase.enable = true;
    gnome-keyring.enable = true;

    mako = {
      enable = false;
    };

    spotifyd = {
      enable = true;
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

  xsession.enable = false;

  editorconfig = {
    enable = true;
    settings = {
      "*" = {
        max_line_width = 80;
      };
    };
  };

  xdg = {
    portal = {
      enable = false;
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
