{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/nixos-unstable/nixexprs.tar.xz";
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
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
          ./hosts/${host}/default.nix
          ./system/default.nix
          sops-nix.nixosModules.sops
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.chamomile = import ./users/chamomile;
          }
        ];
      };
  in {
    nixosConfigurations.chamomile = mkHost "chamomile" "x86_64-linux";
    formatter.x86_64-linux = (pkgsFor "x86_64-linux").alejandra;
    devShells.x86_64-linux.default = (pkgsFor "x86_64-linux").mkShell {
      packages = [
        (pkgsFor "x86_64-linux").nh
        (pkgsFor "x86_64-linux").nil
      ];
    };
  };
}
