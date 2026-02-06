{ config, pkgs, ... }: {
  programs.home-manager.enable = true;

  home.username = "chamomile";
  home.homeDirectory = "/home/chamomile";
  home.stateVersion = "25.11";
  home.sessionVariables = {};
  home.packages = with pkgs; [
    bun
  ];

  imports = [
    ./git.nix
    ./shell.nix
  ];
}
