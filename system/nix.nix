{inputs, ...}: {
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nix.settings.substituters = [
    "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
    "https://cache.nixos.org/"
    "https://mic92.cachix.org"
  ];
  nix.settings.trusted-public-keys = [
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
    clean.enable = true;
    clean.extraArgs = "--keep-since 7d --keep 5";
    flake = "/home/chamomile/nixos-config";
  };
}
