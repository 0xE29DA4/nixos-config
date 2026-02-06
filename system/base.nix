{ config, lib, pkgs, ... }: {
  boot.tmp.cleanOnBoot = true;
  zramSwap.enable = true;
  services.logrotate.checkConfig = false;

  environment.systemPackages = with pkgs; [
    zip unzip
    wget curl tailscale dnsutils
    tree fd ripgrep
    neovim
    htop fastfetch tealdeer
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
