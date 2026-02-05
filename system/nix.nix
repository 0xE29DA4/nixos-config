{ ... }: {
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.substituters = [
    "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
    "https://cache.nixos.org/"
    "https://mic92.cachix.org"
  ];
  nix.settings.trusted-public-keys = [
    "mic92.cachix.org-1:gi8Sa+I96ZB/vjRjEe9nb0mW7qDln9dXBqjoz8K0saQ="
  ];
}
