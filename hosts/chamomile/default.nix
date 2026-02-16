{
  lib,
  pkgs,
  config,
  ...
}: {
  imports = [./hardware.nix];
  networking.hostName = "chamomile";
  system.stateVersion = "25.11";
}
