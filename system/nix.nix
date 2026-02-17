{inputs, ...}: {
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nix.settings.substituters = [
    "https://mirrors.ustc.edu.cn/nix-channels/store"
    "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
    "https://cache.nixos.org/"
    "https://mic92.cachix.org"
  ];
  nix.settings.trusted-public-keys = [
    "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
    "mic92.cachix.org-1:gi8Sa+I96ZB/vjRjEe9nb0mW7qDln9dXBqjoz8K0saQ="
  ];
  nix.settings.auto-optimise-store = true;

  nix.registry = {
    nixpkgs.flake = inputs.nixpkgs;
    home-manager.flake = inputs.home-manager;
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  nix.optimise = {
    automatic = true;
    dates = ["4:00"];
  };

  programs.nh = {
    enable = true;
    flake = "/home/chamomile/nixos-config";
  };
}
