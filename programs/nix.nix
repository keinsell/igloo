{
  config,
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [nh];

  nix = {
    package = pkgs.lix;
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

  services =
    {}
    // lib.attrsets.optionalAttrs (builtins.hasAttr "nix-daemon" config.services) {
      nix-daemon.enable = true;
    };
}
