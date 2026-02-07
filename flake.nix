{
  description = "Chamomile NixOS Configuration";

  inputs = {
    nixpkgs.url = "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/nixos-unstable/nixexprs.tar.xz";
    home-manager = {
      url = "github:nix-community/home-manager";
      # url = "https://mirror.ghproxy.com/https://github.com/nix-community/home-manager/archive/master.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      # url = "https://mirror.ghproxy.com/https://github.com/Mic92/sops-nix/archive/master.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, sops-nix, ... } @inputs:
    let
      mkHost = host: system:
        nixpkgs.lib.nixosSystem {
          inherit system;
	  specialArgs = { inherit inputs; }; 
          modules = [
            ./hosts/${host}/default.nix
	    ./system/default.nix
	    sops-nix.nixosModules.sops
            home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.chamomile = import ./users/chamomile;
            }
          ];
        };
    in {
      nixosConfigurations.chamomile = mkHost "chamomile" "x86_64-linux";
    };
}
