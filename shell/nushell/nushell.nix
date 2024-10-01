{
  config,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    macchina
    freshfetch
    inshellisense
    pueue
    jc
  ];

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
        source ${pkgs.nu_scripts}/share/nu_scripts/custom-completions/docker/docker-completions.nu
        source ${pkgs.nu_scripts}/share/nu_scripts/custom-completions/eza/eza-completions.nu
        source ${pkgs.nu_scripts}/share/nu_scripts/custom-completions/glow/glow-completions.nu
        source ${pkgs.nu_scripts}/share/nu_scripts/custom-completions/just/just-completions.nu

        use ${pkgs.nu_scripts}/share/nu_scripts/modules/background_task/task.nu
        use ${pkgs.nu_scripts}/share/nu_scripts/modules/system *

        # https://github.com/nushell/nu_scripts/tree/main/themes
        use ${pkgs.nu_scripts}/share/nu_scripts/themes/nu-themes/catppuccin-mocha.nu
      '';
    };

    oh-my-posh.enable = true;
    oh-my-posh.useTheme = "stelbent.minimal";
    carapace.enable = true;
  };

  home.file =
    {
    };
}
