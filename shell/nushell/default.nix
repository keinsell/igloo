{
  config,
  pkgs,
  ...
}: {
  programs = {
    nushell = {
      enable = true;
      package = pkgs.nushell;
      configFile.source = ./config.nu;
      envFile.source = ./env.nu;
      inherit (config.home) shellAliases;

      extraConfig = ''
        source ${pkgs.nu_scripts}/share/nu_scripts/custom-completions/git/git-completions.nu
        source ${pkgs.nu_scripts}/share/nu_scripts/custom-completions/cargo/cargo-completions.nu
        source ${pkgs.nu_scripts}/share/nu_scripts/custom-completions/zellij/zellij-completions.nu
      '';
    };

    oh-my-posh.enable = true;
    oh-my-posh.useTheme = "catppuccin_mocha";
  };

  home.file = {
    "$HOME/.cache/oh-my-posh/prompt.json".source = ./prompt.json;
  };

  # programs.oh-my-posh.settings = builtins.fromJSON (builtins.unsafeDiscardStringContext (builtins.readFile "${pkgs.oh-my-posh}/share/oh-my-posh/themes/space.omp.json"))
}
