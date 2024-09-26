{pkgs, ...}: {
  # TODO: https://sourcegraph.com/github.com/EdenEast/nyx/-/blob/home/modules/shell/glow.nix?L11
  home.packages = with pkgs; [glow];
}
