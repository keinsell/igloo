{
  config,
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    nh
    comma
  ];

  nix = {
    package = pkgs.lix;
    gc.automatic = true;
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      warn-dirty = false;
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

  services =
    {}
    // lib.attrsets.optionalAttrs (builtins.hasAttr "nix-daemon" config.services) {
      nix-daemon.enable = true;
    };

  programs = {
    nix-index.enable = true;
    nix-index.enableBashIntegration = false;
    nix-index.enableZshIntegration = false;
    command-not-found.enable = true;
  };
}
