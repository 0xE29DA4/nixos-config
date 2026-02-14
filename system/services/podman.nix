{ config, lib, pkgs, ... }: {
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
    defaultNetwork.settings.dns_enabled = true;
    autoPrune.enable = true;
  };

  environment.systemPackages = with pkgs; [
    podman
    podman-compose
  ];

  environment.etc."containers/registries.conf".text = lib.mkForce ''
    unqualified-search-registries = ["docker.io"]
    [[registry]]
    prefix = "docker.io"
    location = "d5nnao6.mirror.aliyuncs.com"
  '';
}

