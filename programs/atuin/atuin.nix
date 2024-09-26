{
  config,
  lib,
  pkgs,
  ...
}:
let
  atuinConfig = builtins.fromTOML (builtins.readFile ./config.toml);
in
{
  programs.atuin = {
    enable = true;
    settings = atuinConfig;
    enableNushellIntegration = false;
  };
}
