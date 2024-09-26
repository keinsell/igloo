{pkgs, ...}: {
  programs = {
    firefox = {
      enable = true;
      package = pkgs.firefox-devedition;
      nativeMessagingHosts = with pkgs; [
        # bukubrow
        browserpass
        gnomeExtensions.gsconnect
      ];
    };
  };
}
