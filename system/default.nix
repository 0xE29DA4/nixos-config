{ ... }:{
  imports = [
    ./base.nix
    ./nix.nix
    ./fonts.nix
    ./locale.nix
    ./users.nix
    ./network.nix
    ./security.nix

    ./services/openssh.nix
    ./services/dae.nix
    ./services/podman.nix
    ./services/dnsmasq.nix
  ];
}
