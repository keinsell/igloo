{ pkgs, ... }:
{
  home.packages = with pkgs; [ pinentry ];
  programs = {
    gpg = {
      enable = true;
      mutableKeys = true;
      mutableTrust = true;
      publicKeys = [
        {
          source = ./keys/pub_fb2eca8d791435dc683d80d1402d2364da7ca536.asc;
          trust = "ultimate";
        }
      ];
    };

    # Git Integration
    git.signing.key = "FB2ECA8D791435DC683D80D1402D2364DA7CA536";
    git.signing.signByDefault = true;
  };
  # https://github.com/NixOS/nixpkgs/issues/35464
  services.gpg-agent = {
    enable = false;
    defaultCacheTtl = 1209600;
    defaultCacheTtlSsh = 1209600;
    maxCacheTtl = 1209600;
    maxCacheTtlSsh = 1209600;
    enableSshSupport = true;
    enableExtraSocket = true;
    pinentryPackage = pkgs.pinentry-gnome3;
  };
}
