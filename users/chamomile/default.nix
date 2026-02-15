{
  config,
  pkgs,
  ...
}: {
  programs.home-manager.enable = true;

  home.username = "chamomile";
  home.homeDirectory = "/home/chamomile";
  home.stateVersion = "25.11";
  home.sessionVariables = {};
  home.packages = with pkgs; [
    bun
    nodejs
    gcc
    rustup
    python3
    cmake
    ninja
    kubectl
    nmap
    tcpdump
    frp
    opencode
  ];

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  imports = [
    ./git.nix
    ./shell.nix
  ];
}
