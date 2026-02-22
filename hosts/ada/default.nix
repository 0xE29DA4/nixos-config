{
  lib,
  pkgs,
  config,
  ...
}: {
  imports = [./hardware.nix];
  networking.hostName = "ada";
  system.stateVersion = "25.11";
}
