let
  config = builtins.fromTOML (builtins.readFile ./direnv.toml);
in
{
  programs.direnv = {
    enable = true;
    silent = true;
    config = config;
  };
}
