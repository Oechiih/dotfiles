{
  description = "Oechiih's dotfiles — nix-darwin + home-manager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nix-darwin, home-manager }:
    let
      hmUsers = {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        # Move pre-existing files (e.g. macOS/Homebrew-installer-created
        # dotfiles on a fresh machine) aside instead of refusing to activate.
        home-manager.backupFileExtension = "hm-bak";
        home-manager.users.joe = import ./modules/home;
      };
      mkDarwin = extraModules: nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          ./modules/darwin
          home-manager.darwinModules.home-manager
          hmUsers
        ] ++ extraModules;
      };
      mkNixos = system: extraModules: nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./modules/nixos
          home-manager.nixosModules.home-manager
          hmUsers
          { home-manager.users.joe = { lib, ... }: { home.homeDirectory = lib.mkForce "/home/joe"; }; }
        ] ++ extraModules;
      };
    in {
      darwinConfigurations = {
        "MacGuffin" = mkDarwin [ ./machines/macguffin ];
        "work-mac"  = mkDarwin [ ./machines/work-mac ];
      };
      nixosConfigurations = {
        "nixos" = mkNixos "x86_64-linux" [ ./machines/nixos ];
      };
    };
}
