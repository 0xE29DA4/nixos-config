{ config, lib, pkgs, ... }: {
  boot.tmp.cleanOnBoot = true;
  zramSwap.enable = true;
  services.logrotate.checkConfig = false;

  environment.systemPackages = with pkgs; [
    openssl cron
    nh
    zip unzip xz zstd
    wget curl tailscale dnsutils rsync wireguard-tools
    tree fd ripgrep bat eza jq yq-go zoxide fzf yazi zellij tealdeer
    pstree btop fastfetch
    lm_sensors usbutils pciutils hw-probe
    git direnv
    mkcert
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

