{
  description = "Jay's meticulously crafted, personalized Home Manager configuration.";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur.url = "github:nix-community/NUR";
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixos-flake.url = "github:srid/nixos-flake";
    agenix.url = "github:ryantm/agenix";
    sops-nix.url = "github:Mic92/sops-nix";
    stylix.url = "github:danth/stylix";
    nixgl.url = "github:nix-community/nixGL";
    nuenv.url = "https://flakehub.com/f/DeterminateSystems/nuenv/*.tar.gz";
    systems.url = "github:nix-systems/default";
  };
  outputs =
    inputs@{
      self,
      nixpkgs,
      nixgl,
      ...
    }:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = import inputs.systems;
      imports = [ inputs.nixos-flake.flakeModule ];
      perSystem =
        {
          self',
          pkgs,
          system,
          ...
        }:
        let
          username = "keinsell";
          nixGLOverlay = final: prev: {
            nixgl = nixgl.packages.${system};
          };
          pkgsWithOverlay = import nixpkgs {
            inherit system;
            overlays = [ nixGLOverlay ];
          };
        in
        {
          legacyPackages.homeConfigurations.${username} =
            inputs.self.nixos-flake.lib.mkHomeConfiguration pkgsWithOverlay
              (
                { pkgs, ... }:
                {
                  imports = [ self.homeModules.default ];
                  home = {
                    inherit username;
                    homeDirectory = "/${if pkgs.stdenv.isDarwin then "Users" else "home"}/${username}";
                    stateVersion = "24.05";
                  };
                }
              );
          formatter = pkgs.nixfmt-rfc-style;
          apps.default.program = self'.packages.activate-home;
          packages.default = self'.legacyPackages.homeConfigurations.${username}.activationPackage;
          devShells.default = pkgsWithOverlay.mkShell {
            name = "luminar";
            nativeBuildInputs = with pkgsWithOverlay; [
            ];
          };
        };
      flake = {
        homeModules.default =
          { ... }:
          {
            imports = [ ./home.nix ];
          };
      };
    };
}
