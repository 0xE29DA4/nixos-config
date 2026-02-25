{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-25.11";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    sops-nix,
    home-manager,
    ...
  } @ inputs: let
    pkgsFor = system:
      import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    mkHost = host: system:
      nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/${host}
          ./system
          sops-nix.nixosModules.sops
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.sharedModules = [ inputs.sops-nix.homeManagerModules.sops ];
            home-manager.users.chamomile = {
              imports = [ ./users/chamomile ];
            };
          }
        ];
      };
  in {
    nixosConfigurations.ada = mkHost "ada" "x86_64-linux";
    formatter.x86_64-linux = (pkgsFor "x86_64-linux").alejandra;
    devShells.x86_64-linux.default = (pkgsFor "x86_64-linux").mkShell {
      packages = [
        (pkgsFor "x86_64-linux").nh
        (pkgsFor "x86_64-linux").nil
      ];
    };
  };
}
