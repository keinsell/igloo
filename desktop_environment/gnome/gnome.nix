{pkgs, ...}: {
  home.packages = with pkgs; [
    gnome.zenity
    gnome.sushi
    gnome.seahorse
    gnome.rygel
    gnome.gnome-tweaks
    gnome.gnome-software
    gnome.gnome-shell-extensions
    gnome-extension-manager
    gnomeExtensions.forge
    gnome-extensions-cli
    gnome-browser-connector
    gnomeExtensions.blur-my-shell
    gnomeExtensions.zen
    gnomeExtensions.vitals
    gnomeExtensions.runcat
    gnome-keyring
    gnome-autoar
    gnome-calendar
    gnome-desktop
    nautilus
    mission-center
    evolution
    resources
    gnome-contacts
    # gvfs
    nautilus-open-any-terminal
    nautilus-open-in-blackbox
    seahorse
    rygel
    gnome-tweaks
    gnome-software
    gnome-frog
    evince
    gnome-boxes
    gnome-builder
    gnome-text-editor
    gnome-font-viewer
    gnome-dictionary
    gnome-tour
    gnome-maps
    gnome-characters
    # A graphical directory tree analyzer
    baobab
    # A GNOME web browser based on the WebKit rendering engine
    # epiphany
    # User documentation for GNOME
    gnome-user-docs
    # Easy to use user-level file sharing for GNOME
    gnome-user-share
    # Movie player for the GNOME desktop based on GStreamer
    totem
    # Filesystem indexer and metadata extractor
    tracker-miners
  ];

  dconf.settings = {
    "org/gnome/mutter" = {
      experimental-features = [
        "scale-monitor-framebuffer"
        "kms-modifiers"
        "variable-refresh-rate"
      ];
      dynamic-workspaces = true;
      center-new-windows = true;
      edge-tiling = true;
    };
    "org/gnome/shell" = {
      disable-user-extensions = false;
      app-picker-view = "frequent";
    };
    "org/gnome/desktop/interface" = {
      enable-hot-corners = true;
      show-battery-percentage = true;
      enable-animations = true;
    };
    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,maximize,close";
    };
    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = true;
      night-light-schedule-automatic = true;
    };
  };
}
