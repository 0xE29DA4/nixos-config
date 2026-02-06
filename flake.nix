{
  description = "Chamomile NixOS Configuration";

  inputs = {
    nixpkgs.url = "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/nixos-unstable/nixexprs.tar.xz";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, sops-nix, ... }@inputs:
    let
      mkHost = host: system:
        nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/${host}/default.nix

            ./system/base.nix
            ./system/nix.nix
	    ./system/fonts.nix
	    ./system/locale.nix
	    ./system/users.nix
            ./system/network.nix
            ./system/security.nix

            ./system/services/podman.nix
            ./system/services/dnsmasq.nix

	    sops-nix.nixosModules.sops

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.chamomile =
                import ./users/chamomile;
            }
          ];
        };
    in {
      nixosConfigurations.chamomile = mkHost "chamomile" "x86_64-linux";
    };
}
