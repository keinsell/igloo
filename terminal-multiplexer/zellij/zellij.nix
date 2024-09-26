{pkgs, ...}: {
  programs.zellij = {
    enable = true;
    enableZshIntegration = false;
    settings = {
      simplified_ui = true;
      theme = "catppuccin-mocha";
      default_shell = "${pkgs.nushell}/bin/nu";
      on_force_close = "quit";
      default_layout = "compact";
      ui = {
        pane_frames = {
          rounded_corners = true;
          hide_session_name = true;
        };
      };
    };
  };
}
