# A Home Manager Flake-based template providing setup of keinsell's desktop environment for everyday use, it is a production flake which is already in use and it's not intented to be changed on anybody's will beside the author.
# TODO: Add Configuraiton Inputs to make home configuration for different username
{
  description = "Jay's meticulously crafted, personalized Home Manager configuration.";

  inputs = {
    # Principle inputs (updated by `nix run .#update`)
    # TODO: Add documentation about nixpkgs input
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    # TODO: Add documentation about home manager input
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # The Nix User Repository (NUR) is a community-driven meta repository for Nix packages. It provides access to user repositories that contain package descriptions (Nix expressions) and allows you to install packages by referencing them via attributes. In contrast to Nixpkgs, packages are built from source and are not reviewed by any Nixpkgs member.
    nur.url = "github:nix-community/NUR";

    # flake-parts provides the options that represent standard flake attributes and establishes a way of working with system. Opinionated features are provided by an ecosystem of modules that you can import.
    flake-parts.url = "github:hercules-ci/flake-parts";

    # A flake-parts module to unify NixOS + nix-darwin + home-manager configuration in a single flake, while providing a consistent interface (and enabling common modules) for both Linux and macOS. For motivation, see https://community.flake.parts/nixos-flake
    nixos-flake.url = "github:srid/nixos-flake";

    # age-encrypted secrets for NixOS and Home manager
    agenix.url = "github:ryantm/agenix";
    sops-nix.url = "github:Mic92/sops-nix";

    stylix.url = "github:danth/stylix";
    nixgl.url = "github:nix-community/nixGL";
    nuenv.url = "https://flakehub.com/f/DeterminateSystems/nuenv/*.tar.gz";
    # see https://github.com/nix-systems/default/blob/main/default.nix
    systems.url = "github:nix-systems/default";
  };

  outputs = inputs @ {self, ...}:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      systems = import inputs.systems;
      imports = [
        inputs.nixos-flake.flakeModule
      ];

      perSystem = {
        self',
        pkgs,
        ...
      }: let
        # TODO: Expose this as configuration
        username = "keinsell";
      in
        # TODO: Email, Real Name
        {
          legacyPackages.homeConfigurations.${username} =
            inputs.self.nixos-flake.lib.mkHomeConfiguration pkgs
            (
              {pkgs, ...}: {
                # Edit the contents of the ./home directory to install packages and modify dotfile configuration in your
                # $HOME.
                #
                # https://nix-community.github.io/home-manager/index.html#sec-usage-configuration
                imports = [self.homeModules.default];

                home = {
                  inherit username;
                  homeDirectory = "/${
                    if pkgs.stdenv.isDarwin
                    then "Users"
                    else "home"
                  }/${username}";
                  stateVersion = "24.05";
                };
              }
            );

          formatter = pkgs.nixfmt-rfc-style;

          # Enable "nix run" command which will activate
          # home-manager environment
          apps.default.program = self'.packages.activate-home;

          # Enable "nix build" command to build home configuration, but without activating it.
          packages.default = self'.legacyPackages.homeConfigurations.${username}.activationPackage;

          devShells.default = pkgs.mkShell {
            name = "nds";
            nativeBuildInputs = with pkgs; [just];
          };
        };

      flake = {
        homeModules.default = {...}: {
          imports = [./home.nix];
        };
      };
    };
}
