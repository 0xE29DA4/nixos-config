{pkgs, ...}: {
  programs.home-manager.enable = true;
  home.username = "chamomile";
  home.homeDirectory = "/home/chamomile";
  home.stateVersion = "25.11";
  home.packages = with pkgs; [
    # runtime
    gcc
    bun
    nodejs
    rustup
    python3
    # build tools
    cmake
    ninja
    # application
    minio-client
    opencode
  ];
  imports = [
    ./git.nix
    ./shell.nix
    ./zoxide.nix
  ];
}
