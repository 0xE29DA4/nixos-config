{ config, lib, pkgs, ... }: {
  boot.tmp.cleanOnBoot = true;
  zramSwap.enable = true;
  services.logrotate.checkConfig = false;

  environment.systemPackages = with pkgs; [
    zip unzip
    wget curl tailscale dnsutils rsync
    tree fd ripgrep
    neovim tmux
    pstree htop fastfetch tealdeer
    git mkcert
    sops ssh-to-age
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };
  programs.zsh.enable = true;
}
